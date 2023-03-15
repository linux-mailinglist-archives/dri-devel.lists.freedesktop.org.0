Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4486BB396
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 13:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6F710EB0B;
	Wed, 15 Mar 2023 12:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 15 Mar 2023 12:49:57 UTC
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D835310E1C5;
 Wed, 15 Mar 2023 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678884597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SgWabNV403GKwCxC710GewszksQx3xnMmj0w0mUWHP4=;
 b=F29p4ubMWG3hrsw8L4YtOAKp9quXWUCDPomQZLtpT+VUF5Q0jhM9IKS7
 fLNBUMEsWcnjQvNB5r2/JXnTeoF/qZjlOEk2uefPjH/DDartt1oseNPf8
 81c1Bt9GJniWqFsgz/ZHazz6ANxAerjmAx5pBdvJILI7g66THNjc2Hdhm M=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 101355401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4kEaNaw0id+n9QeKDJ16t+exxirEfRIJ4+MujC+fZmUNrF6WrkUEx
 2VKWzjTOPiKazP9fNp/YYjl9kkFv5TdxodlHAJorSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUZR/
 90KLWgJUj+8iOzv4aupR+h2uMt2eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eWxn6mBNpLfFG+3vF1hV3J4mgaMjMpVQv4n/2hpkCbZvsKf
 iT4/QJr98De7neDVNDsGR2lqXiLlhcZV5xbFOhSwAOC0K3P+C6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8qje/OjMcK2MYUjMVVgsO49Tlo4YbgwrGS5BoF6vdptfyAzDrh
 TeRsDI5ma4QnOYMzayw+V2BiDWpzrDZQwhw6gjJU2aN6gJieJXjd4Gu8ULc7/tLMMCeVFbpl
 HwFndWOqeMDF5eAkASTT+gXWrKk/fCINHvbm1EHN5U79nGh9mCueahU4SpiPwFnKMsJdTLyY
 1PUoUVW/pA7FHKvYep4bZKZD8Ux0bOmG87oW/zZddlSZYA3cxWIlAlnYUOA1mbhnVJqnawiM
 peWa+6lCHpcAqNipBK9R/0cyqMqzyZ4xmTeQ5H05x2i3fyVY3v9YYwZPUSHdPx/zKKArAjf6
 d9ZO+ODzhkZW+r7CgHd7JQBJFQNIX8kDLj5rsVWcqiIJQ8OMGEmDfDVzLJ4PYx4lqJavu7N8
 je2XUow4FjigXzObxeKY3ZsQLrqUdB0qndTFQ4tJFeh3T4IYYupxK4ae908erxPyQB45ft9T
 v1AcMLZBP1KE23D425EMsO7q5F+fhO2gw7IJzCifDU0Y59nQUrO58PgeQzssiIJC0JbqPcDn
 lFp7SuDKbJreuioJJq+hC6Hp79pgUUgpQ==
IronPort-HdrOrdr: A9a23:L0/VnK01/0lPcFGh1E0tlQqjBIAkLtp133Aq2lEZdDV/eMbwrb
 HXoB17726MtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; d="scan'208";a="101355401"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 08:42:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBCGIQcANLUpNBq4PHL3oJBLHKOnwArp9O2+KULSoPsC5J5JMtHapiulx69JRcIAkRnrgR3o6ZrMHf2qxrI6mVlIjsYIVQ9CdSbjhOcxi9cHQ5TfYvsagUGgyxapNMC7VkYbDh69UW71OyXPmc3DYehDjBukookW+mdjyNpGxM+1GRbsuJiJ47kzser2sln5YYOaq5wTMmokX71Vx/mgHBZZPNaxy7JAkvLJmd14ovcXMPZqV74XyDDzXP+wW5Suio+uIzhzDLIc6R2xYd+ZeH2F8vzjMThp+ggjuXcCi8FeTVaUz1342u5RI6YKEQWhJC1AkrdTeowUyAMylzcK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0JonGJtgz9xQEQES5N8rGnMh0zqxpDv9QCoQI4OF1U=;
 b=YDZsUalQ3WbeBlK38IJIr3bYB2YtjAo8t8rzIj9K5xnxnSlXxj579sTfFT9DT1lhK4ij831vSHIdmt1I/hcNZtcbU84l75j8H57blQKtOqkPIjdG5ANVkl02y06yMDUAxErod6PkpUJebYPHkKAF6V8tw2nM7EUf5R8HnuucfQJQMF/g5se0lRZX8rBVW/UkKfjI104w3QZ+ZADXtx4sNqb65781uME2yLD1Ice00gg62nHWgvZk5m4vjuFhbgCKyERP45kQvOBI73qVRiTHfELAIj6pRajKOo1eJnis9pKg070Fm3njU2r7ZIzBZ29JRTTyl/TqUspTSj5XUZ9swg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0JonGJtgz9xQEQES5N8rGnMh0zqxpDv9QCoQI4OF1U=;
 b=BilK5KsjTDb/fZX9dgKl+Lw/nYK0toM8y8uUh1ltvRJu10NMBgYD0+IfAf39wpT1ty/FLzjzACc/dfQ7Rzb6RoCPzKhsGugq7Aw5KDr6sHkiie91EaQWLqpEoWxBd0/SK0egOOg5u0gmihgMyKEamzYQT5dOlroAA6IDj6zXJ+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by SJ0PR03MB6616.namprd03.prod.outlook.com (2603:10b6:a03:389::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 15 Mar
 2023 12:42:47 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Wed, 15 Mar 2023
 12:42:47 +0000
Date: Wed, 15 Mar 2023 13:42:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: set passthrough mode for xen pvh/hvm
Message-ID: <ZBG9QklWHdt+ZX6U@Air-de-Roger>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-4-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230312120157.452859-4-ray.huang@amd.com>
X-ClientProxiedBy: LO2P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::30) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|SJ0PR03MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c5212d-154f-4a40-e253-08db2552c7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2cD2jZpacKT3F0veaFtMvKp5Kpq7c6S+8lDkeZoPV2Z823gW+2FFIQbRaHDP5qCyJvrFPjcUR5LKcnmM/5hbbxmkn0316C46UjP7LdqLlgugvMTmfoL/ZGYrJ6nb2OfkPLJWGhqH2ms0oZQHBmXXYK+TFwxR4jcVPrFXdl9h0bshbYKwGjNYQ3UntLWvdT/LNQuPDDoR5fb/+sPXg0LwVkPv8oSciYL7/WPIcCh9z2WCsdJHD+vtq/tjqRcgP+hpjp3cpzYlcJeo6joEDAoFxudxqinXCwIYFUx7QNdgzr8mQ0osQWOhaogkGu2oCSKefZ/QVh2uB9nY+4JmWLRYsNSP4eulvF5FSVKQo2aBIOJMQN3o3pOmjSiu4ZZrxnMPi5whJv8F1K+Qt1hmJXRBFOYrLYzgAngSmD1YMLCCKcB2qNQv3akOIi4YGmGS/XjofCBjhNx3kasK8V5hL/FMwwplXlicq3EoA9o4/PpnPYFeCCXdwdb2Gu5EwpMI9hpQzgcs/5S33Yu3m2Az/pqSoZdzjvZpnbfAPpcafn8hCegfAk8tkAABkwfJ6jiew+PBneIBuT2Kd+wmc7o8WlZ/qSBh4CQDgHGAAQ8ChqsoTBlWzAudWgmGjJJxasCsJHhpg0fc857ANAMqbiCYgF079B3pCl/FMZO2YurJBMFGyaP8lGDfLKQU4YUZUwElVXI7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6368.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(7916004)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199018)(4744005)(66476007)(7416002)(8936002)(478600001)(6506007)(6486002)(2906002)(33716001)(41300700001)(54906003)(26005)(6666004)(5660300002)(6512007)(82960400001)(38100700002)(66946007)(86362001)(66556008)(316002)(6916009)(186003)(4326008)(9686003)(8676002)(85182001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHo4SVl3dUt1V0p1UXN2K01hQ0dMcHdub012RGE0dFZmbWhDL1JZcEd0NWoz?=
 =?utf-8?B?bmc1THNvU3NBOEV6K1I5cWtWRkQ5bzIrWldoelFubjlYM2JucGRZSjlTcVlq?=
 =?utf-8?B?ZkVWQ0tyQmp6NnZVQVhPR3Iwb09pdmtZZTY1SFRPY3I4VC9ya01BMDZnMEpm?=
 =?utf-8?B?R0gzUy9ackt0VUNmbWJIZTNiZlp6MysvNUJKQVJDUmIvd3hmWHFTMHhhSzhy?=
 =?utf-8?B?ZnM2OUErcFc0UTRlVk5SaU55ZVNZNXlBU2ZPTU00cFhjUFRCU0FySkxWYS96?=
 =?utf-8?B?dXAzRFRRRlhwa3Npd3VzTzl4dHN1ZHdVblBFUktCQ3o0eWJnVjdTeW5YeG5i?=
 =?utf-8?B?NHozZWpRSGE1VnYxU2xYR2wyZFB5ejg1bldTTElKSWY5aDAwUUkvR3hhc2NW?=
 =?utf-8?B?KzdSckZwVzM4V0ZCOVBjZWJvNHF1RWFlVFQrSDE3cEJBdjdjNWY1amFWN1lP?=
 =?utf-8?B?Yk9lZzJ1NERiamtyWUw2L01vc2hyaUhNTjFzNHBXcEt0MFJCS0xFWGprbEg2?=
 =?utf-8?B?L0c2WEZqbGNZMXBmcEE0RjdxWGI0QXo1ZkRsYkdjdlZWU3UwNHMyYmZua1JF?=
 =?utf-8?B?K0l1YnAzU08zc1JGdzBzRTdIVHlTK0Raa2FhcGlNWHorSzArQTI3QmRPTUUy?=
 =?utf-8?B?b0JTbU9ncVJuN3o0UFBBa2wvQ3dpOGJxMFhuNVJ6bnpWTjdScEFUSjhJSTFB?=
 =?utf-8?B?cktHR3g0M2RGTm9QMys5MHZJZ29Ib1VGUXBPbXhjb0psait0YXpBK01zenV2?=
 =?utf-8?B?dVYrWXVtQVFlcVFZU1dIM2JWaUdQR3NCZVlIeE93dnF4T3BRMkVsM09qRXA0?=
 =?utf-8?B?MS83RjZGQ1hLUmphNmg0VE1oN3g2alpCZENZNWU1ZmVwY2p0NHZuOEJuWC9M?=
 =?utf-8?B?MWFrajhNM3pzLzkvVElyVWNqRklabWlzT1c1NG0ydWxNQ3RZWUpBMVFZNVVi?=
 =?utf-8?B?anBKQnV3bUNJWTFDdTRpR05rTkdEMGhwNkIrOGFHcktBVzU2Znh3QktISGxv?=
 =?utf-8?B?U0tmcmFTcjZzQ0pUMnUyVjU2a1E4NFN0YkdNaXpTZjhxc0lWV0FCN3g3c2Fx?=
 =?utf-8?B?TFRKWjlMMks0ZDRtTGo5SnZ1dld6dFZVeFRtK09mcjYya2dLc1BsdkJFTEZq?=
 =?utf-8?B?Y1o3dTVMMFl6aWlFalkyODRwSEpXSXc2aTF6aVV4VmltcnN5V09TZnFDQWJZ?=
 =?utf-8?B?QlJJQUdmcG1NakRKRzNxckVoRng3OFdUbXRkR3FkeDVtM1d5b2VvYVUxMi9P?=
 =?utf-8?B?YWdIdFIvS2VaUXc1QkZQWTMrNXhmQ3dXVFpBTVVZUG45dEd5K2h1U2VKSE0z?=
 =?utf-8?B?WWo5SFg0MFNucGZGRUJ4N0s1cmpjVlRYWmJob0g3WERKd3A1LytiUlkzZzht?=
 =?utf-8?B?dldML0RqTHR0WmM5d2NOdzQ2STZ6MmJOaWhTcktZYmd5bncwNzlDUEVPV2M1?=
 =?utf-8?B?TmM3aW9xVndFYzkyeWgvTER5RTV3WFhwaFNvb3dFUGtQbDN3eWNvT3lyZ2xH?=
 =?utf-8?B?Z3gxMkFseHBZWlNqc0M4VzF3ODJlcEF0aVFhRGJpZVY1bTVkanJITHNubFMy?=
 =?utf-8?B?blJsRVB4T3ZVUmRla0VjeW5GdTBXR0xxRFFxNWJwMTB4aWZiK2h4ZDU1MGpF?=
 =?utf-8?B?dnBHQ3VaVFo5MzRsQTN3bDA3R001L0d0UG9Kcjk2elB6WVNvbUhrUS9DeFh2?=
 =?utf-8?B?STNtWStxSWVrNkpXNWpjYkVHTE9ja2tLYlllODFJY0hHMG1uazlLZGtKSjFL?=
 =?utf-8?B?WWtyN25vS0JaWVlYRTkzVHBFQm52aXI4U3I1dnNqMlM4VUdJYjU5VkFsRDRj?=
 =?utf-8?B?OEZDbVlNK1NIMHJmdnV1V2hKamY1cCtnZStwTnhGNTY5WTZGSmkrRFc0M0pr?=
 =?utf-8?B?bmVmcUsva3N2QTRXOFVmSzhtc05ibDFKUUxaWnhGQkYrUGgyaVRIME91TVMv?=
 =?utf-8?B?ZWNoazVGZU9uSXprd0NJeHNLaGJDSU94eDBoT25Nd01wKzk5WFh0NFdDZmlp?=
 =?utf-8?B?WWQ4S3pNSm81WUdqVW9CMVVRbndZeDBoWmY3c1ZKbDZocW9ER1Fwekgvc1o5?=
 =?utf-8?B?cXd3MmZaNUJuRnB2ZmVLOEU1NlpRM1RWNVBHQ1Nsd0hqNzhFdERYbWpaUVhF?=
 =?utf-8?B?RUJYWnJKVUpPUksrTTE3SXdPcEcydlc5SEpHeHNaQ3VwL3VhbUxLc3JmKzN4?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ZlFaTzAwYXVsN1ZpcUdDbU5qdHpMeTUvcUZvV3FCUUx5S25qckVhRXBZMVZk?=
 =?utf-8?B?R1ZIV3J0ZUsvTFFPRTFZcGxRVTFHQXBSNG4rNUs2YkJxRmdpM20zMEt6WVU0?=
 =?utf-8?B?QnJ5QjJQejVwUUQvL2pIaFRVYU9OTU5FZVpqK0pCMTJFVEJUeVhWK3Q0Qk94?=
 =?utf-8?B?cG9uZHgrZG1qSHh1WDd6Y2dBSWNpd2MzSC9GSkF4UG0xb2FaN09YSmc0a29j?=
 =?utf-8?B?U1NyK2h5RS9KSDJ2UThJRmV2NkFnV3dHRnNyQk5QME81dEVBSDRLZU5xZStX?=
 =?utf-8?B?dlgxRkN3cFB5cnpRWWVMMHVwZEFaMHpJQlh0aEFMS2JadDIrT2hmaFdCQlZC?=
 =?utf-8?B?NEJLWFp6c1R6WEpGWEJ3Z2pBRGlXb0c3ZjhmYUx3S3VlOTZLZTVGQmE2eW4w?=
 =?utf-8?B?TGtXOUpTS3dPby9ndWhEbzZaNzZtSFpaY09jejh4WHIyWld1WGkrNHlNdE1X?=
 =?utf-8?B?dHpYK3RYWTIzaGc3N2JTcitjQnMyN2UyQ3RYTEZmTndqeGJNTWp1UitpVlRk?=
 =?utf-8?B?N3ZjM3kva2ljdTJNYkUvR0s1WEJOcnBSYkNWOXk2aE5GbE1BUkRNK2pUOVNF?=
 =?utf-8?B?R2x6ZlZaTXgxUlVHWUdLTytsVUJCY2J1TGlESmhuQnlXcTBxQ1ZKSWhITTV1?=
 =?utf-8?B?Z0hsSTY2UUhDeHpmRGJIY0plejBBZWIycE9NVHpkSnJGenJaY0krQXIySmVt?=
 =?utf-8?B?OE4va0FZYWJ5b3dBZ1hBcEpLUHF5cWx1dDh3bmphMWoxaGx6MFh6WE1DL1cy?=
 =?utf-8?B?RnI3MWF5NnRWdDRhYWFRSjUvRXZiM1N2eWlpdGxURU92WkNVNEFYSVpNbk44?=
 =?utf-8?B?eXVQNVJhSDdwOTdSV2NJdEVCQy9pTXdIWmdwaXFBUm9mMDJ0cEZwdGorRmlZ?=
 =?utf-8?B?blo5MTA2Q2NXeG9PWnFIam9vZzcvUXFIU2dqOHVMWlhQR1FtQnpBbmZEOE01?=
 =?utf-8?B?ZFE5L1haMWNBZC9LcWlBbS9ESFN2aWR6VkVkUzZhZDhOdk8xanVHL3B1QkZn?=
 =?utf-8?B?bVE1endpQTBPckpnMXVXZ2hxZHpwbkxtWjVTYUFYd1dTQms2c1ZWbithK2J6?=
 =?utf-8?B?clV3UHdnd2UzNnJ3UnpEaDRYUFlJSkRxb255Z0NKeExIR25PZFZ0Rmc1OEFJ?=
 =?utf-8?B?YThQSTlIbVcvUGFURHFaRVFIaW41b3Q4K1NkR2pBRjFXaWxXTTdqaHNLVTYy?=
 =?utf-8?B?cjFsZkdZcDVtWGV6dDZmZ2hka0JZZ3oySW1CbmhCYkhuT3lQdWx6dG11SGd5?=
 =?utf-8?B?K0pnOW5QdWJJaW9WUUpuUGMyc3V1ZW92U2R2Ui9vMkFpazd4b09Zd3ZFQ2R1?=
 =?utf-8?B?OWhxUkcxQjhLeGhrOTl5c3RiaGtLUUtqUVhCWUlnYjdQNzNkSHBYb3VER01P?=
 =?utf-8?Q?DVQv34xZXlvte+gnoJaFoSBYtUllLTK0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c5212d-154f-4a40-e253-08db2552c7ac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 12:42:47.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdAE5IIiugXuYaeEcXczlamejFMNP2ACJ2nHc2OwdduzuVC1Zt/OV0r3fhezaZ/PaqtqXmarHg8WujTYBRJMsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6616
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

On Sun, Mar 12, 2023 at 08:01:55PM +0800, Huang Rui wrote:
> There is an second stage translation between the guest machine address
> and host machine address in Xen PVH/HVM. The PCI bar address in the xen
> guest kernel are not translated at the second stage on Xen PVH/HVM, so

I'm confused by the sentence above, do you think it could be reworded
or expanded to clarify?

PCI BAR addresses are not in the guest kernel, but rather in the
physical memory layout made available to the guest.

Also, I'm unsure why xen_initial_domain() needs to be used in the
conditional below: all PV domains handle addresses the same, so if
it's not needed for a PV dom0 it's likely not needed for a PV domU
either.  Albeit it would help to know more about what
AMDGPU_PASSTHROUGH_MODE implies.

Thanks, Roger.
