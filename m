Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17CC7EB5C5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27BD10E4A1;
	Tue, 14 Nov 2023 17:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5AD10E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699984012; x=1731520012;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EZzcb9qBUHmq7zBLy9ldqVPJY0U1GOn+VQcM4B2o5as=;
 b=mUKiOdrM+MGZbxwIy+7VTHnkmRAOrO3cyRZFybWnWAGmS1CS+u60iLS/
 jiSWQCSA4ub/9r5UKJTiZAhzvsqFB7StCYgl+vLNUuBwXuuxMrv/ZsUuw
 Tu1gqbgjWF3UCdGE/05hz0HNJN7JibV5nuJaXBI7/7h1FybSeVSvbz5ve
 xHp1vPYAexEpYihwlEoaeybQArjEYw7X3XBq+k5Y92ACjAsnkE45kJlBD
 Xr76xEyJzApYPjPTHMgeFwK3Ne6toFl1J5AyUY/SrrqEHJiTbLCFe7gsU
 mM5QTLQaeHEc/slZoM65cSggkwL5j1/2TTcmAOf+nPaDZ/It9JHwZ93St A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390506822"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="390506822"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="758240189"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="758240189"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 09:46:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 09:46:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 09:46:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 09:46:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceG0jJuqnk+Q3hhoFO5OfpFRl5jWwIQ8nsj3jUkCVwi33Cn9ucMJgN7mnh5sqx8RsfnEKMihJaGgyvaAKKWggIN617SlxDQfca8zAM7FJxCVaLQsYcuBvsymSk9IV9FQMqkIz/2q3r+CboIJ38rC0V000A+5tQ8v7IfVDvIuekFpNCLIJpof5rXtY9AqHBk+UmxPsSdwtpajZEsvBlrxjCb1lqvH3kwXyOVEj+xUthJBJc628X7453HiEb/5YkNAS7DEdD0X7P9iq/AJ3qrmqVFi6ulJLeeZZBCoYN0QR2A9C5Ge6iWDQhwtBLhutMdVQ5oIWFjt0YeF7dkwkdbRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZzcb9qBUHmq7zBLy9ldqVPJY0U1GOn+VQcM4B2o5as=;
 b=oT2aJVb4cPOmRNX+RN9o4RgP+j5AXQzEbNTDLcdwB+FMzu0DmakSB+KlZ09B+GlZ10wX/XOk0nGFl1ReE+Bm9qHspOngCHTLKdSgHJAVDCUP00fhRCRQqwvyeitJYG655pqHkcpnT6W1JqZ6OxMW03qQ/PakFDyp0/eFi5Ry6z9EeKVMxX91EPYegv08UH+CMzsara8YZyKwK8c54jhFa6kkzfXVF0z4/u/5SahG/F4liXTXerQobzJwpOocPOYaISBQbREfX0KlcLIOdjUCcSVQ2CbZJ11eWhYULvCXogZexpanB4YlicbEEcWJh0qBFqE0TQbb9RZ2NZf43+HDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 17:46:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 17:46:48 +0000
Date: Tue, 14 Nov 2023 11:46:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH] iosys-map: Rename locals used inside macros
Message-ID: <nfmg3erwdbacza2pma6fxrkwpqc2ehv6ifia6uukyjz6yfp5so@usmitnkmybra>
References: <20231024110710.3039807-1-michal.winiarski@intel.com>
 <g7y5ivgobnrccjjtdczrj5gcksc5bftutkz4zeeynn6os3rkac@e44pxi6wng43>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <g7y5ivgobnrccjjtdczrj5gcksc5bftutkz4zeeynn6os3rkac@e44pxi6wng43>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d63c4f-9a25-429f-c476-08dbe539ad44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjPF9X/vpbwuG8oShUoJcMiKGyNyo0jsFxrhnUJnENvN/AE79LY8EcujOTQYeqm0jwlRCjjbqioAa/Uz+Mpm9kaCCe51qDPuvSfyioIIokijeMNR2KrbLi5egRNCjv5naR7etueoLR6FjrnTCNeSMp5ZyWOeb/MlxcTXgawXZ61dTiJwdJsejC3ZSW63L/8lqYFRBpo2qNb2fefGnPcNmHhLdtVfsLxPZT3+Nymnp5saW81QrVuaDI1LgHkld3RkL+C3LQDRLEdg5g+dknX4Gasgd/p/2FrP3mLbpghzbKLjFlFN214asJGHUtyTven/oJQ+h0FpB3HpfD/Xn/+2gybaVTWpGFlCsRGG3vbb0jl7cz10B2CSanB4j9GQPBzufj1y7WcEOQs/SF6JQO6vD1yekxAjwihdt+pXMxxlqvJo8BB4JRgKA7nEIpsK9uzlfqc8pYmE0Hhw3xVtdJyjVAjML9RAJ7I0OkePXonK+KyXYqD32ipgz+VbQxH6JAN3MyRoBuBzTJROX3AbZMS76jYPgQuV6ZJSWNY1cHeSVdk6g532RIeQmnM/yV4rdDWn0RBKi3iM43jWLP8//44N3814sitMIA18E0GSvjfRpn49cz8+lvburg70d5lKmyFQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(366004)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6862004)(4744005)(86362001)(4326008)(8936002)(8676002)(33716001)(2906002)(26005)(478600001)(6486002)(66946007)(82960400001)(66476007)(66556008)(6506007)(38100700002)(5660300002)(316002)(6512007)(9686003)(6636002)(83380400001)(41300700001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFiOXdtMFRxRlVHY1dnL3l2aTUvQ0o0OVFyRWlHRFMwTUE0T0dBVkF0RWZa?=
 =?utf-8?B?NTBNMzJTTWxwcEV6QVNJdzZrSS91aVdtdzIrYlI2VDd4WHpLK3FveERDTytp?=
 =?utf-8?B?emszdmtWSCtFdTg3dk1tVVdtV29xNXM2c3Q3WXJrdjBlcldNZXp0aGRXR0pD?=
 =?utf-8?B?cGl5VVlIdHp1WFNUVEp2VHJFWkVqNE9wejU2TjRtanY3WWZURFBXSmx1d3Vx?=
 =?utf-8?B?bklKYkRkeUdUZEJjZEJHdmFBYVZEMWlXUDcxSDNNczViNUt3OU1ScTdONTBQ?=
 =?utf-8?B?UStIOEQ1bnJqQjJoeDVpanAwZ2xOOXdVdW1TVVhCcmd6ZUdxOFo0SHVlMk50?=
 =?utf-8?B?WE0veEZQazJHOFJCTjJsVXk3NVhUYmJCZk5jTzhmOTdZVDkxb1NKUWRaZHhV?=
 =?utf-8?B?K2ZNZXpnSkh5ZWkvbkppcnM3MDFZdko4T2FQZ3V2b09tRHpvVGEwbFMvUW1r?=
 =?utf-8?B?eHVpekw0aGRSeWttOTZUaXE2clduNEQ4eDhrQmxqVHQvNUMybmRKMkF5bmRT?=
 =?utf-8?B?azFLL3NlYWNnQzkyMTZTbENtZTUxMDc0NldwblNFbzBKcnljNGRQRlZaR3V1?=
 =?utf-8?B?YVY5YUhvL0xPa29PVHoxMndoeS9WdUs5Q0JtSFlXM09PU0J3RVBHNjYyWlpL?=
 =?utf-8?B?ZXFCVnIxcnZvU0ZMN05qbVNQU1lsc3B1cmFBLzFvakszTSszOHc2eThrMWtD?=
 =?utf-8?B?YWlxYm8zR2hwRVI3b1gvVUV4NVhycFpqSUROcXFNalVPQW9pNVNVcXF1MHVh?=
 =?utf-8?B?WExBM01KcC9ERHBodHVENGhRZCtDaFgvTnpQdFVxTFlIUmpKeEVpR3BHYVVu?=
 =?utf-8?B?Mi9BVzk5WjQ0V2ZqSWFtdlQ3QWFoVHIzZ2Y5cWF5Yml2bXVZQTlkc21ZZ1Zz?=
 =?utf-8?B?QzBselkxcmJpN0ZDQXRlbzUxVFFPLzRBMGE4enZUTlJ4a3ZRcDVJVlk4UUZP?=
 =?utf-8?B?ZHdzQTlxVThkMEFxYUhneGFNR1dWQnd6UWsrZVcwM2xWdEk1R2lzeUliZ2VF?=
 =?utf-8?B?eCt4UWpJSHc3cUhRMWR1UmdzcUdRaGtTM1liYUdSTjFkVngzYTBhNnNpbnlG?=
 =?utf-8?B?K3BsRzhTWUE4RmltYVFFdGJtYk5yZWdmeWl6eTR6MzhCdG5XZTQwYnJIVThT?=
 =?utf-8?B?QzQrSFZiamJSanFVMkIzUkMxOU9pR0dKQ0FjWWRBYkVoZWxaanZTK2NXRTh2?=
 =?utf-8?B?T1JxdDZCalJaNStlN2ZHbkprL0VhWDVvS1c5bXhSTk1tQUtrZFdpSU1vM1Av?=
 =?utf-8?B?WXFDNE5DbGROUTVVTTJJMXZqNzNNd09hU3EwTjRnbVR4U1hhY05aV1Q4ZFZ6?=
 =?utf-8?B?VXdrVDBlMHdSYzRvcjlYdDJoeWpNWXNRUnJQUGxvZGtHWDBtakxBVmdVbkdz?=
 =?utf-8?B?OGhJWElkaU9iSHdpUWVHQTNOcERwaFljNnBIMFBzTHVtZUZVSHVpM2t4RHZx?=
 =?utf-8?B?U2dtVndEcHQva1JCTGxVZkl5dFBqZ0JoNXNsZ2xpbzdQM0drd1NhaXpMc3F4?=
 =?utf-8?B?cHZuSWZydDdVZm02Z2J1NGEwcyswR2c4a2xxTmc0ZWJBcm50TWhOb1BSNGJL?=
 =?utf-8?B?N2M4NDlDMzdUOEU1MWVqUEdtTmN0TFhHMHFvbnBjUk9TSFRFSngzRmthb3A3?=
 =?utf-8?B?LzNwWXk1NjE1YXI1a1hiM25peC9xWUVodnlVakNjNjVYNTdDOHRMN2J0UWJX?=
 =?utf-8?B?aDlVMGlEaHJITEh2M1R4OUJkaXNnS0ZwZG9PQ0NSS3RUeEsyb0ZJS1VUcENZ?=
 =?utf-8?B?ZDIxNm1TYURiMFhTZVU2aTljZUVWSUMrNHlVZkJtM1RiamZxNUtoSDhGQ09E?=
 =?utf-8?B?bmsvMDN3bi94djM2YjBzV2NNbWliTXJDYVN6ckVvQTBKNGMwUDE0T2NrVlh2?=
 =?utf-8?B?SmZreG9HbzZCMExnWFNtRlAzRG1KTnNYNDBmaHNhTm1PaDkzMnFxNDkwTjBa?=
 =?utf-8?B?b3NKQ3htK0llaGYrdHZHWHZWTDFCMDlhanFXbHNucmRmRkd2enFIYmdzQnpM?=
 =?utf-8?B?S05DM2F0OU1lNkNFSjRFMFZ5Y24zdzNBK1ZGek10OVljYkRZVTFMaTFjTHBG?=
 =?utf-8?B?bExGMG1YZ1kyQnRxZHN2eDd6elpMSnF4cXI3Q3RjUDQrb3BsVWtqamV1ZVVm?=
 =?utf-8?B?bmFBdWUrNUpHTVV2bWdMVGd4bWlZa0xXTWEzWEpSNE8zRTE1QmxGZnZ4MkZR?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d63c4f-9a25-429f-c476-08dbe539ad44
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 17:46:48.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pf+17qRvlyzZ7Ot3wvl+kvnF7jo3IN0nzet4o9HZRO2Lrtg+uo4zsKIudP8Uk72MT5yqu9HOAf/eSU0M54QZnyjYEC9JU7uarKI1x8mgr9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5630
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 08:10:32AM -0500, Lucas De Marchi wrote:
>On Tue, Oct 24, 2023 at 01:07:10PM +0200, Michał Winiarski wrote:
>>Widely used variable names can be used by macro users, potentially
>>leading to name collisions.
>>Suffix locals used inside the macros with an underscore, to reduce the
>>collision potential.
>>
>>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>
>`git show --color-words` shows this is doing exactly what it should.
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

applied to drm-misc-next. Thanks

Lucas De Marchi

>
>Maybe note in the commit message the compilation error we get with
>clang? Although that's in the xe driver that is still not merged
>upstream... so not really required.
>
>thanks
>Lucas De Marchi
