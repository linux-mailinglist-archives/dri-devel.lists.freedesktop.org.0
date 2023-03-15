Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3276BB5EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 15:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86E610E2B5;
	Wed, 15 Mar 2023 14:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7F910E2B5;
 Wed, 15 Mar 2023 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678890388;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYfh3HXehtB2f3KZTPWFqYe7WKOChOOqBjMtMlB8WWE=;
 b=KNazy8wxLB1cvQ+7infrPcIrGlcgwGdZWzN2Sh7jLbhwvu4sPuzduz86
 YD1SSHx8isxY6QmI+GNdFclAYDdMyIwjypXAGMSxPvQx2qHVSfX4medEt
 iAd60bm2SNR4+lhQm0Ps0Mv69HoqehVrn/QbWeEfOxFTb/G28Tu0fJvMu s=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 101373556
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FSuMA6hkoJHLmbrR62vZfR1mX1615xAKZh0ujC45NGQN5FlHY01je
 htvDD+GPfbfYmXzfY92b9vkpBwAu5eDzdNqT1Y9pS9gFSsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waDzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQWOSwhNg+nit6owbn4WvlD2+UJApnCadZ3VnFIlVk1DN4AaLWbGeDgw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEoluSwWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHuiA91JSeDmnhJsqFqaykgPFUwRaWe6j8KH1HCxS9ROM
 VNBr0LCqoB3riRHVOLVRRSp5n6ZtxgTc9NVH6sx7wTl4qjb+QGCHUAfUyVMLtchsaceXic23
 1WEm9foAz1Hs7CPT3+ZsLCOoluaPiwYLnQLYyMeehcU+NnooIw1jRXnQ85qFei+ididMTv32
 TGR6i8lm68Uk9UIxo2851nMhz/qrZ/MJiYl6wOSUm+74wdRYI++e5fu+VXd9exHLouSUh+Gp
 ndss8yf6v0eSJKAjiqARM0TE7yzofWIKjvRhRhoBZZJ3zi3+juvcJ5d5Bl6JVx1KYAKYzLkb
 ELIuh9W/NlUJnTCRaZyb8e+BdQCyan7Cc+jWOrZY9ZDeZttcxfB+zthDWaZ2239mU4gnLt5N
 ZqGesahF14TDKghxz2zL88W0aUq3Tw/zGWVRpf2yRWo+bObaDieTrJtGGCSY/8w9r/CgATR/
 9tVLcKMxz1WVeG4aS7SmaYZMEoYJHw8CZfpouRYc+eCJkxtH2RJI//Wx7wldo082aRIn+HH1
 ni4VglTz1+XrX/aLQSDLGJjYbXgdZ96oTQwOilEFXSpwnkqZ8CE7KoZX5Iycf8s8+kL8BJvZ
 /wMesHFCPIWTD3Co24ZdcOl8NEkcwm3jwWTOSbjeCI4Y5NrWw3O/JnjYxfr8y4NSCGwsKPSv
 oGd6+8SerJbLywKMSocQKvHI4+Z1ZTFpN9PYg==
IronPort-HdrOrdr: A9a23:tpCXe6lS4hXiihABYl8qh/vlo4TpDfIE3DAbv31ZSRFFG/GwvM
 ql9c5rriMcRgxhIU3I+OrwQJVoJEm3yXcb2/h1AV7PZniFhILsFvAA0WKA+Vzd8k/Fh4pgPM
 5bGsAUNDSzNzhHZK3BkW6F+rgbsb+6GWOT6ds2DU0BceinUc5dBs5CZDqmLg==
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; d="scan'208";a="101373556"
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 10:26:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A553x65u8wykC4HFnZ6lRzqBSb7gBu9Y2AFLco26gSbof+fKT+2J8kEAKPLQkt9dddgPsxjNMkhq968oFwM4P25HTN/U6Ne8C08WZGg3sOwYmpEZMgYUuoBDX8qKzFo2ZGJa60D9ChM1jgqK2dZpw9j2Ztp3kF/8vCDdd+jhLeCZWTtImYSKllR3ttmjagI2JHQehbqaoPZpDH7DhcdohpfrVHm4lUgg6EGONaNREv7y/mtLuo7LbbK4/Fd0naA2XumXyIArFq6MhN0OwV7tc9gYLLit3VPgPEd7GpXLLY5Y6r/VnSojpDKJopNs3pGJM1LGEXldTp9Heq7sIPezsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8Ln+wRfhrINjyA6imnJhPYRQ4u9OKDbnJqG04xkOiQ=;
 b=YPM87aSrq1bETSWxeniwjt2SEhboXh9/GGIfxFn3IKP7z4U36C53pBwOCcfIR9J6onPmRhbvzGl1oyQEFo6lvnQlUoyD1Nt0hzcgsyGptl5SpQGCxiLgq6t0+VrV4faj+DkzMlrdZQ55jWHzvQggqGoGZL49kCwrEgldX73eWmISvfz1R9m6MtaaboItmcKIvK4SI1jdlS/xMLNxu6k9ux8nMc/CzHCM9RcUR+G9gSVNjBODKYRLrQ8Prceod9UO0L1MpoGcktaW2e0FAyG/wpVYxGI6B68St/mGaqhedLmSB0FXOYQI2mDRxKS746ZVShaCSc9jcPDaifah2bTU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8Ln+wRfhrINjyA6imnJhPYRQ4u9OKDbnJqG04xkOiQ=;
 b=lIuDxiGlh5xktOujjiINMVa/gRmPkFO8oog/tcfwSXflCdAWAADhlLW0byMpZOakI9kNxjdoNzq99VJLGShto9joiaeB2BYXFle/9VE+19vLnG0hHJ6ZKDafWi3fMnHvkZCl5uwhVz9hAbucFbWd+l/92VeeQ+TLmUc/T03Vrb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 14:26:23 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Wed, 15 Mar 2023
 14:26:23 +0000
Date: Wed, 15 Mar 2023 15:26:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC PATCH 5/5] xen/privcmd: add IOCTL_PRIVCMD_GSI_FROM_IRQ
Message-ID: <ZBHViestgDwWYqjl@Air-de-Roger>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-6-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230312120157.452859-6-ray.huang@amd.com>
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|BY5PR03MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f194db-e38a-4d85-e00d-08db25614069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FmtfcCz2C+GRlQ47WDGl4/ScLnbjbRs7END4xiQcjhHLDN1ovgt7TH6rGFhNHGsEBLJ/bMFN/b34xEY6Wjjiq3zVe3sGpEIf8UlBxse/StmOVH5onapX67mgcR1fRIFVXWD6F7pKdJgY6DGbZ+NQ2OGVQHiOObeKOVX37WmS9TtVlvjaTC9DhMZ529Si3haArCnf1nAIQk7AidE/gds7WQdai7lWI9/6cqQVrsSp1sKgyTWVUMOZeWipn9ng6dXD0fi2mFH5RZ8vlM8kjX/9A4604PpenJQ3FQvflaX44W6eVKoGaQuDp8oGP0lwF/F4nKPx4q9BAiX7obaM75nBZqGPYVHbf7SZ3wmhmqd9K20R/pwCoFFxy/1zqeSy5AZe0OAz9KxYC+gyq6qWdDAc6eRx/QRMp9ZEw7g6eYMM4XoD5b/Azkbfper0hprwUNwEzDFidFplC6rvqJVZpnqd8qW3BpiweOVI++uWXM7tOSQmKFds/RKn3XC1+S77hLEgrQNLsngx1S72vVoicsqhwp/zuPit21v+nuWtuCvl3FwO6QSmBEigEVq3wRH7Z4u3vLohFelB46i7Va4udejIO2e1OoLZ7t66giSkQZrueSbo97K2NKlnXdGofNKkiNEFMf5Llmjp1j6Gy9pM3oqoIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6368.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(7916004)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199018)(66899018)(85182001)(4326008)(7416002)(8936002)(41300700001)(5660300002)(2906002)(4744005)(38100700002)(86362001)(82960400001)(478600001)(66476007)(8676002)(66556008)(6486002)(6666004)(66946007)(6916009)(33716001)(6506007)(54906003)(316002)(9686003)(6512007)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZNQjdtUkdlbStxUlJlNTRZYzN5ZklLNkFRTnFPS09RVzFpbjNWOEZDUW9I?=
 =?utf-8?B?SnNTRXpJTjJZdjVlSWtjcnFZR3FhZ3hhaHFRdDc4U2ZZRWRwK0czTVQxU0Fp?=
 =?utf-8?B?RHJmQzFyanZXWG5hTnRIM2pld3FVOFhJYTlVVWQwaFhWR3U4YVBoemFrQTUw?=
 =?utf-8?B?OXdKSW5mRWJiT2dQVUhuR2txdGpWcGxMVnFIZ1piT3c2T2lZNnpCa2NIV2Na?=
 =?utf-8?B?b1g5ckp6WEh6a3FhRnRXUnVwUEtrT2JSK0R2REZNdmU1Q0pzR2xQUE5Ib2da?=
 =?utf-8?B?TzZQQWVMVFI1YUtPd2ZlYmprSS9YdmhiTXByOU1UQU5ydlpjTVozWGZ1dmdo?=
 =?utf-8?B?b3EwcTdKUTduNm81YWo0REYvR3NhMDY0bEgzTVhMV0V3bVFNSWNOV1piYjR0?=
 =?utf-8?B?REpRaTR3b1F4N25ObEZtNzhEMHlyTFF3dmFVWkR2NlhlcDFRMGdEUElRNlNu?=
 =?utf-8?B?OU1nMytSVFI0aWNOSHNCT3pHUE4rMTVtQzZiRTJsK09kTVlRSUU0aDBYek0y?=
 =?utf-8?B?M3R0UFR1UlI1QzR4ZHNDYTMyR3dCUmFpZVFJWGpmVUhZY2hCWVY1VVNhQ01s?=
 =?utf-8?B?cmd4WlZKNTlkQlRFODBKWWlTeEx5Um5oUGkreWpLeTVWSm5tSTdPNi94SjZ5?=
 =?utf-8?B?bVpsdDY2NjRjV1NvU3ErTHNvdE9BaGJYblh3MWlEVURDd1lRenlZeEVBYkhW?=
 =?utf-8?B?ZFUvYzhNOHV6aE1vUHZBOVVQb1h6QWx4WmkxRDI4dmkyZVVDU0JSajBRcmxE?=
 =?utf-8?B?bkwxWWlSQXN5M3k4UHFKaVQwdHJQLzIxVGxJQzZuSGtBeGVRZUVDSko3S3Ur?=
 =?utf-8?B?ZFlXd01GUml5d3Zsa2RIRng2eURwNnU4NHRpQTYxYWNYdWVvRWFOZElQMWNB?=
 =?utf-8?B?YUoxcUduazM4YUtkVk1hQ0w2Sk1JR2NQaFVDNFVxYWRiVWNTOGdRTjFMcWI2?=
 =?utf-8?B?R01XVldCZENlZCs5bGJ3akEwaEFkTFNIdi9sak5jaVJUd3AraTNrekludWxB?=
 =?utf-8?B?dXJEUXVRYWZMeFJvSnkvcVRxRzlxeHRPOUlkaThBZzcxcDgyQm1sTzlMdkFI?=
 =?utf-8?B?b3Q3Y1NZVzkxNkhCK1BFb292VTh5Wm1PZVp2YTVsTXppOU5TSlpJbFF6a2lW?=
 =?utf-8?B?djFEZDNPUDduUk5zT2E4WE1LSGpKZWMreExEdXFEOWNlYmxzVHFhd1pCQ1JF?=
 =?utf-8?B?Rm9jOEdQWkZlTnJtNUVLR1BKUHpKNzNlbUF6QmNGK2NCRkZ5NVF2Ymg4T0FU?=
 =?utf-8?B?bHkzWnhaM0lXazhnWGQ5WkdsMWNRVWlGZ2k3Y25NRzdxZ3g4M3kxRG5PZ3BG?=
 =?utf-8?B?RkthU29OU0VLQStjbC91cEFOWkR1c1dqSnlOL1pSdm9WKzdwWThoS0lOK0ti?=
 =?utf-8?B?bE5rYm9EYzJoR3JrUnd3THF3SlVqandkdFd0QkVSYVdvSEhEVERkUEY5bHhG?=
 =?utf-8?B?b09LR2tTc21QelVJcG1kWmkrcHRheUk5MC9zaTB3cEpiL3V6QVNrYi83THpk?=
 =?utf-8?B?d3dFZnU5K1d5NUdOL09oOVVmU21FMFg1NlZxemxxaU1OL0tzM1grNlZVOW9C?=
 =?utf-8?B?Skp3Q1IwUllpSnJDY1ZnUkVZNWVxR0dXS1pMVjJQK24xZHU5WnhlelJTdnZ5?=
 =?utf-8?B?RFhiejl1bFY3S2VCUXNLbUY1UFFIaG9ZMnk0ZmY1OEV4aGRpQ2o3VklGUDlX?=
 =?utf-8?B?aDhSa2pMUUhOSFViSUFhNXFhdW5tYUVJUng2VDBpemF2eU9yNjBWNWxoWlk0?=
 =?utf-8?B?d3kyVjhLYWtIUmk5Q0pYOVAyZENxNUx4Ui95UUlhU0YvT2d2bDIwV3d4SVFr?=
 =?utf-8?B?a25HZWxXb3FwMXFwZHNIWHBSNTNFSDNMZWdwWkJvSHZOSmNTb2hVM2hTbS9s?=
 =?utf-8?B?ajZ2SVI4OExzT2VFSDBzbDZHcXV3RFdyYUdaV0lXWkN3YXlRb1pDTFhhWUR2?=
 =?utf-8?B?Y2tlOHEvSWUyRnlrbVJDN1QwcHo5eW10Z0lZTk0xQXk3STlranlpdlQ1NW9t?=
 =?utf-8?B?Q3BTSVhGS3M4TmxnZlRtZFF4K0VHaWpqa09iSUVFZHRTYkgydGM0cW1ldzRU?=
 =?utf-8?B?cXh1VUNMY3Fta3lIR2R4Q2swRllBb0tTbXk5QndCNFpRUEZvcEsyczVDYXIy?=
 =?utf-8?B?MXp3YVpvc1Q1a2ptUmZYR3Z4dmhYSnQzd1M2anFTRk1wbjlDTFBBeXhDUVFh?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ZHhFY3pCZlVscEh1NmJVV0VPS2hKYVZOS09FUVpWRzlQVWhTVjJiMWo0WUp3?=
 =?utf-8?B?SUczczlHWVBBektScTI2OTJoSGtzTVJyVVJWSkV0MXdwd0pZYXpxUlNVMUJO?=
 =?utf-8?B?QzYrZHRFVmhwWGxSVis3QU9VL2NYZUhHWkl2bEQ4ZVI4K3RaN2dtNUQ0STdw?=
 =?utf-8?B?K2dINEJTbTNwL3Y0a29rSG9BOW9VcVVZUGpGU0ovejhScnZQbWpjaCtLVjVo?=
 =?utf-8?B?QkJrNFA5MktQOW1aUHliNUtmd045RXE4L2Q1OFArSWdZYkIxYUREYzlIQ2dQ?=
 =?utf-8?B?SDVhYktZWlMzWmp0L01DWnVtbW50bWU0WGdFcnlEcHFaVHNqVjhrc3lkVTZJ?=
 =?utf-8?B?dk94MWo0VjA1d2ptOVJrK2U3dm1KMXZESGNtSU9EZWkra2s3TDIrVG80QlNX?=
 =?utf-8?B?d3owQThkL2xWdG9jSENOMGhCSldNbnhnOG0rUnVha2l4ZGtWcVBDZGQzOUJq?=
 =?utf-8?B?R3QxNjExRDdnN0dJcncyYk5MdU8zT1ZZT25yY1dBTU1qc2xLN1psemx6ZStI?=
 =?utf-8?B?OVZWR0RXMWIrUGRydU96aWpxT25aNG9SZXcrYVRNL0lzQ2VWZ080NWFDeFpH?=
 =?utf-8?B?dXF2TER1MlVRQXd6L0xKbGlZQStXa01iaFY1dGJKYlhRZ1dpbGlRcVEvZm1O?=
 =?utf-8?B?TVFqRWVqeWxmN1VnbXhqREhIeGkzVHYwUlVaazQ4YVVHWStXbnFYTnI2TlZF?=
 =?utf-8?B?b2ZVeENvTnZqd2hrVmJvZU1PZ3pFSGF6YzZSZVRNdERJK1AyM28zSE1aY0dn?=
 =?utf-8?B?M0ZHeHJwRDhWUGVXVVJzd2dDQVI3VE0rc01KTUlWZ2k5SzRDY0p5d0xicFRG?=
 =?utf-8?B?MnBqdEkzNkRndG8zbG1aZEJRSktOd2VROENuQ0JFeXU3cGJvc04yVTBuVE1o?=
 =?utf-8?B?ejlyQ1lNRytwNEhsSlZBRXlhWXRjL1ZMbGRQQkFBT1lMa09vZitNc3YwVzZa?=
 =?utf-8?B?SDg3VHJzeWRzUkR1UDZpS0w1RS9KL2U3SDlBUlhQK3lXM0ZlaElSa1V6ZlRs?=
 =?utf-8?B?RWE2cWZzcWdQN2dvdksyRFBGWUMrVG5OdTh1SkUzRGtTMzJsdFZMRkpPZDBu?=
 =?utf-8?B?SkpJd2hpcTZnaW5tSXRqSDhIQ3VNTEIrNUFtcGRlZ1dSWk41citoM1RibWtX?=
 =?utf-8?B?cUY2RktCVXZjNURPQjhiMEVTZGZ0c2lMdDNoRGM1VWxqWnM2cTJsdkowUWRK?=
 =?utf-8?B?L1BpbHpnTXJkdmJ0VnV0bEFyWmNGbXR6WnJObDdISXR5bVNvcXd2elhzUERR?=
 =?utf-8?B?aGFjZG4wUjlwU21yRXlQMnZiVW1NZEtibWVmbDkzNEpXa2p4cCtmVFMxRGtp?=
 =?utf-8?B?cHJoZElKRmdYeExWb0ZTYlNlcFE2R0djMmNra0hHSk0vZWdscEVoRmZpeG05?=
 =?utf-8?B?ZTNkWHRiYnVUNVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f194db-e38a-4d85-e00d-08db25614069
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 14:26:22.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSTQFllw7C19eOtuulJrUAtQ9vtag3muH/BQBXeVlqnWeB+s9OOSP/MfGf0xJVN9mjaOlrOCqpjcg6/zyedMFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 amd-gfx@lists.freedesktop.org, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 12, 2023 at 08:01:57PM +0800, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> When hypervisor get an interrupt, it needs interrupt's
> gsi number instead of irq number. Gsi number is unique
> in xen, but irq number is only unique in one domain.
> So, we need to record the relationship between irq and
> gsi when dom0 initialized pci devices, and provide syscall
> IOCTL_PRIVCMD_GSI_FROM_IRQ to translate irq to gsi. So
> that, we can map pirq successfully in hypervisor side.

GSI is not only unique in Xen, it's an ACPI provided value that's
unique in the platform.  The text above make it look like GSI is some
kind of internal Xen reference to an interrupt, but it's not.

How does a PV domain deal with this? I would assume there Linux will
also end up with IRQ != GSI, and hence will need some kind of
translation?

Thanks, Roger.
