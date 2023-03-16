Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6076BD58C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7CD10ED22;
	Thu, 16 Mar 2023 16:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0F110E0E9;
 Thu, 16 Mar 2023 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678984145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IOBYJ+eZrpG5DPZyA/sNojyevPR14JiUo3aTS5FO1c8=;
 b=HydBCMd8p/Mx7fjz3XtOIKlcWQWUqmPafHfDbqsjCYjPhfFq3913JCAc
 a0kYt2MDnpJCOOKvdMV1bHoAWusADoUOJSExm+JIvt3oNrepw4t2hxVm/
 bzTqLCidXsswQJc7oyuJPf2nCGyq5h6JlI0KnLW9Rjs15+DLOHyBk2kpW w=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 101561264
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OyBDH6yJznBHzbRT0Kh6t+exxirEfRIJ4+MujC+fZmUNrF6WrkUPn
 TRJWG2BOPfZZ2GgftlyYI2+80JQsZPRnNE3TgQ/+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPK4T4zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxlz
 fIXCQEUVTqSqMmR7YCxCdUxlst2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eWwH2iAtxOfFG+3qJaigbK2mgxNF5IdEPjv9WLrRaHffsKf
 iT4/QJr98De7neDVNDsGR2lqXiLlhcZV5xbFOhSwAOC0K3P+C6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8qje/OjMcK2MYUjMVVgsO49Tlo4YbgwrGS5BoF6vdptfyAzDrh
 TeRsDI5ma4QnOYMzayw+V2BiDWpzrDZQwhw6gjJU2aN6gJieJXjd4Gu8ULc7/tLMMCeVFbpl
 HwFndWOqeMDF5eAkASTT+gXWrKk/fCINHvbm1EHN5U79nGh9mCueahU4SpiPwFnKMsJdTLyY
 1PUoUVW/pA7FHKvYep4bZKZD8Ux0bOmG87oW/zZddlSZYA3cxWIlAlnYUOA1mbhnVJqnawiM
 peWa+6lCHpcAqNipBK9R/0cyqMqzyZ4xmTeQ5H05x2i3fyVY3v9YYwZPUSHdPx/zKKArAjf6
 d9ZO+ODzhkZW+r7CgHd7JQBJFQNIX8kDLj5rsVWcqiIJQ8OMGEmDfDVzLJ4PYx4lqJavu7N8
 je2XUow4FjigXzObxeKY3ZsQLrqUdB0qndTFQ4tJFeh3T4IYYupxK4ae908erxPyQB45ft9T
 v1Ad8DeBP1KE2zD425ENcm7q5F+fhO2gw7IJzCifDU0Y59nQUrO58PgeQzssiIJC0JbqPcDn
 lFp7SuDKbJreuioJJ++hC6Hp79pgUUgpQ==
IronPort-HdrOrdr: A9a23:fQ6e+6CLNhSsQYflHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; d="scan'208";a="101561264"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:29:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GB0at8WXxoMtEqIYIIRDBhUrLIVJ4XbjXer31F+/MxYMRDEAeaxtjgPNWrAs27gh0gKuMO0E72ajOnEi8Gs8GHXrSgLcSd74Tejk5RQ/wv7Or7HsbIx3p3ErdHYzbZaTC6Pjplo2n5BBc0N/yuJIi4bgF9T2c5P9o1YMv+VGQwJijPrddTrOtKhAjuEeV/AI/buuyQGrMIzs1vUQmEH4u8mU9NzeaLAQC7APK3wz3lkOzLxdPSArDmctWuwWEjnNGP6+JjXW7iRJ4ngg/4bXnMHnz3SoKK9eaHfWctf1SoDBnii/rqN+a092wx3Ytoqj0muHftg5YD1igXxX6OX7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vv5sK82ldFojrvXF6qjIlEegZCWiICY06ad2qippZts=;
 b=LjwKQoX1Fs72jsmMHcOh+P01+v2EDGjgqj6oF58nHEdlQYdJyxPZswgZeGJtjzhP0Y9HAnNynws+teKW5+S+QnjwxknkrJosIXiYLbnd39n0m5xsrrvPBD6DnvIDHLiO08WMibFna4W2ZMIcInhlAuTWReMkyl+BQ7BNX7ndiviXmF2dVbtIKOKAEy8veJAQw6GeAQ5zqivQNm8weNxYxzezyHz++JSXwAD7ZB5TU2SVwUvl4WypDgFlhXsN6JRxpl5tquS/SttCoLRJibIT5CEVLP8hLA0EqqJ0darwrIKrNTU7CmGtMkJ8/hw7ayW9q3GGy8i+4cXtI/kye5OcUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vv5sK82ldFojrvXF6qjIlEegZCWiICY06ad2qippZts=;
 b=lPSLKMPvfF0UehK/3MHjxu4HjqgwKtU5dbJ7XOQiozBR/iHwhvZFbwRSOnMnu2ZkJ0ocpIru5vqWn5EKqrRDFKmyCUJdgI4ARa9clRTjNLGMO+FNnn91r7xFuUt1IgPBe2aG9rD2Nx1OkUrYO5MvZF71sB1FNvn1Sh8mOhAQ7zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5470.namprd03.prod.outlook.com (2603:10b6:a03:287::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 16:29:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:29:01 +0000
Date: Thu, 16 Mar 2023 17:28:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Message-ID: <ZBNDyB7Jp0rgjZNy@Air-de-Roger>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230312120157.452859-2-ray.huang@amd.com>
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 074f2c2d-4825-4dbd-f54a-08db263b8cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V7wxPHk0FAernhmJYW93MGkEivdHPRM5Wd/wAvhUJO5Njd/ObLvlKehtUO4DqYYdEA5M3DZpoIk3e3vIxSv6TUT7Bl4ZOOZUeswiRLK23GQf21RAy6wuTRAMIN8tDPr4YUncDN5uHW1x/XUe16Ejgm4b7AKNG02V+1eNCti0E8lOuV/K9Z1qdqRfiE4Il8vPwLpktd0P27Fp5N9Bs+OH/RnjtWAtS0O6aEasyAyElcKFJ607h0hMeWAxlxFSaQijkigqk6MMLBOTYKr7WVGkoFKpCJm8nTUfzCUuyq4dl941PB20moeBHdfuzc7aVI8vKyqUatQnKClihOr4L1guegkSouA5rhvh4IMnLE5vgR7GhFbD4n7fqk88a72z8LcSSa+RdLhEY/MU/mO6SxegIRC8JzTMfRb5yuoL7u3ol4oIm2x2O1SgCO6hq8TyxtP7/6/z4y+Rt9uP8CCSH3HRKsLmZWQt46hRXKfb30Q/FRwcm/H1uWI1TYgyvt6LDYhgfybH4dRsoXXHoJO2KkPo1Z4A0/t87J3eMiK8arPsIo3c42N5CfD9diKKeFwC6w44CppzASsF9eIyHAeluPXYiE5NRrO2d26CFISVnti5upS9P5Y67XJRK+cfC4Gq/uj11BG+NEtHEDEiCpXWR1jWVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6360.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199018)(82960400001)(38100700002)(8676002)(6916009)(66946007)(66476007)(66556008)(33716001)(4326008)(41300700001)(54906003)(316002)(83380400001)(8936002)(478600001)(5660300002)(7416002)(6666004)(6512007)(6506007)(9686003)(26005)(186003)(86362001)(6486002)(85182001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG53NnpkRTBSbENFOFBRaFh1bU1OeVc5WjVmVzY1U2dDYmJwN1RoeDFISmxF?=
 =?utf-8?B?SnRaZHZGZkpJZVNGMnJOUng0RFBpVTBJSDJ4TCtPRnYwYUE1RnFVa2tIK1BH?=
 =?utf-8?B?eHoxTG5MTmlqeW9yb1NhazhUVUVWbGZLUmhxaGJTTGg3cFhQQ3lGRFBCcFAv?=
 =?utf-8?B?cnJCcXVCakFkdzdGaFY0a0lTb1N2UUtuMjlIWmp5YmUxcTVEY2dJNVhqM2Z4?=
 =?utf-8?B?YS9GenFXZ1I2eTlHdzc0dm43RTZRRmw3aVppY1dUZWRqM3BHclppZFlqd1FP?=
 =?utf-8?B?UWEvcTJmM3JCNFpSd2RQeUpUYUtCbjFHUlpBUG1ESHplM0lJSkNSa3Frcjhh?=
 =?utf-8?B?VXBDUHAzRGJzbVVqSHpid25jQ1cxL3Vab1NCNlhLY29YVWw2TkhzdURQYWZQ?=
 =?utf-8?B?MDA2R041STIrQ0RuYXVITDM1NGFZNnE3dFU3YVFreWcyKzB3QW5ZQmFoalhR?=
 =?utf-8?B?RFpUcWhUWUxOZlRQLzRvT1ArUWVZUmtVQW9jWlVHMTNvWTYvMlJnQm84dC9y?=
 =?utf-8?B?VVhGTjNaMzRZaG1Fa1NmYnphNDRHQXJwL3Y2TExSbDNtQ1UxdTFrNFpFTFNE?=
 =?utf-8?B?aDBERjZ6dlhlZUlEU2hiTi9GR2krZEQrR2JGdU5BSENpaGhHZ3dhWjdFdXFo?=
 =?utf-8?B?Tk0zUldLSWwwQmRWWlVVK2pYYnFQOStoVGZubEdyNFJtbHdidVZOYkJPVHl0?=
 =?utf-8?B?Uk9tL09xNS9GT0JZTzJNS3hoOWpsN2dtUm10cmYvOVkrK2IrcmN4cTIrRlB4?=
 =?utf-8?B?T3RSb3JPYmZpZjJoNklmNHhYWXBneWdmYXRlVUNZRnBLMnhjb2dWRitTQnhl?=
 =?utf-8?B?YmlWeFZBbEZiSlNSczBHTmVDV3NDUUE3bERnRCtYK1hTaFBFRHRsWjhUZzlZ?=
 =?utf-8?B?eUQ4c1Z6Q3p4YUJPeGppYmp3OEZtWmlqSGdlNnhaNmFsaUMrajAzeG5ZYXI3?=
 =?utf-8?B?VWJFNVBuVjMyYk9wWU9sL3djbVNhdkFoa0JheHpHeERYTDN3NFlCdlNlL2Vk?=
 =?utf-8?B?RlRtZlppR1dFVkxlNm1XQ250enpucTFIUWRZWmxFbUR1QmdmTjJWeUc3amRT?=
 =?utf-8?B?S2JDU2tOWjkzOGZMekNqT1dWOVI1N29ncDN0WU1lOEIzZ2RyMmF0K3h5VWM1?=
 =?utf-8?B?SXlrUnBzMzFnbytXaitCSFpNT01LcGtaU2JIbU5YS1dTOUVSTUg4d2FyRWlH?=
 =?utf-8?B?ak56dWFDam90UjNIem5ENzJoV1F6WTVkbUtTOE5uWCs5endjNk1lNUs2Y2hG?=
 =?utf-8?B?YWpqbzlrZ2tndEozRUxDd3dMWVBlTVdsNEdYTGRUdVRncHhaN1VZUC9YVmNF?=
 =?utf-8?B?OXA4MFJZbjh4K0pMU2ZXY1hCTUFzUWprUTBTRVlNZUczQTRNME5SMU9jOEN2?=
 =?utf-8?B?Z05GZW5sL0JwSVVoS1gzRGgrOVlqOTc5dUhxUUhRa3JrOG43UlRWZ2FkNms3?=
 =?utf-8?B?YUhKRUQ0QWpsdGR3T0plRVdmdjlYT2d5QXVuZzl2YnNaY0YzejkySTJqa0dF?=
 =?utf-8?B?bXp1eGZEZ1Z0RnE5dHQ3NUdmQWJwK3JXVjVhQkNWRU5idmlwd3ArTk5xVkZH?=
 =?utf-8?B?dDlnVEJEekswUExJU3ZnTkxHb3F4SFhPK2E0TE93NXFOUXdpNElwU2d1WlRB?=
 =?utf-8?B?UEQ5V0p3TG1NVU1vZ2J3Zk50S2o3bUZOSk5saU9WY2IyQWZjaHAwYjQxUkM3?=
 =?utf-8?B?UC8vWm9uN2dvRjlnUzh2bUNMb1I3SDlFM0ZubW5FMmhHR3BvRkhSSEtlU1E3?=
 =?utf-8?B?QkRmRUVHTFBUZlFkREFWOXpXN1lkV0s4TDN2Z1JveFhGaEdtTjdzenBEb3lj?=
 =?utf-8?B?ZGZhVGtWWFdUQmhFUTZWcUtzYThsNTRYS2IxM2tVMFAwYnZPenhiVWM2SXUy?=
 =?utf-8?B?czBXd3hsWnpYZkhUZEFFWDlaa0I4cVhMb3Mzd3IrcWE3a0hjUGU4YlRsamc2?=
 =?utf-8?B?ZXZnU0tScEdXZGJ4ZkNCaHNMc0NXdWpwRlJXZjRWbFhXQzIzK0h1cEg0Y005?=
 =?utf-8?B?em1GNzVXVWRYMkE0Yjg2NytLSmc1SFA2ZXZEWFNsTEhNZEZGYTVzUmNGMmFQ?=
 =?utf-8?B?Mm5ibXVxZzkzSHExZVBFanRHT2cyOVI4WCtjODFaZllXakhLSTJ2V0dtdXE1?=
 =?utf-8?B?UGhGQ0xOVDJTNVN3NTRRN01aakJlRDRHaThzM21qTmY3ZjJwRWh5NEFRTlg0?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VDVmNzhWNlpkR3Z3VE5zeGcvZzFNOWtPczVrZ0p3UmFJd2pYd3FnWFFUZEVK?=
 =?utf-8?B?akIwUXVqZEZybTVyZk10aWp3aEczc05KL25ZN2pVZDFVYXNjQm1uSnBNdGcr?=
 =?utf-8?B?aHRBWjNEN29oKzZNOWRkVjBGRzdtTmZuSi9WcnQwalIvNWRSNVZlSFFBYlBu?=
 =?utf-8?B?MXdOS2IrWi9uWHg4WVBqOWE3UERnN09WdkpMb0RFdi9aWTNVZCttUTBUQklX?=
 =?utf-8?B?OXQvSm1oTi9zZ2N4TzJPWllKUVh0S0ZSYzhqOERCU1czUjV4cGtCdzJieTl6?=
 =?utf-8?B?a1BtdHhmT1BaSGZMWnRoOTZkanVJcXB6SDhDY1QrQXo3YXdodC9WZXExY0cy?=
 =?utf-8?B?eDdZQ04zYmZwRUJ1Q1FmV2hLU0U4amJ2U05raFhBbUQ5bHRUYWxLY0xsUHd4?=
 =?utf-8?B?TmdaSmVYamh3MGtJczc2TDJ1VVZmYTN1SmVGQVVBb2gxaXFTamlpOHBEL1BZ?=
 =?utf-8?B?NnZvbUpha1d4YXVsaSthNUVIQ2hXZ2RzRmNDbTdncXVQTG0xcUJ4c0dxOFJK?=
 =?utf-8?B?ZTV1Z2ZyMUhBcTFPZndtZmNVWUthdWtLTFhTZnhvK3Y1UG9NcXl6bmZqWXNJ?=
 =?utf-8?B?Tk5uNFFBcHRrZG81bFdPRjdhN2RqSEFmVVkzdHFEbWxIV0hodXRlWDk4MW1k?=
 =?utf-8?B?eFBmMWErUnBQbDViVStoQnFUYU05NlRQd3RkWmJnZ3M1aExGcmNMb3lCeGds?=
 =?utf-8?B?NTJWTXJvMFR4VTJBVjRHMVBoUUZXVnc4NXBkVys3Y1FTRjNaRjhlN2VRT2E2?=
 =?utf-8?B?bzNYeXVCVWZydmRqQUFIWm4zT2l5QVh2R2ZKYnVieTVUck5TWXc0VlhZUmc5?=
 =?utf-8?B?T3ZRTGxsZk94b2ZEc1RIV0pOTThnd2VKN0l5N1hTM2NZdDVWdDAzSDdTaXFJ?=
 =?utf-8?B?ckRLbWxETkYzb3FiUnhDbFA2WjRFdENoNEpxMVczQzJhck1oTlJySGZnSFNO?=
 =?utf-8?B?TjlONEhFd3F6bk95WExCZE9HdUIyRHBOcWlHNzBKODRrQXJRbjNsTERyQUEr?=
 =?utf-8?B?ZnRvNlZPN0xMUlVpb3QzL2lqOFZsY0Jtek5CQXJHbmQ4eXRSNHluSk45OFdj?=
 =?utf-8?B?aDh5c3piU3RmT1VTR3RDeVI3VzFFb1htK1VBUUFqYzdPVTlqMVBodTRVaEFP?=
 =?utf-8?B?a3JhZ2tkMGJhNTlwUWhia2Fsd0xoT1ZBL2s4L0czeWtrcXZrcnBvT3BLaUlC?=
 =?utf-8?B?RVJLdStQQXFTY3FPQkNIdlNwSWt6ZkFYT2ZQcDhpTWNUVXQzYmZBN2NKTWkr?=
 =?utf-8?B?TDNuSDJWT0hLR1I2ZnBxTi9Uek1FVEYzWkprWjYvR3Z2OW9RZ05sQlQ4dzlk?=
 =?utf-8?B?bjZmYWRsclhVckVXVHpHRlYwUlhCWXZhWmdtczNrWHpwTHlCMWxMTm1oTjdW?=
 =?utf-8?B?SkV6UVp6Nkw5dFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074f2c2d-4825-4dbd-f54a-08db263b8cf3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:29:01.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XpY7AwsimyY3854UH01r/GzCgvMZcHgUygaHLvZwmBLBfCXBXV+rzc7psXtnMXkezLrcZn3jk3b5RHL2e410w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5470
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

On Sun, Mar 12, 2023 at 08:01:53PM +0800, Huang Rui wrote:
> Xen PVH is the paravirtualized mode and takes advantage of hardware
> virtualization support when possible. It will using the hardware IOMMU
> support instead of xen-swiotlb, so disable swiotlb if current domain is
> Xen PVH.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  arch/x86/kernel/pci-dma.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index 30bbe4abb5d6..f5c73dd18f2a 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -74,6 +74,12 @@ static inline void __init pci_swiotlb_detect(void)
>  #ifdef CONFIG_SWIOTLB_XEN
>  static void __init pci_xen_swiotlb_init(void)
>  {
> +	/* Xen PVH domain won't use swiotlb */
> +	if (xen_pvh_domain()) {
> +		x86_swiotlb_enable = false;
> +		return;
> +	}

I'm very confused by this: pci_xen_swiotlb_init() is only called for
PV domains, see the only caller in pci_iommu_alloc().  So this is just
dead code.

> +
>  	if (!xen_initial_domain() && !x86_swiotlb_enable)
>  		return;
>  	x86_swiotlb_enable = true;
> @@ -86,7 +92,7 @@ static void __init pci_xen_swiotlb_init(void)
>  
>  int pci_xen_swiotlb_init_late(void)
>  {
> -	if (dma_ops == &xen_swiotlb_dma_ops)
> +	if (xen_pvh_domain() || dma_ops == &xen_swiotlb_dma_ops)

Same here, this function is only called by
pcifront_connect_and_init_dma() and pcifront should never attach on a
PVH domain, hence it's also dead code.

Thanks, Roger.
