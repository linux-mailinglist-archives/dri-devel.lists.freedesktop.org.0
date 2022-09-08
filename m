Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BA5B277A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399A810E63C;
	Thu,  8 Sep 2022 20:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E218210E63C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662668080; x=1694204080;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:content-transfer-encoding:
 mime-version; bh=cSkZxDmAaoojuRSz0HXj7P6Sq03S3YAZnwrD9YFIUnk=;
 b=Kss4Qf+SHO0eKINAva733TPwTYOIGqkG8CFHWxuiedsDgXgzQS2c6ETu
 cgKIKZ7tRsT07h5vbTle08fWclcuRV3GnHwlBcj51fU2Pkr/XR51W4iqO
 LBCQy0PZAzKdQwh/BuFQYxBZv7Zv7vspsk1ZLJhPaaB4AAwtHl50Ujg+R
 ht3xSDa0A3i0iyMIte1FnNcnpwPf+lKUmTPkamSXhlF7SLILhCid15ju2
 gBzhXXDe6YZ9TXiyci++2JS6yfNkCxgHsf3ay2IYIaso9rl6Wg+CgRWmQ
 37fVnbLEDybdza9yPCEZNXloDn/Qft/xuh0suq2rFktUwUsMbmRSV5VdC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277702030"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="277702030"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="617603968"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2022 13:14:40 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:14:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El/ZsdsgvqoLseWCyX9NdVMNdx2OsVzzm2ORpkKupgnjrrOT1uOwvT2ZeEmp9MtUc/a8fpvK5yh+xEskpG/Ntoxz7CajbX6l0eFkFLLDmUyzLYpp7bcPrYau0Rt/Eekyg0SyR4N2xFZ+bbLKqYl5ypxULfdth0MaL1i0st6Vw3Hrgvg7Hmng2ujJ3NFHROQSakb45LqLusoB4WtYexS0jMpNu7KNLkC8KkrfBvDGpyzwRmsDQKIMvR+/Kgg/eiCDlS1D2bK91oMjAxrOm9ZFwO4tP2Hwa8/XkDqNJ4XL4ei43qW2iYkF7589TS9z95QuUJLFGX3Gy7t2F1/LDr5y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myZap622V3xCr79If1emlSOcty4nMv7L+jCqgkrQsTs=;
 b=Ilf+xcCAE5XbEsa64ygMYQTlkxoJoiYLh1eMzy5/BLjUCgfihhZIWWI7y76qx0YMsPPfwBhstUY+M/QhCmE5gpF9fEGVx81xmqUWTY3mAZrDWKqw8RQ3RetuF61eBg2TIPp8QwLYvSwF6V/CWlzMFWT/DEjAMsD9moFhxhhRXgmalSHTqnNnG9W/F2o2FLyVV1YThfdyznExmclHFcmJdlwwNOuscU1+5MjJ3r59cegZm4kL4lak30z0HHR1dBSe9v3jUYZ2XDPedwLt2x32hGxj9NOGqOGWz49uZQaN/TCyH8BjeGkPrrxkOPMikcqUyubnE1xEJXlrhmZwKYH0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 20:14:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 20:14:38 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Thu, 8 Sep 2022 13:14:36 -0700
Resent-Message-ID: <20220908201436.3b4r7obqk5rzsplg@ldmartin-desk2.lan>
Resent-To: <dri-devel@lists.freedesktop.org>
Authentication-Results: spf=fail (sender IP is 192.55.52.204)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="718702452"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 0/3] drm/i915: A couple of if/else ladder refactors
Date: Thu, 8 Sep 2022 13:08:13 -0700
Message-ID: <20220908-if-ladder-v1-0-9949a713ca08@intel.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-df873
Content-Transfer-Encoding: quoted-printable
X-OrganizationHeadersPreserved: fmsmsx609.amr.corp.intel.com
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-CrossPremisesHeadersFiltered: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-TrafficTypeDiagnostic: BN1NAM02FT051:EE_|MN2PR11MB4269:EE_|CY5PR11MB6139:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: caff18a7-8c61-4189-1d07-08da91d6c14b
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(396003)(366004)(136003)(376002)(38100700002)(316002)(82960400001)(36756003)(41300700001)(37630700001)(4326008)(478600001)(66946007)(83380400001)(66556008)(26005)(8676002)(6486002)(66476007)(2616005)(86362001)(8936002)(6862004)(4744005)(186003)(6506007)(6666004)(2906002)(6512007)(5660300002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:10:22.7227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d7b730-ebc8-4f5f-d310-08da91d6295b
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[192.55.52.204];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: fmsmsx607.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4269
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.5436464
X-MS-Exchange-Processed-By-BccFoldering: 15.20.5588.018
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(425001)(930097); 
X-Microsoft-Antispam-Message-Info: 3gEoRi2iWsOz7eU3hc6SJV1pQ7WblUQaIcf2Lrpjww+GvgiL26hPktrqabmMzL0vSaZDbFYvaV6AuNGIDCASmLGTVzOegE9gwlwg9oo+BCBCXJtnT41QSzO2q+6HRzx1KH/xfqVU0O1kQ6EAyjem8bduoXzwCQZH+5spb5cdNFv6aQmMpCEtlREuKypJoL45fJkQ0W7nK1xHeAZdHSd/w7ffkUCySg5cYDpHUhPvAYMusf40WS3C9OSHhdo255mHL6e1/4nMtcKGBOmmLbbT+7LdrjtIkaEl1DKMPZu8Z+JKjbARhchJcF/AczxMm/UpnvhtwHiHwrR4XtxRRRtvaj4iawsn0yatkE9nDVb8uvfBMAnZUahAx02ruvImFjzfn91RDG901zjQmfhfdEkOLedvyej+K559QFNAdUQxRvuRARd905YVVCjrgQIaXil9tOxUebG3J3nmnh15rfcnhOE6SkIP+yYRBQ8Z5UWsqPz7E5Z6FJ5+gIyKbRgn1Ny1X5B+9RFCzuu7DvqvPQJhzmG7VTVLzwL/rIUIoMEBSo5NyCeBUfhNcroxvJyNuAM/QVnnIxAz9VCnqRvKnXpDxZOydFeXFHlUDQfMzJdqPBThXiK7Vih4XpTiCy0vihSh5EE7pgCm15ejEZ3r1X5ikYUX6s6L4KDqcL217gWGPuHCRiC8Lw+1PoHMw9UTZi66IIRSgeRKdKrsSzV9icP+Bg==
X-TUID: hgy45J41WdO1
X-ClientProxiedBy: BY5PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 25d7b730-ebc8-4f5f-d310-08da91d6295b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VwN0tGdjV2LzNQMWxnMlE1MUE1N29kYkpKUzlDUlF3MWt6a3FJMWl2MVFC?=
 =?utf-8?B?ZmFaWE01RTltZEJybnRVV1gvSkFNQm8rNXJJbEhSRzdjTUVtaEJOKzF6SS9Q?=
 =?utf-8?B?S0QybzRXV1FkQmRYMjhFSjk0MlUxMENKSVlUK3FaR215Rm4yV3F4bjBUZUly?=
 =?utf-8?B?bUJrb1ZFRHpydjFJYjN5dXNzcWJqMzVaTytjVHZyeXp1L3VUV2xZYXFWSGpK?=
 =?utf-8?B?dERPeGwrZ0JqdHJ4K1Evc0JxdXZCMGNsbXE2ZmdaVUhraGYrbjRiTndpRjkz?=
 =?utf-8?B?SjF1eUtqMzRGS1YySngzT0ZmcUNTZFk2THQ5VDlyQkl6ZjRBVHpGbm1WVVNL?=
 =?utf-8?B?UE1FYXU5K3VaV3JuVEZLbG1WUkVLT29DNzlreUhFZDFJTU9nTlFPNk91VGFk?=
 =?utf-8?B?V0pXY29VMThlQ0tNa1ZnbStkYkJySDNOa1FIYjloa1MyWUdBMElqMmI1OWd0?=
 =?utf-8?B?MDhReHcyaUcvQzBZbjI2VDBYd3ZadTVueDY4QTZpQWRoOTY1eFphbFY1eUE4?=
 =?utf-8?B?MW55eDNIeXlqVnA1bTJMRVZGUEZ0T1NGclp0OUFrQ3pzM3RnR1FPandzTUJy?=
 =?utf-8?B?RUhSayt1a3VBLzJUMHV4U2QxZ3BMNGhUdmVOVENDT3htd0xRekpFWUZZRHpW?=
 =?utf-8?B?MVRnZ3BlczF3Qm1ZamQxNllRdlc5cUhzdW5ZZHR0YVVzSitOYW1yRFVrdzlK?=
 =?utf-8?B?VVliUmdEeTFDc0t5OWVjSjdFTklYNlJvQjhQOTdWN3hzb2lHSWdPZjBNaHNG?=
 =?utf-8?B?WkFxa0hFejJmTHczRGdwL2dWb2JCTVFiMDNQczFsd2IvOXJsOUtoWEdja29M?=
 =?utf-8?B?TjRaV1ZmOTNvOGV6S1Ira0haRks2cGlRKzNDbDF6SzJwVzFPWDZGUTBWQStB?=
 =?utf-8?B?Yk9ieHNYRW82dWIyVlJpOE1WQlQ1Zm9RdlU3OTVtV2xjQjJRc1NWM05HNkRN?=
 =?utf-8?B?dW9jV0pQblJQNm1vNnBLRnJJRXppaTNXdDUxU0tWUzB6ZFRCdTZoSGxhYUxG?=
 =?utf-8?B?cnFFQUZsT1oyMExOZDZlUXgrZWZsRGRheUtoUVBPOUtlOWpxSHFFeVNYZWlK?=
 =?utf-8?B?S3ZHZFBxTUZFM3RmLzYvTVB3bVF6eURiWFBUd3ZCOElzaGV2M0k5dCtHdkRh?=
 =?utf-8?B?VjJGbU9qbEFpbCtiaCtzR0t3dUJUVEtiNFFlVHNhUCs5c0F4US9mU1JZajZh?=
 =?utf-8?B?VXY3OEdWSUc5K2F5S0FKN0U3Y3JHL2FjcmttUlBFTExjWFB3Y01BMlBHNk5i?=
 =?utf-8?B?NXdIeFlIYmRvYklzclNRM0xCY2tYcEQ3Nmt5N0haMGpNbjkvcDAwYXpDVFcy?=
 =?utf-8?B?aWJUM3hkdzZ4aUJDc21jOWYrTjQxR2FjckpsUFR0SVNkVmNRc3A2a3Q0bXBV?=
 =?utf-8?B?L0ZpTDAwRXZ2S3Y4endEQXFqUUpjeDBLQ2dtdW5peXgxTnRLeE8wUDNuN3dK?=
 =?utf-8?B?WXJrTEpGZHhLRkVWQTQvMjEyQjdCNDFwU21WSkhDREFDd3BsakE0WmsyQkZu?=
 =?utf-8?B?SEFIYk1zL3pJczdoMkdEK09iWWI1YWYwT3JneGsxbnpxbjlWL2ovOVRnRVgv?=
 =?utf-8?B?QzBZVW1xdkhSRlZkeEVQbUttcWRicGplQXVpdXNSdGNRbnRwMXV3bTVrUTJZ?=
 =?utf-8?B?WXM5cVIxb0l2TVdmUDB3Wlp3eWxMUWlWY1FaMlJVN0g4cU1kdHo2M0hqbk80?=
 =?utf-8?B?alpnd2lxeGVMWXdUOTNXbWY1MXhUVndueXdwNEI4L1g2bU9kUExLZHNCVjlD?=
 =?utf-8?B?V0ZmSkpYK3NVcTUxdzN4enhVaW9OWTh3REMzMHJlMWxaSjhiVW04T2s0RFZY?=
 =?utf-8?B?bDBvZ0JJL1hvNXVrR0h4R3ZvQWo4cHVOVzZ4aGdQNjM2dnJNaXBwVWxpNFpP?=
 =?utf-8?B?QmRmZ3ZJOFJxSWxQeWw4SHdqSXg4d1JBR20yNXRmeW1lNEM4ODJPN2NmeUs1?=
 =?utf-8?B?RkVVSXdsWnZxMU4yZlo2QnRoS2ZUMENDLzlZMzFJZVZ0dW1yNGZYemNBWGRk?=
 =?utf-8?B?M0p3NzNMQk5nRW9YK3p1RzQ3b3pxSUpqZWlReFZvRmhwSWUwMlkzam1HNzNY?=
 =?utf-8?B?eXBSLzl4S2p2TkNkOUdDWmFKb0cyb0ZoZUt6dXp5UWRsSHlWdnk2QjVjUnpK?=
 =?utf-8?B?TnluUzk1d0RBQ3BTTFhXMVhWN1o5MGgrL1pXbTR4Z3R3NmpBeXRxTEc4OW50?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caff18a7-8c61-4189-1d07-08da91d6c14b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:14:38.0019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EO3N3O4DZPjigkc/zRS5KZS5uVCSuKssspCKwiql/NskvPco/M8plvIo7zFpjIRtY8UEUJ7TIAlvTWwXJ73FB1s2N5iMVtaVzb+pINppZAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor code to follow the same convention as last platform first.  This=
=0D
series includes one patch that had already been reviewed, for frequency rea=
d=0D
and 2 more refactors.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
=0D
---=0D
Lucas De Marchi (3):=0D
      drm/i915: Invert if/else ladder for frequency read=0D
      drm/i915/gt: Extract per-platform function for frequency read=0D
      drm/i915: Invert if/else ladder for stolen init=0D
=0D
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c     |  51 +++-----=0D
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c | 171 +++++++++++----------=
----=0D
 2 files changed, 93 insertions(+), 129 deletions(-)=0D
---=0D
base-commit: adc57f2b82896fed07bc8e34956c15bb1448fca2=0D
change-id: 20220908-if-ladder-df33a06d4f4e=0D
=0D
Best regards,=0D
-- =0D
Lucas De Marchi <lucas.demarchi@intel.com>=0D
