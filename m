Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A9D6BB56D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 15:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF5D10E1F1;
	Wed, 15 Mar 2023 14:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8210E1D7;
 Wed, 15 Mar 2023 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678888856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CHY5qF9wAd1Nof3dn16aVCMDWRiQOvidYcTH2ZiNEMY=;
 b=gIp/+a1e7qxlnWlHJx8pJB++5ghy5+EefCK4xxY5mS7u7CeqeJzvzx2m
 iW8LYggJLGsp8skVLkh+QCD6AYYa+afUYXNXah2ujsJCEaRrqVPV4ieiC
 GzfkAUHSwylcCrPiTG9jN6Og5iU5xZuegpMh2MNDpuAgeKTaSpAL05FM4 Y=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 99761977
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZvBX0azWg5TuoBAyrHl6t+ewxirEfRIJ4+MujC+fZmUNrF6WrkUFy
 jAcCjrXbq2DNmGhKNt1b4/i90NTuZXSzoJnQQNsqyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUxx0
 aEpK24SUi6ojtC52KOUFepu39t2eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQpuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE176Qw3qqB916+LuQ2vBlrli462opEQAXDULh/dqTlx+SRIcKQ
 6AT0m90xUQoz2SxR8i7XwCxpnGstxsQHdFXFoUS6g6XzbHPyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+TqT6xIiETIXU1eT4fTQAF7t/gp6k+lhvKCN1kFcadhNrvGCq2x
 CuWti8gnLYCpckR3q6/8BbMhDfEjojESEs56xvaWkqh7xhlf8i1aoqw81/Z4P1caoGDQTGpu
 HkChtjb7+0UC5yJvDKCTf9LH7yz4fuBdjrGjjZHE4Mgsjig5XOnVYRR+y1lYklzP8sIdCTqf
 EjL/wRL6/d7NX6mKKB5c6q1Ct821u7uD9noWv3PbcZJet52bgDv1ChqaF6Z2Wzgig4gnLw0O
 ZqBWc+pATARDqEP5DG2XeYGzb4iwGY9wm7VRJ/TxhGrl7GZYRa9cqsIL1KUcqYZ7aeIrQ/P+
 tBTH8KPx1NUV+iWSiPK65waKVcGKmcyLZ/zos1TMOWEJ2JOGGYnBPvcwOpne5Fsmat9n+LEu
 Hq6Xydwykf7hHSBOwWDbH9LYbbjG514qBoTHy01PF+unVMjbICH5aITMZAweNEaGPdLyPd1S
 7wPfZqGC/EWEjDfoW1FNd/6sZBocwmtiUSWJS25bTMjfplmAQvU5tvjeQip/y4LZsaqifYDT
 3Sb/luzafI+q85KXK46tNrHI4uNgEUg
IronPort-HdrOrdr: A9a23:Y50EFK14LOUCxQX5W66icAqjBJckLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWbtN98YgBEpTniAsa9qBHnlKKdiLN5Vd3OMDUO3lHYVb2KhbGSpAEINBeOlNK1vp
 0QF5SWZueAd2RSvILX5xS5DsZl4PTvytHUuQ+Up00dKz2CEJsQjDuR0zzranGekjM2fqYEKA
 ==
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; d="scan'208";a="99761977"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 10:00:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzpeOmBgt7g0wCxIsjTciNZM2QeO0vynpj9RQj9PA/fJuyhKCQr75dwVcZGRuEYl5QLJGk2lZLE6H3UWvUhwJERoKolktNfjUBZsMH4NxUONLPlMWO5LuTUCSrE3JNVVArelAgm16v3GUyduC4jHviWideZaMUJ0BPwihIsMxq+d29rEmhRahN7Fco+Bc1By8mZCJR30o83vR60g13H7lm/PS/BEP0TfTAu6kPW6ZLTlcrGtW2HLA1aUfAyd8p8W0LZhPRXzEw/OFl5L8y43jJ9BjVDSdFbjwCaacJkt4SRIPHTAKzgeX/PfcR7bujWYSkMnKo0Z8K/o0I1/KZ6zEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOFoSjsc7ejNROHwp3UOXc9UCLRpiccauiYtgZGAyGA=;
 b=huxa02xbA4GJf0OdJ7uOXbC7kn4Op0ieLjjXVLQPHU9ReUnLrk8jDTtwcsnLVLPswRk1wl66wqa5V8F/Mo+lKrq52+cC7hNxhlzXjoKB9fCyVANiTHB+3g1v/jgtiPe3EUq7+qJsZTP7f6cAHdYWBa4HRW+Xpyf0PVZ7uNnfnkrBH52404Hb8MPPGZaMP+UAf1i3j4p7gaSyKzQ1+aQGxiHL+hf46Im6DZVHMfTniQnaozHS/qEeZ4/2lLXRpsOIIePqILF0OCcFC3FFQmzUNF6Inqru5Zg2D7u4+PE+vmD+TktMuBUG79kefc+iBDqlW0I/b9EKE1spmobjjVso/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOFoSjsc7ejNROHwp3UOXc9UCLRpiccauiYtgZGAyGA=;
 b=w1WCT3N4d1e11AZq4B6twq88nsk1Jj5GR87Dvsqh83jOyF1H3JUl/wMbyCTsehyi3DlPv5L++aqAAS9B9wvWSNDBqq03xxTBnBwAkgrruazg1CIcHEYrU9fThjuoJg0UsH7d8KhLeZjrqO9TdzYEl+ZtvedDunAPOgjneDWaJt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by BY1PR03MB7240.namprd03.prod.outlook.com (2603:10b6:a03:52b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 14:00:45 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Wed, 15 Mar 2023
 14:00:45 +0000
Date: Wed, 15 Mar 2023 15:00:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC PATCH 4/5] x86/xen: acpi registers gsi for xen pvh
Message-ID: <ZBHPhq/TxEx+Lxsg@Air-de-Roger>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-5-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230312120157.452859-5-ray.huang@amd.com>
X-ClientProxiedBy: LO2P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::18) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|BY1PR03MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: e80ad24e-e139-4952-ec6d-08db255daba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JjRS3E4SWHTo+tiGyOpSi034MloYJRuqAahNAYbBRmFPamVmViQq7fzqgxlo/pyYUJJ7LFxXVO00tgxZ57K4bIvqxuo1z/US/d27gZle12OMvNvuLV6uLM2N4KGiFYdj9i4kVOudwydWikPEG7mMc4OVyTOq7bQmPKJa3V3wGxV51Za8eXtOZgUfLmaAB8buwGQ5KBfuEBHQ8RwlPgYGqMOfI4Xvv+NKSTq2IordnXe1B3bhT8pdECwnGZXct+GoqiCIT/Z7MrtIlurw2t/G47NFVtbo0uWitVHjEX1CWWpdVvfNceczvRxSTJSakadVXY5gzj2Q/bhgRNQfV0AAtWaKHzDgGWXbGlnnufJLyAOwD9Gq0A3o7oXJgaDKCkhhGq+tJ+mYqwY+dXRifgodrLKck/mZ3Ge6tWRLCTLd2vWL3DBRHPqCD1fW7bKD2R2fM16WkX9P/dDb0dEITf139v8FhWyphCLGQa7Q/zXE/YqH/3Dsa10wwgEUiKuzT7hqF9ZPyg+Emo0t3GS/uCe9jILFWCWDsR3xH+xgKIpBVflSXbR6qBe/9lg9eTKDzT7DaTMaQIS1R3PYcObWWHVkAqKvIaM3YlUOGYpW6BKNP3NZpKMYTsg69fW2hSSOJxpZ0GeQfek3cTKQY4KD7U5yxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6368.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199018)(85182001)(7416002)(5660300002)(41300700001)(8936002)(2906002)(38100700002)(86362001)(82960400001)(478600001)(66946007)(8676002)(66476007)(6486002)(6666004)(66556008)(6916009)(4326008)(33716001)(54906003)(316002)(186003)(9686003)(26005)(6506007)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUxvdE43WnZOdzZDTlRvTEh6RVJrcXVWN3pqSVE1NjMyd3ZMRWtIdEFtZ2pZ?=
 =?utf-8?B?Z0pnWm80VE9JaGdwYURxNWcyM243THpxRTFxN3o1V3g0SlV5cVNZK0xGM0Qw?=
 =?utf-8?B?cFVoaCs0NHMycG9LZnFwaEJwQXBBWjR2MVNnTjczeGpxdlYyWXdSK04xcEpp?=
 =?utf-8?B?ejhWTzZUQVV2WXZiOGRsOGpVRWVpRVhzTmVmT1ozaWZMNzBVeW9iTTVFQVlp?=
 =?utf-8?B?K29qeGdjWDltcXJWNXVrYVZxODRIRndpNGV3ZSt1NHNpeWJPdlBpbXlVNml4?=
 =?utf-8?B?dWtlVkdjeGZkMTJydmJ0Zm5lNHI3OHNCVGw3Vmh6ZWN2UXNrTWl3VVRRWnVq?=
 =?utf-8?B?L3g3UzY3WTFNUXhkTDFoMWhiVnZBUFBSeFJFY2JFNEJOS2JoWDFIeExmcE8v?=
 =?utf-8?B?UXF6ejR6QnRLcW9EYTRNL2NHRzlqVnNwTm1PeE8xZTZVRjA4RmptMnhSQ2xr?=
 =?utf-8?B?dTVJR2owc2Q2ODd4K2E2SyszRUdra25leFRhd091MHpza1VobHN0VFRLRjAr?=
 =?utf-8?B?S002ckhNL2hvbzBhcythbXFseHNXb0x2cWRYaVkyclllSnh2enBYMlgxQkRx?=
 =?utf-8?B?ZTg3YllsTXNTYkdsQVhiT0pCQysrclYvVkE4Z2RvUSs3azJOZUJxMDllL0JY?=
 =?utf-8?B?a3dyUHZ4TXplZlpzeW8vMUhjNWVxUlQ5ckozVld3NkE2ZTVWcE9ZWVhTOEtW?=
 =?utf-8?B?NExjMzNyTHZTN1JKWExXOEJNYWlPRUpSZDVXNmxGYkZMWnkxV2lyY3RmdVo5?=
 =?utf-8?B?cEFnQ25mUmFhTzZiZERnY2R2YkdxVkIvcVNHZ1c2MnBIUUZqZ1kzdHV4R091?=
 =?utf-8?B?R3FOdUhkQVo5VklZK3hadGdxNzJ5SGdTNDR6ZDVYeVgzNU1CVXNZTVhIcnBj?=
 =?utf-8?B?cU11cG15ZXJweUJvaHE0UGNSUUlIUm9PYjkvakZYbzU3NHgyc2hmNk5ZUTFQ?=
 =?utf-8?B?VG5aME42OXRBVTF5M2NiQk9lYjNKazJYL3J6QzJHSldWMlhzRHpWTGJuYkN1?=
 =?utf-8?B?M0g0elkrUHZRWU8rWGU0NzhqL3dEVXorVjlsY0VuQ0ZGWHhSS1RTRUs0eWw3?=
 =?utf-8?B?ODVSRUhSUllFRlNLSy9XbFY2ckRYTHlxRHg4aU9NL2RkMHlMMXJYeVJBUGEy?=
 =?utf-8?B?bWFTYXhxWFJRNnd6dGNQVkZSL21JUUltS2dkVUJJTlVLTnZrTGZmM3RoUy8x?=
 =?utf-8?B?UTBpcjBNSTJSTERNL0FxV0s1aWtmUUNKZEdEc1diR21DeitxZDMzODd0ZWV5?=
 =?utf-8?B?Q0gzWDNrSkwyWjJWU2N1ZFpuSXVjaWZiaXBCTnFhWnlESitxREtPSU9TR2l1?=
 =?utf-8?B?VlRPdFcvUW90cmd5UGNjWTQrSW9PZWVCMmN2eHpxRkRCTHYycWF0MU5iT0Iy?=
 =?utf-8?B?bDIwL2RLM2grcS95TlNPblAveERicnlUdjlaclpyTURjYmZzN2lUd2RLM1Nt?=
 =?utf-8?B?ZTB4VFM2Q3BTOVZmRjFnQ2llWXdjYzZGRURWRDR2cm1melRiOEgzWDdCRm1h?=
 =?utf-8?B?aEFuYjhVTFBBVVZqeUEzMmtEQVRKekI1dUhqUmREOU5jOTNFYlhTZjJBREhk?=
 =?utf-8?B?eXh3T0V6NTYvOTl2OUJQbFJ0YjRMdnJWZHNsaFA2VkViOVI4M29YdWNHWVlT?=
 =?utf-8?B?NEgxQ1ZhQzFwK1JCV1VxdkdMMFZKWUUyVDJmVXd6QktUaElZWWJLb3FMTkF6?=
 =?utf-8?B?ZUtSejg4TGRhMWovRW8zZ2Z5d0NCUWlRNFZSUUlLTWQ3Zm0wR0xtNGhIVHI1?=
 =?utf-8?B?TEtmWVM1dXI5RHNFcmEwYjhwTU0vUFJscDFNUkR2eWMyc1hPTW10bFRLOVp5?=
 =?utf-8?B?Q3o2NU5lZXlIS2tmaWZsSGhlZjJLT0hOYk5FTjVyZXNxZFB4NjROaVFRWnhn?=
 =?utf-8?B?ZGlzMDlUc2psaXdGQXZYeEhRVlhkd21hUVBETDRVWlBmZjMvaEFrNk9xaG1R?=
 =?utf-8?B?Ry9MeU85MFBORDZ4QjBLWjVZZC9pL3NaRHlGeHFHUVpzMlhvTHVhQ0pzcGFZ?=
 =?utf-8?B?WnRwSkJmOWQ3NWdWc3kvWWpsQWJuc0pmeWpHYlJ3U1hMeGtLUi93ZHJmOE53?=
 =?utf-8?B?ZnBCdUJ5UEdKMUZ1eEhwcGszSy9LeTdHc0tEbDJtcVNwSGs2cTdWYjI5a0J0?=
 =?utf-8?B?RGpnT2ZtVVZrU1h3ZE5qdW15dnAxTXZhMFEyYXVLRVZ6dWNaQ3dUVHhSUVhs?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?a2xjSkRXRkRZY2xkeEMxYmhvckx5UFN5eXhxcWlEKy9aZjgvWVQ1VUhpUHpJ?=
 =?utf-8?B?NW1oRk9VMzFFa0JaK3M0OVdLbXljR3lpaHlSNTdUekVmKzFiS2U1MzZ3dHJi?=
 =?utf-8?B?bmNxTDZYcUpXUHVlRG1TMXcrZ3JIYk5GUmIxVmhkMHdGdkpmcnZjWkpyWEhC?=
 =?utf-8?B?WFh0cFVtZE8yMTg0N1lsdktUSGpJeGpKYzl1VCtXUWx1cWpZa3l1NURQaU9N?=
 =?utf-8?B?SnFkYW5STTg2L1owNURjN0s0SXpnUEU5bnFpK2N1VTViQU9tUndBVldMS3RL?=
 =?utf-8?B?eUV1THBHaVdGeEZLMFNJWGx1RjdWN0pXVjhxUXBtb0lxNkIzUHBiQWxmdnc5?=
 =?utf-8?B?cng0Z29UTUs3SjFuSE04SCtsNGxnelF4UGJ0RSthWE1za0RYbDIrelFmdkpu?=
 =?utf-8?B?U2FndUpEL3U1bFdRelFxRmpxOURIM29CQVBYeGxPVFFwT0dYU0dabWw5cUdi?=
 =?utf-8?B?Z21NWE5rZ29yL3B0UkpyOHpKQUdQTHEwWjhLWDByMXZFclRWaHdVSWVEQ2pW?=
 =?utf-8?B?Q1A1Ly9EdUpzd2dkZ3RBdlRsMjhocCtwWWJPdHdhZVBEWUMxbmFWSEVoS01K?=
 =?utf-8?B?blhHSEFwUlUvV0V2UWNlRk5XREJHbkgxeEhEazBDa0RGeGYwNlJNUTdKNEND?=
 =?utf-8?B?K0NiVjl6ZS94SnZoQTBVNVlqWk5aeGtERE10R2tyYzFyQUpTNVhQTWNWZGdu?=
 =?utf-8?B?MnhIbWtHSHA0TTRhaTFDRm9rQkg5SlZ3L2JuOTNVaDkyYUFWNVhKSDQ4Nldx?=
 =?utf-8?B?L0NqM1duUEd5RWVSdnd0VlEwbkkwYzhNRDNGSFA4MStnbUp6LzlkNFZTaWsr?=
 =?utf-8?B?TWZDUWVVbTBpLzRkcmRmWUFQR0I1Smp6bzBWU2pTQjVoWExNT29rTXdhbmI4?=
 =?utf-8?B?LzAvUndVMDVzdEtGTzMxVDNBd0FXQThnZDFpK1hMOGhId21nQ1NUMU5jOUJ1?=
 =?utf-8?B?WWR4Mld3bzAybFBYWVpKaHc1ZVlqN0NaMkl1T2c5ODJnbUtnYlpPNG1GVzdO?=
 =?utf-8?B?U1haUEhGR09PZUUwT2FNT0VFaGJnZDdpaTZZMFQ5ZTBkT2kxK2ZmMU5WdWJW?=
 =?utf-8?B?ZlpuLzYxaTZiQ3pqWXlZSWRpZ2MyY3Zkc21WUVBaU0ZIaC8yU0Z6MWxFVWxT?=
 =?utf-8?B?ZXhJcHZNQkJZSTQvYitaWlZlUWhzekxXdTduaFNJUndGbmRBOWEzNlk0cmZk?=
 =?utf-8?B?dTBUbmNmK0d5L0pVSmFTRy95TThXMWhITWdrSi9rVHVBOEVnTnNtUHgyQ2hB?=
 =?utf-8?B?ZkhFQWsxK1c0TXRUbWhTK1ZBRDJJTkNlZzVXTXQ1enFoUU9hM1k3aHJmNGdJ?=
 =?utf-8?B?aTdmMHJqTFhyV2cybU1IbnJFM3VLdW8xLzlKMDNnMDQvUVc3bVZhUjdsNSt0?=
 =?utf-8?B?K3JtOWZRSm90VVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80ad24e-e139-4952-ec6d-08db255daba2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 14:00:44.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxRhoNKTd/MTBRrsxFuUMGhXYKDLVjO2OKe0is7cAZjLQswbG4//084MrqPsRz/y3oJfrpoZTv6pJe5oEY1/fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7240
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

On Sun, Mar 12, 2023 at 08:01:56PM +0800, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> Add acpi_register_gsi_xen_pvh() to register gsi for PVH mode.
> In addition to call acpi_register_gsi_ioapic(), it also setup
> a map between gsi and vector in hypervisor side. So that,
> when dgpu create an interrupt, hypervisor can correctly find
> which guest domain to process interrupt by vector.

The term 'dgpu' needs clarifying or replacing by a more generic
naming.

Also, I would like to be able to get away from requiring dom0 to
register the GSIs in this way.  If you take a look at Xen, there's
code in the emulated IO-APIC available to dom0 that already does this
registering (see vioapic_hwdom_map_gsi() in Xen).

I think the problem here is that the GSI used by the device you want
to passthrough has never had it's pin unmasked in the IO-APIC, and
hence hasn't been registered.

It would be helpful if you could state in the commit message what
issue you are trying to solve by doing this registering here, I assume
it is done in order to map the IRQ to a PIRQ, so later calls by the
toolstack to bind it succeed.

Would it be possible instead to perform the call to PHYSDEVOP_map_pirq
in the toolstack itself if the PIRQ cannot be found?

Thanks, Roger.
