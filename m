Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9445B277E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132BE10E649;
	Thu,  8 Sep 2022 20:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5DA10E649
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662668090; x=1694204090;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=wer7WlJsZkOlZg1NBaSZBeP9f7FzEjwqK1McwRdzGJA=;
 b=FNtg8L91hxpV36zG+i5S4QDQl0z21EJD2XEbMH/UdUKvTfCA/IAtlTpJ
 s2akMoKdyyvhNaeHBXX9NP8OKlNoAy2En//gqtiDA66FZxmgNK/lpri2J
 LGZ69+yWGecWhgevwvv4dFK/2wYEtyV5yFCu/46alChmx0XNHVfyD3WAJ
 YghHl/k+yKvbeAgpaxY1yEiUfTxo/cUXRXvYjVvzz0SPiqNwd65pqX9By
 7r+e+yr4Uz1zSbo4t2xdJrrAkkdrWOE906sH0NPtGh/XiBnUqbSOb41IE
 75HFgqaQuWGcMeVP4KKFWHLWb0E0cMuAS41WITK/MEHckOYF3U3qmPvZa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277048457"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="277048457"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="615024875"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 08 Sep 2022 13:14:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:14:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKd5VETKeadpGt+oUzay9OdRNLQ0PBVPECKL3tER49iEvf30dthTuiV5AzRmtmDHR/X/dy5Z77/lqnf7k6nIvSkIcc78B7cD9+wQHYQf74Oo8yJaq4iTXJhNcjpgYMZRveBL9/5hz5Elfb/I6EkNgif0K4CM9SmHYmt12R2MgElCkcBfUtCYgQw/eTyitQcD2ok19l+fHmu+LNoBYr7I059LpgJ6+INO/A6iAVBvh7f3zotZ7Bh/aJzhEF9P9vjPNsdITONfBmUWkxx0rTs1+oWW3AzhfgfRTgKFAGoxFzzkE9kVJ2CjXOz2ime+HK2X3WcHXFw/kFlZWkNMap8ibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l8PsCNbtDHthtk5Gm+Wpc6aCkNG98qM9Z/tkTak1Nk=;
 b=mYG6qYYhZfowPMk1Yahuz4xIvjn7A+m+/6vOn6otRMt6+l63H16yLRCKzYviUqTUjiS6duP4KhiRkCbZWfZXuVHsbOKuWZ8KmojXWeM07K9yjKuCQ0obuBWZ7Ozi2zSwNYNJuSaT5q35U26d+ThBtO2L8njqKND8WJT6q1h7vq1a29Ur3owsoeOLMBC/5yJ8woNwDpTLEGid8YooyctMJmGDT12FinD7M5UK1F6pwcD1k88xXI5yEAFNDqrgYNFdpiO0TIMkE8zBpevNaSzbrzy2patRj5mOShUJqcVjqvRdYPDApaL+wy6M9XXChYaRa2a3Z2W1zT1bzt9LOXokPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 20:14:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 20:14:47 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Thu, 8 Sep 2022 13:14:45 -0700
Resent-Message-ID: <20220908201445.bnylscth33wjb3ih@ldmartin-desk2.lan>
Resent-To: <dri-devel@lists.freedesktop.org>
Authentication-Results: spf=fail (sender IP is 192.55.55.68)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="718702459"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 1/3] drm/i915: Invert if/else ladder for frequency read
Date: Thu, 8 Sep 2022 13:08:14 -0700
Message-ID: <20220908-if-ladder-v1-1-9949a713ca08@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908-if-ladder-v1-0-9949a713ca08@intel.com>
References: <20220908-if-ladder-v1-0-9949a713ca08@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-df873
Content-Transfer-Encoding: 8bit
X-OrganizationHeadersPreserved: fmsmsx603.amr.corp.intel.com
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-CrossPremisesHeadersFiltered: BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-TrafficTypeDiagnostic: BN1NAM02FT015:EE_|DM6PR11MB4345:EE_|CY5PR11MB6139:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cb714c-3aa9-4998-1b88-08da91d6c6ee
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(396003)(366004)(136003)(376002)(38100700002)(316002)(82960400001)(36756003)(41300700001)(54906003)(37630700001)(4326008)(478600001)(66946007)(83380400001)(66556008)(26005)(8676002)(6486002)(66476007)(2616005)(86362001)(8936002)(6862004)(186003)(6506007)(6666004)(2906002)(6512007)(5660300002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:10:20.8141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f344ba-2b85-4a3c-1f05-08da91d62842
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[192.55.55.68];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: fmsmsx607.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4345
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.6809255
X-MS-Exchange-Processed-By-BccFoldering: 15.20.5588.018
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(425001)(930097); 
X-Microsoft-Antispam-Message-Info: zo1Lnv6eplI6G88/PsMG7qRTiIYglI87YRkrMSGQq+e5SD1EOENjnyIC4TK2df36TxuER/L9YAvSTT9B6Ped+7bGzzg2C+K4hWY5TqdDZXfVk6h8WhKh3IFBvHS3YqlrHOQzH2/sKJVRvzbQEviFxnZYM/2qovQ8l86KZ4O+kVy0kMzXutl3As0e+sxS1qy64odYZdS3cd2SpJHmP7xxdEr4E943Rr9iKTsQCYLgZf5QCyrtYJquTnTzeYjhlSUhiN3WO5x5ffORBJeQYxwbzbD3Sols50wq2f1/pXMAVlisEovIVMI3+p9cwDo22VpooTd7GqgnFKxDicOCEFOhyL5tuQVtzcyyGkWXRDuzZzAViWvtv9UtMI/Q2owOeSvD8iVseE2uWsh6odyitsvVTzTnckjGFh61H1NaTK4UCDsBWMjeGipIm07KOqWsAFMs8jfSxieESfih2jpkhFUmaN0BhG/3pS8X2IpSlQ+kXwNywLsdb+n44xEDWQpfrU30vTS+TpnvUT1qph3B0ExwiqaPvZWtwrufPyvSFltc+0vlPf3N2ojfsixLqKRg8PrOVSgjBTDpTKGeU79M4msU/mDyGqTG0hjucKmrH9EW8U18XOKad34tauPxn8h5KB+BGHX1fzVMYn0aRoIuDPa18nU6Grf/CD5N4LRqv/KRh0G+TwzvWRzRXBpI1lGKxM2aJuAwALjTYzW/aLF3BP0Lhg==
X-TUID: xi44ppWRCmh3
X-ClientProxiedBy: MW4PR04CA0121.namprd04.prod.outlook.com
 (2603:10b6:303:84::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b0f344ba-2b85-4a3c-1f05-08da91d62842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sll6OHpNbEhoajJyUFl5U2RGTHRiQTViQ1htWk5iTDYxUGs2Z3ZBR3puWGZp?=
 =?utf-8?B?Zm5PWnVoS0JITUtEMEpPTmlSdXl4RkhHTlBxeDdPa3o1NkpDMlFlMmlLRGNY?=
 =?utf-8?B?akVYcWkrclJjdHcrMU81Z084UVh3U1FGMStDcDBqYkVvdkIvdE4ybTZWaGph?=
 =?utf-8?B?SlV4Rk1PWG5FMHozYW05L25GNTBXTGk5R3djV0UzMjlJYWtsMUV2WjArOVFw?=
 =?utf-8?B?L2ROSTVnaHBSNE5QZ1d0ZnpIQm9RekhLTVdGNDhOVmxGV2lSMjJCUEpDWUVn?=
 =?utf-8?B?Z3pGbWNuU3EzcXRDSGRaWWZHUmxDQkVhOEVTMWV3SjM3NHNXb3I0REtHUmdi?=
 =?utf-8?B?UGIrb3NXYjNIbklUMHY2UXNBQUJKcTNXRm9oL1AwTzlqU0ZBWTVLTWZ3S3Vi?=
 =?utf-8?B?b3FtaTZxWXhFU3ZNbXlZN2EvcThwaUcyVGtndnEzdkhQdmpKdkdaTlpGeEhB?=
 =?utf-8?B?dzFsTDNjNzd6bGhKYnJKOVR2VGVPdjNWTWJ3ZjJnMUlNdEdUZ0N5bG5qbHFC?=
 =?utf-8?B?UDU2TjdhbGN2SWFCekZmVjlucS83QUNQbDVKN3pqTmw0WWVqS21DclVEaStp?=
 =?utf-8?B?emxnU0NHQk1HVWNVUXpiUStmYlBBbE1BZGJnN0NVOGMxSUJkNFB0WWYxUEpS?=
 =?utf-8?B?THdtdmFQcnpjWExnbGZwVHZ2RFYxMEo0d3VYdkQ0VFN0TkdvV1ZoanVEM1JD?=
 =?utf-8?B?R0pWTkNJSEt5NUN5RGE0MWNmT0djUkIxMWtOK3JNQm1xUmVGUFJUYmd1ZmYy?=
 =?utf-8?B?RVlRa25PMi9ueUsvVkUvMHJuZjlJeVFmdjkyTDVBWHZoeUc2QU50OE1oWjlt?=
 =?utf-8?B?Q0FCSVBieUpLR0FteGUxTFAzMXhlMzJqNFlIMStDZWcwak9RbFFKaG1Sbnlv?=
 =?utf-8?B?bVR1bzVGaDBWVW16ZHNnUG5mTG4zRHFkaWpTS25aaTJnVXgwWHEvQ3ZZTkZ1?=
 =?utf-8?B?clVtZTY5Q3Y2RThueTJhbjBmQ0tsOGtzWXRTM0ZnUnUwUUZtWDBZUE92UkNL?=
 =?utf-8?B?bTNFSW1UNHg5bWJaMDBDRFJ3ZGlZU01uZ3ZiTXhmRndzSWpDaEMxSE4wcVlr?=
 =?utf-8?B?VEg0SzJDTWtQcXRXM1BWazFwelJtdk1VRytqQ3dMZmFhRzM1VTM2M1lsUEJT?=
 =?utf-8?B?QUp0VFgxS3owSUhjZ0dZcWdlKzArTzEzRENBKzRRSUhJMFZQRUNtUUZJeGgy?=
 =?utf-8?B?TUxpSldyeitibVllb05ZclhabGZUNjZMQzlZMUJVZ1dKSXhTVGxHOFN0d0ZQ?=
 =?utf-8?B?dVFvZ2daekJZSW96MkI5bUFIYnpOaW81QlQ0ZTY3UDhUWHNuU25FQlFXSDhX?=
 =?utf-8?B?ZXM4RHY5bEtPK1FaRUNSU25KMFVoUTB2ckQySGhEdHlsdkpyVGJ5KzVhak43?=
 =?utf-8?B?Rm5FaVc2U2lhMXcxYksydWxjckJrZ1RhTWZvVVJIK3JidVVHZG9NQ0pTd21D?=
 =?utf-8?B?c0FETnhpSVBQQ2RlMGJ4MUo2c2tsdmRSRGlocVZkRmczQlJ0T01CY3RWVGhS?=
 =?utf-8?B?N1RmT2x2QjlMV0xiYWo5NUYzZjFKZnJZZk1yMXM2cTlCeGdONXhaY1o0OG9D?=
 =?utf-8?B?L01TS2oxd2QrOSsrRS9qRHE5M1c2L0EwM3RxMkFjRldtYVIzS1VLM3dac1Zq?=
 =?utf-8?B?eThUeCtTTFdhMmpvRjYyU3RKdlBLRGNUSmsxbHAvUkE2b0JQQWhURnFFMVZi?=
 =?utf-8?B?cnBWck11Q0JwYUNNaWdEVFAycXVZSkRoY2QrSGdGdkQ1NitpZ3J6eEtoN1R1?=
 =?utf-8?B?Y1l5WmNHaG1Vb0xSbXVLb0FkSC9OSFNKSWtHZUxPaWlZMDlJSE1GM1JhWldp?=
 =?utf-8?B?NURkNmRPY2U3cGtHa1oyaHo5MHJwRmNqOVFpNm0rNmFJS0lyV3pGZXdEN0dF?=
 =?utf-8?B?SEx3alVVdmZrK2crUXdTdEp5bGdldC9TSWtPSGt1R0I4UlRVQllKZnNBYkZV?=
 =?utf-8?B?WjZwY0NCclA4VERqT0FUdkFTQWE0d2ZoR0RXcksxMXVEOE1aMTRrdTJBNnox?=
 =?utf-8?B?dzJwaWQ3cUpwV0p1Y3hKSlZMNDJsbFhiS2Npd3FzNy9tT1Q5ZUJoVXBkK2t3?=
 =?utf-8?B?TmFWdEkxNzZiVjJRWXgybFgxUWVkUDlFcGNKdzdYQlJ2N0xsajZtL29PenJn?=
 =?utf-8?B?c0NieDBleUFuUVkxMFBwUGdaaHdBNElGbDdnUmNLT2FLQXN3MWFRUHNDV0t0?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cb714c-3aa9-4998-1b88-08da91d6c6ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:14:47.4118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fo8EgiHLdDUUAxKR9ZZAB1kxnzx8TqRTrF+H6KOcdH9oPOPr6DUs2ySVsGxjYrDOad72vy57BiJXi6rRzVNgEbhtDQDu9wPNbT6N31RO2eM=
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

Continue converting the driver to the convention of last version first,
extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
be handled by the first branch.

With the new ranges it's easier to see what platform a branch started to
be taken. Besides the >= 11 change, the branch taken for GRAPHICS_VER == 10
is also different, but currently there is no such platform in i915.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
index d5d1b04dbcad..93608c9349fd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
@@ -78,77 +78,74 @@ static u32 read_clock_frequency(struct intel_uncore *uncore)
 	u32 f19_2_mhz = 19200000;
 	u32 f24_mhz = 24000000;
 
-	if (GRAPHICS_VER(uncore->i915) <= 4) {
-		/*
-		 * PRMs say:
-		 *
-		 *     "The value in this register increments once every 16
-		 *      hclks." (through the “Clocking Configuration”
-		 *      (“CLKCFG”) MCHBAR register)
-		 */
-		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
-	} else if (GRAPHICS_VER(uncore->i915) <= 8) {
-		/*
-		 * PRMs say:
-		 *
-		 *     "The PCU TSC counts 10ns increments; this timestamp
-		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
-		 *      rolling over every 1.5 hours).
-		 */
-		return f12_5_mhz;
-	} else if (GRAPHICS_VER(uncore->i915) <= 9) {
+	if (GRAPHICS_VER(uncore->i915) >= 11) {
 		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
 		u32 freq = 0;
 
+		/*
+		 * First figure out the reference frequency. There are 2 ways
+		 * we can compute the frequency, either through the
+		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
+		 * tells us which one we should use.
+		 */
 		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
 			freq = read_reference_ts_freq(uncore);
 		} else {
-			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
+			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
+
+			if (GRAPHICS_VER(uncore->i915) >= 11)
+				freq = gen11_get_crystal_clock_freq(uncore, c0);
+			else
+				freq = gen9_get_crystal_clock_freq(uncore, c0);
 
 			/*
 			 * Now figure out how the command stream's timestamp
 			 * register increments from this frequency (it might
 			 * increment only every few clock cycle).
 			 */
-			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
-				      CTC_SHIFT_PARAMETER_SHIFT);
+			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
+				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
 		}
 
 		return freq;
-	} else if (GRAPHICS_VER(uncore->i915) <= 12) {
+	} else if (GRAPHICS_VER(uncore->i915) >= 9) {
 		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
 		u32 freq = 0;
 
-		/*
-		 * First figure out the reference frequency. There are 2 ways
-		 * we can compute the frequency, either through the
-		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
-		 * tells us which one we should use.
-		 */
 		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
 			freq = read_reference_ts_freq(uncore);
 		} else {
-			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
-
-			if (GRAPHICS_VER(uncore->i915) >= 11)
-				freq = gen11_get_crystal_clock_freq(uncore, c0);
-			else
-				freq = gen9_get_crystal_clock_freq(uncore, c0);
+			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
 
 			/*
 			 * Now figure out how the command stream's timestamp
 			 * register increments from this frequency (it might
 			 * increment only every few clock cycle).
 			 */
-			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
-				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
+			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
+				      CTC_SHIFT_PARAMETER_SHIFT);
 		}
 
 		return freq;
+	} else if (GRAPHICS_VER(uncore->i915) >= 5) {
+		/*
+		 * PRMs say:
+		 *
+		 *     "The PCU TSC counts 10ns increments; this timestamp
+		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
+		 *      rolling over every 1.5 hours).
+		 */
+		return f12_5_mhz;
+	} else {
+		/*
+		 * PRMs say:
+		 *
+		 *     "The value in this register increments once every 16
+		 *      hclks." (through the “Clocking Configuration”
+		 *      (“CLKCFG”) MCHBAR register)
+		 */
+		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
 	}
-
-	MISSING_CASE("Unknown gen, unable to read command streamer timestamp frequency\n");
-	return 0;
 }
 
 void intel_gt_init_clock_frequency(struct intel_gt *gt)

-- 
b4 0.10.0-dev-df873
