Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA467B889
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 18:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C76810E805;
	Wed, 25 Jan 2023 17:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5AF10E0FD;
 Wed, 25 Jan 2023 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674667738; x=1706203738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fG6Qa4Y/ugyzbeKhZ90+MDKmDvgwxYg31QbW924pWPI=;
 b=Yfb3PE/Zki/ajv9X2EWcnqB2shJWBNL2N+PlkGKu1bwLNk+tCoTC+w1+
 ZulF92MckXfAlGADhyZ9JY9JsrnWSkYLBviVk+BY4qrV68SstVft/Z6ck
 U2r8cZrmylx5Lmz04oqurzfPfQgxrmuPHWk8rHh29eOk+FHE8PWJO3wCF
 NZX7nJrw4jawBjuOULP6XnlQGP1MbMNfGuFbmvxjEg5nkz0fVEbRMZRpG
 6/PpjD1YBHTYU+/QlS7ms0hu+PRXZE7/CYBf/ughXZLZRXrDstJv3PA2A
 lLc/jlSMWIp1X97yKOGnY/pxF2YEE3+UqtNM3P3kQRWP6eL430/PWNUur Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="328704254"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="328704254"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 09:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="640014338"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="640014338"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 25 Jan 2023 09:28:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 09:28:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 09:28:42 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 09:28:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7u/qWcMAJdgT9ysWDfrH2ypJ4YOLHIp7PFsOOyLGY54iKIvlYSLR6grx1I4XqEWy0EERdtxFIe8KBh2Tv96B/UbCN3pq5TV7U3QFmM8q8fPFVMD0JWJlfZ0UcxJtk6aVY8CdlPCaU8s1OkzqrH6GJ9hG41uB/QpMDb8vKubtknkmNxmfD2ItvIyrIBv0j9xecs7vcQWyns5jeVFgKxaXb1R6BehEQHXo3kOOQVMBBU9bDr/LS+USbAZTUgpN7NmvfkPaVi6ejF1afRVDjDm6LpHO092KtIVTIr18UnqyZGLP74r6OuEH6QZWXo/9egJtn916qnRdRALoQ+opkG6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5k8cHrwENENrSd8fdYjZDiywUJf3VbGFl3p49j0mTI=;
 b=jc+Hk/wyRnsm4qQ/NgMygL76AVt/YAw5lfS9timSGy6jVOYwYZEvMK/ddJxUC8kuVhV+JUiwN8CBC/0fA53BaTXNdzYnWG7OF8DlIQaY56V3FDMkCCJUYhIpwSAqsr5ULlhH0bLtMT2PlN1x5YedMcImLUcD+GBkpSgfvqw6pug/SvcdvNdSWNXtq7ZPbS68wd+Z/VtKE2Rb7o7J/MNSOkOKvKqIXmjVgwbES1SrVh6oRKxFO0Fn150mNejCOSG5cgcSzj3G0SLqZNUq4N/280GxCrQaEG3eONbAz7y5EyL+ZGsWEe1BULKlO3aYiniri9FoJbDB2i07y8SXublnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 17:28:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 17:28:35 +0000
Date: Wed, 25 Jan 2023 12:28:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v7 3/6] mei: clean pending read with vtag on bus
Message-ID: <Y9FmvUujJeijwZXi@intel.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
 <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230125082637.118970-4-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: PH0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e863620-e9d8-4671-f780-08dafef996ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: psRcBqr2Fhdf/gDQXZC67tu/WwqlWGk9qnPY7OMMqfSTuEv9ZpGuLJGSsQ46GiQIonaHK5zI7vcI0Ai1aOCEcxjSayfSBL92vgE369PddlhEMVWqB+4JItQNbasseKBTxDvBYMQCC+ds/UZQ2G3EVCKARFEfEHUGKCFuwGiXw1g79y8a9H0zLh9ZTU8BptR5ECaO2b7B3MBD6H+y3AXm6cLWHBAcYoVSbibw9iJmwYa8DJgZPkNiJ6TQnevWs71gtMzDI74YADRsHOWoOquXY9JxCTaQgFtO8Nr8qyoKAM/xpg9/l6+hNllkcJVLdeCG9geTpmYkBuz4QwMCldgX6A+LER8agCgxijnWDqtJr0XGxAaJWGU8vxz1ivcbmfI3uOGEZh78u7ONwFkF7iJJyMHRnlm7puVzqdXfodONkxpKQBS2sZGUl+C17p4RKGjrgxVo2LxnAkrg5SPnjtzJ+SKPCiQdz4Hpn9CHuQeNw1tqh0Tq2FBhG6ZSZ2agB0HTvTmfer6qLUA/mBOzzTbg+jFRkZ5cnbS2w47qHYQEXFoeZzgWE/amH8owTEgIUG0tFlRIk5y0UE87nuk7TfhBuF6Qo6CucU5WAjSytsqyAhwTApQ3YeCjtVU6RTD/VHPrgFpmNHKjwPLXjBzOTUUL6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(36756003)(6636002)(8676002)(37006003)(316002)(6506007)(6486002)(5660300002)(107886003)(6666004)(44832011)(478600001)(2906002)(6862004)(66476007)(66556008)(41300700001)(4326008)(8936002)(66946007)(82960400001)(38100700002)(54906003)(83380400001)(26005)(86362001)(6512007)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o9udH9udV4FVGekl1obCf9iFTNqCw0eQEoJWSN/gSbHsINRNlprja+l178IZ?=
 =?us-ascii?Q?cZeTKxzC+fQHBIuNSKAv9gAmtT+Lo0A+7BU+LmgYwbkj8ozaPeJqFlju3eBk?=
 =?us-ascii?Q?zm+qEYxyobymv+Ly7Rjcneh7MpXu67z61NoDw0VnnGOnrBPNnue0lQD2yM/+?=
 =?us-ascii?Q?Z6qgD+cXvaky+A00hKRwFjMbibPscj0j28j0jY/ENFEgY3oKW+RtNYwUKUaM?=
 =?us-ascii?Q?eKIWy6vgFsNIATBmNWOhs2eVi910B2DDkHTrFz7Dx/t/2r00V3swDuEvaGsa?=
 =?us-ascii?Q?pXwtTq6eaXeK9TADI9aBET6khBk86BJE67YbazYRZACGtA0JCOEeu2KmyQPI?=
 =?us-ascii?Q?tpaPl5hfynEv9gC/tz/CQCdDBOt7LlGGT3o/0z5gc04iiHw7AOMOFJldw4Os?=
 =?us-ascii?Q?S0BrFzcZMsP2nb5iiNdK4CEp6mfAR88WaQy8CYFQjz4V+daoG3HSk2ju5aFw?=
 =?us-ascii?Q?wo3ih3OK+YLCN6HINp7u5muS9LWtSN9FZj2wlafVNFSXtJkxrdqwNLECXPUR?=
 =?us-ascii?Q?mBywmCFBhQfuAksxvxxGo4WIr4MbJ+gGXjQytSnuJFdiazhM9/d/xwM2TZk4?=
 =?us-ascii?Q?ttxzEBJ+VwNMSCY9UTwrviVfMaEoB6ToDWppzjbtr068kGQhyWjNxmn/pYRb?=
 =?us-ascii?Q?z3jhDZo8q1YjHif7z5vwRu3NSrS52VlLd3ey5WA9CsQ+EQHjfqzwliwQQkkt?=
 =?us-ascii?Q?wf7krx1yfGeY7nwcGLJoi9iCTaHggwVpTnn3QwmewtGt/uzFzS4xhCaZNDKp?=
 =?us-ascii?Q?JJCPczex9OLAhcE/7Ee57y+PHyRDG/knUDKLIjMKyOB7Wh3naLl76/+Ua/Dj?=
 =?us-ascii?Q?eTCmjMqVbhbr0yE1oddQOHDeNq5NgjPwimdJPxFsq87s5XUyCBnBXEGohi9W?=
 =?us-ascii?Q?RLc0zgEa9JFvwOG1cbCfNVK8qBp534AYJvm23ELWuK6JGJGWkY970xQti7xL?=
 =?us-ascii?Q?2nplvLp6P59oPI7H9cPVJeoDALtRY9QpTTzDUJ2HGj8v2qVs/HVzPZ4MPybW?=
 =?us-ascii?Q?G3EVTHzUwgo7tdwE6kyKSUXtqTRNWK3H2Cdau/qQACl7+EBpopp6+Bs54L94?=
 =?us-ascii?Q?HIO70t2OVShlPHCGGBV6PUK0C4NE55dYaa0/wBEveHDEH33jqgquve9fmJId?=
 =?us-ascii?Q?f/0tSC25+TqRBwZQ0P6bxWhsNdfHNmjW5jch1XEGXQrOlyNwXFLgY8KHKJ8h?=
 =?us-ascii?Q?qNFsWS/pTgWHZKCfZ90VgH5h3Vj3KqPFHUHorNWUhqd9BDsdYDkCX5pyF68X?=
 =?us-ascii?Q?zkFKZE41nIk3rfdPOfCkvh6sAF5ls8xbBX7sri5uo0ZAnDjcT3wx2ka+nTWN?=
 =?us-ascii?Q?+M0A5uj9bHJp89QR6CNuYmloCxQCB4gplH78VQzFQ6t9ZwbZGQso93Act12Q?=
 =?us-ascii?Q?yhC85ht6QWPQVK7ffQv6YsbgrK3YV/8qrbgAjomI2KMixToYMTXlUYZhjo0S?=
 =?us-ascii?Q?Td5pBsM2d6mSypLWIx9KDn4GOuJes7kuoPNgYaNiL+LSec1h2lYrI1M/ruNG?=
 =?us-ascii?Q?8KD36KWoSKvowlCpPjfgpFBwHoe/O2FTbsqaV8YwoU72Bnq4nSzanw8pD5JV?=
 =?us-ascii?Q?0RirIIimz4KwqDscN/4NrPy7wf4n/iiCSRADufc4FHy4Rd0pfsSo9DsUJIQ1?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e863620-e9d8-4671-f780-08dafef996ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 17:28:35.7635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N91i2OXsHmpHYz7iBKvenYHZ+Mll19bRb1IkQfnwnLjpC4C1k7bkz6FuMF2ynHsq3RujfuW+ZIPzZ8K9ERIy2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Juston Li <justonli@chromium.org>, Vivi@freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Greg, ack on getting these 3 mei patches merged through intel-gfx?

On Wed, Jan 25, 2023 at 12:26:34AM -0800, Alan Previn wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Client on bus have only one vtag map slot and should disregard the vtag
> value when cleaning pending read flag.
> Fixes read flow control message unexpectedly generated when
> clent on bus send messages with different vtags.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/misc/mei/client.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 9ddb854b8155..5c19097266fe 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -1343,7 +1343,9 @@ static void mei_cl_reset_read_by_vtag(const struct mei_cl *cl, u8 vtag)
>  	struct mei_cl_vtag *vtag_l;
>  
>  	list_for_each_entry(vtag_l, &cl->vtag_map, list) {
> -		if (vtag_l->vtag == vtag) {
> +		/* The client on bus has one fixed vtag map */
> +		if ((cl->cldev && mei_cldev_enabled(cl->cldev)) ||
> +		    vtag_l->vtag == vtag) {
>  			vtag_l->pending_read = false;
>  			break;
>  		}
> -- 
> 2.39.0
> 
