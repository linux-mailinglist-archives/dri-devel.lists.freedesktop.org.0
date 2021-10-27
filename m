Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A643C936
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5176E5CF;
	Wed, 27 Oct 2021 12:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26FE6E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:06:23 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBtWON006170; 
 Wed, 27 Oct 2021 12:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=fpDQvNjSIHSyUmTYmstLiTAgyqNZLS4iBM1wU2w57dw=;
 b=LAtLerWW4A/fGQZE5pp1H9isyO/E3oxLE+ERs1KKIQ4vI78ltE0w3s4GTomQW2T+Nkrg
 9xCB2oFX2KxLhntKMsIHCZxokTUurG76gzZZK+Wjy9tUDX8zI/CjGH2HEqqSX7ggoxsd
 oydC3usaVTVnesijqUD6CGw/9dPyb/b55cgKq63il0wU/7w9qA0pEb/jQW18OUlcA8td
 lFJKhP/hRfaFTGvu/YPlhcIqrixAcB/uxQZ42DPQsKqOu7T4kLZUZ+Nu+x6EhiZMaNXo
 QcLNJZOm2Jhp0YNRX/lDzadMtG4PXQ5i+Jml/kjsl44oflpnEhvUdmCgzLp9BkjVLsva dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fyjcmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 12:06:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RC1a1I070978;
 Wed, 27 Oct 2021 12:06:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3020.oracle.com with ESMTP id 3bx4gckbjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 12:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U72xwzbgwLqU8Ke1Yznub9B7U/JXnmvB//cRWYND7QA5uBNYX0suNwok12IRhIKmehjPszAHMsxSpEjh499Aga1gIU12foByHdpSXUR+QGKUrV10s1303cWKF2YtTSYxBOo60ThAw7f/cMX2riJ+/4CGn+YglNPauzJkTdw/XRzV+/MOVjivZyLZChZLMYXI2QBemIUxHNfb9LIgnn6tLd3+VajBtL2Zq3ldl5LgzLhMSQZFEI2Bp/3/BaGdIcBYOZ4WEr1N2OoRDi1WpxamdtTikmizWq6cFefpC+NqK9a4lsW2Q+LZL4c/IfIMdkFk3aDH/btBpcEfmNGFiePlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpDQvNjSIHSyUmTYmstLiTAgyqNZLS4iBM1wU2w57dw=;
 b=FHGzkBdjdS3x4FbliO63NzLKqamYacGrcFjdJnIEEqnM9Zf/VXoriGpAss3Mvq026QkgIW+qzZOMMQtwdlkNzD0BcU6JDKjkevKMGQtREcbm5Zy78PYVv+q0fDEdbACKCApOP7TjwmpxGinB56wFvdfwQHClSPfOnbRQz2s+a7B4ONZ8ZKnexrYJn9IAVGYCKMNTDewaZyOw2EVXCZc8taEyIkGLagAIBG0UlC1Bh6X+/sxInLfRAf2UxvLGV6qeFoG2AezTpkXMeGNqcXlJIz7b622qt/+++Xi8tqPU7B/rTgvswxANkRG5H4uAc2PETXCrYPRdfSOFvSB1WLuuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpDQvNjSIHSyUmTYmstLiTAgyqNZLS4iBM1wU2w57dw=;
 b=Xahvzbu+v+JjzwJ1hBwmtsLsbw4CXa0Wd0VpwIBncGYxrxkr2WuuYtt0NsyjaJW0Epvjwr7lpXjoeuuTCyphut2Mtc8j81rmbvTW85sCL/skmGFp3L7c54cqz17fsDd4AbPTmUqzucR8fmS2LYMF4m4J5cfZBth0pA/YOFrH9Lc=
Authentication-Results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN6PR10MB1859.namprd10.prod.outlook.com (2603:10b6:404:fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 27 Oct
 2021 12:06:02 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 12:06:02 +0000
Message-ID: <ba949aeb-ecd8-310a-8c74-ef2251c5a7f0@oracle.com>
Date: Wed, 27 Oct 2021 08:05:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com>
 <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
 <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
 <c73402dd-ec3f-4df7-6a16-36fb276a50f4@oracle.com>
 <CAMuHMdVHt=9N274SG+B7W83JbVVnbz_U5Nkejs_PR2HqvZvJgQ@mail.gmail.com>
 <d2119d59-89e4-34aa-86df-38fee2a0c6ef@oracle.com>
 <CAMuHMdUZq00r7QYeAKGm36UKpGwH_uEGMvwHBzRi9_nxV-dRhg@mail.gmail.com>
 <4cf6a155-85b7-649b-066d-e56da87dc8fd@oracle.com>
 <CAMuHMdVJ=92S9Ds66cYZO+96THsOkz-jjYPWUgsJ6oRibEMoCA@mail.gmail.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAMuHMdVJ=92S9Ds66cYZO+96THsOkz-jjYPWUgsJ6oRibEMoCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.224.197] (138.3.201.5) by
 SN6PR2101CA0024.namprd21.prod.outlook.com (2603:10b6:805:106::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.2 via Frontend
 Transport; Wed, 27 Oct 2021 12:06:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb2da3a-e8f9-40e2-dc90-08d999422501
X-MS-TrafficTypeDiagnostic: BN6PR10MB1859:
X-Microsoft-Antispam-PRVS: <BN6PR10MB1859AF21B2B31F4592A3506AE6859@BN6PR10MB1859.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hteKTb/wsxsXaNb+ZPc1zyBFLG9YYzIZMPmp17T6c1K+Gh4vHAZmfb7DnVPWVBgd3/bMYdE8GI9zHhUbeoxYRm3L0cTyaLsSahtPUMEYMwt9tXcRnNTq904D6n7TyQYynymKOQXgj7XFQXcnyVSdcs4/z9kWsg248tSOrx4EaSJOCNNcAKQp0O53Txk0n0xXsmJ0aA4YLnNcttEBH+9iHPqpeE+W0a8q7SnE+RirgFhjnHYE+CD1sxM2yIzxR5ruM3c0sk/wy35kvLhNvS1Oo6mrDaNIkzR+/Hy5EQaPS6dwroYlL04jGvUwrsZ0K4UrSbs1+lgRWzuuLMYKoSz4k+j+aSZQCl52sdCLbM3DpoiMv1JtKWetaoBvnBrnz88Ej2TEMg9NxI2esMRMPwukw3c7utAjBD4Rr8QLRXDrdUYExAacUZznKPr/ER/jXbMH88xLDlpayDcBY5Qz1T+XL2fKYwiPaZRFgfL/e819Tw/AZ3Q/uaVom+3xFi3yVaoOLeSSzWXKyZO2KhZe655iaDYxXx26gzY1Qr8NgzjnO/JuJPiCNCNRU9dVij7O6uKyJ8NYAPQcavNH0X2yglDpTEL5xLnAwDvefZg7R5d24bowFIrnDhyjB3vezCzl8cVXWSnxm1yzWXPjP7SNnuuEwXJyAAtH4iyVsEyFmi46yvAtdbBzMFqGDteBlJy9d4RMx9E5pF4Ao6doqXWu8WAjeGadifsvOHzptALw8dpTEuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(16576012)(186003)(31686004)(54906003)(66946007)(316002)(66556008)(38100700002)(86362001)(6486002)(26005)(44832011)(31696002)(508600001)(53546011)(66476007)(36916002)(8676002)(4326008)(6666004)(6916009)(36756003)(8936002)(83380400001)(2906002)(2616005)(5660300002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hDVUpqZVpiZnZjWUExa0lNU0FldmNjaFc0akxORVFGZ0J5V2N0WkZQT3hB?=
 =?utf-8?B?ZWlEeXcvNEhINWh2N2w2SFlsNzVZYTQwUy83TWc4ZEdTMWI4RVpwWmttUVFs?=
 =?utf-8?B?WWFiYUN3Z1IyRG1VUFAvai95d2RIS1IxWVp2bEtFWlJvakNmV3NnM2xJZnIy?=
 =?utf-8?B?OUo5NXdKd0lNQktxckh4QzFLRVdXN2owYTg1T1licVQwc3lvNnVxeE5jbzdE?=
 =?utf-8?B?eUZ2YjJZN1R0MEMwV1B2NnZiVWZWQWE2S0s1Q0tQU3R2dVhqTy9PdHAySlFB?=
 =?utf-8?B?dXhVTExPV3VhL0M4ck9ja1hjMWFabGd5Z0RpQ1VCSTRNZCtXL1k2L2twZmdL?=
 =?utf-8?B?RklLdnloZGgwYmd6TzAwMDNtWHdNKzVJUkxaSk53TDNNR0FLanFhQ0k4VFBi?=
 =?utf-8?B?anFPTHMrMXNtdnViUGl2L1ZENGRURnBSTGpBeFZjU2JITkpjTE54VzV4TytP?=
 =?utf-8?B?M2lIWU16bWR0WFZxMU1LMzY4ZTJYRGF4aThlZ01jVFFmUWc3Z29GdFN5Wjg3?=
 =?utf-8?B?OFhQTGpkT080SnEvV2g5Rm9SMTBQR1FYRzErRzdYSmwvYm9PeVZpUDR2azJZ?=
 =?utf-8?B?cGxzMi9nZCtsUWk5RE9jS2s3cnRXUElWVGd0WTh5OVhkb04zZ0NIQ3RWcU9E?=
 =?utf-8?B?RWdQNDBQQzBwTTZKQ3RXQzRmemlQbi9OV2QyWHFuQ3IwNFFzY09icGx0bEZ3?=
 =?utf-8?B?K1djU1lJa2I2VlAvRUhTYmRnaDVNTGpCbTd4cXFMV25hWlhqalIrRzM0SHpL?=
 =?utf-8?B?WndzWWdEcnBpR2xVSjFFN2ZqYXVOQ2VKTzBKQkFOV2dUcXZ1SHZVWUxZZUVs?=
 =?utf-8?B?cE5HRzZ3aWJxNi8wcU1FYVdmWVV6ZmdOOVRTSHpjeHZ0SllXdnRjYlR2Nzkr?=
 =?utf-8?B?eXpXRkoyalRJSy91NnJYVUtMend3LzJSSThXcHA0UWlYQmU1M05ESEhxUjFs?=
 =?utf-8?B?VDZaOWo3UHBXYWFFRGMvTy9IYWhqeHNOS1dzczRUT1JKU2pwendFdm1XL1dq?=
 =?utf-8?B?MkthOC9TbU42dDRZWmh0VTdUdHhzY3pEY0R0UHFoZ21qaENoSXVxRGd1dit3?=
 =?utf-8?B?NGNhdGNZWGxWUktJVTFBRml0WHFPcFFQbVNKTWZrTFYrUWp6akcxSTBhZTll?=
 =?utf-8?B?alo0WHpKMExsSzZTdGo1YzhIb3d1RDdnT3M1VGZVYVp6TUxmdHFzM2ZTTEVQ?=
 =?utf-8?B?VXZqVmdaaE0yeFc2ZmpMTkNDZ1hqYVB3WVVOdzk4YURlTjNUeEtUa0hnbEN6?=
 =?utf-8?B?ZjgyQm96SEFQaFp0QWs4ODdxajJKYkp2NzZsYUZSdzBXclFYSjF5WnpoaTFD?=
 =?utf-8?B?MTRUK0Z0a3RnU2ZqV09nMHJpQU1ySnVRSzIwMVlsM1ZKSTBxYU1aTjdtWk81?=
 =?utf-8?B?VEZ1NzlmSjBDb21KM3pwR1ZGQWlZeTlvd2duMEtaRUJ5NTBGT21Fbzd2UVR5?=
 =?utf-8?B?YWY3bkNyNzFYVjA4RUVpSURpTzUyY0lGWWZZM2ZtZ0k0TDcyU0xMaTcvVkpS?=
 =?utf-8?B?M2hFWmxPUm1iUkVwWmdkS0p1aWlGYjJMTWhtVTBha0tQUVUzNTY1cWF5b3Rm?=
 =?utf-8?B?RDFuakZHQ0hNMGNIOWxOeXNNZnhIdkc4cUxGakR5WVRhZUFldHBYejhtNXJH?=
 =?utf-8?B?V1RFME8vUlVlMlVpVUJ1TW5wQnBsQk5MMVViNjZ3d2NNTFpBWFpZYmdWckNL?=
 =?utf-8?B?b1NjRDRWeVhzRlo2Z2xvY3RUNGVtcStoQWowKzE1SVpEb3FFNkNrQStWRzAy?=
 =?utf-8?B?N0prcDFlL0VtYTNSWEs1dkcvZGZ2V1VvdVJpRGJ5U1E5b0RFRXlEVkRTTEla?=
 =?utf-8?B?SElrQnZoSkptRW5kY2dDUndiZ25vTDJ0djZmemFIaDlrbHFvdDB1eGcrWmV5?=
 =?utf-8?B?VFZzakhiMktlTERRZHlCK3IxV2NEeEVaOTROQmh0L3VPSW9Rb1cwNURaNHhS?=
 =?utf-8?B?T3NHaG9ZU2d2V2FwK20xK2RDU01nZGZlRzNYQWZkR0FCWllvNS81QVJzQmZH?=
 =?utf-8?B?ZHRxQzR6VjF5SVhWNTVhakc4KzFyaC9yYS9nc01xQ1Nkd3ErMDg2Sk1VOFpn?=
 =?utf-8?B?eFozSVZuaWM3dzgxcTRPTndiOVpGWjhMVllKNjNWc3BxcHlFcVRaZEN5M3Bk?=
 =?utf-8?B?dk01eTU4UzBZMGQwQ05nUlFmNi9ENTlWN0tpQjBVMG42ZlZ6dnk0MmNEcGV2?=
 =?utf-8?B?bjdSUHhkenNWT2lZSEpkbWdQcVBJT29ZWGp3SWR5anVFcW9Rd1VNOWxiTG9U?=
 =?utf-8?B?UGx3OXcvZk5hNDEyWU5ScXRtOEJnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb2da3a-e8f9-40e2-dc90-08d999422501
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 12:06:01.8839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+gD+z8txOVI/0tnjspPxg60aIQx/Mxao5te+YmMKC6IbpqYz5e8PBeFy9xvcBoX/uLAXIXlQmZha4zqbPfhDosSONYpyWOOcjyZCn2ZZgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1859
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270074
X-Proofpoint-GUID: eFyV9Cd7kzOkQQ5NVte836w3I41bHtVK
X-Proofpoint-ORIG-GUID: eFyV9Cd7kzOkQQ5NVte836w3I41bHtVK
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/27/2021 2:53 AM, Geert Uytterhoeven wrote:
> Hi George,
>
> On Wed, Oct 27, 2021 at 3:13 AM George Kennedy
> <george.kennedy@oracle.com> wrote:
>> On 10/26/2021 1:12 PM, Geert Uytterhoeven wrote:
>>> On Tue, Oct 26, 2021 at 5:48 PM George Kennedy
>>> <george.kennedy@oracle.com> wrote:
>>>> On 10/26/2021 10:11 AM, Geert Uytterhoeven wrote:
>>>>> On Tue, Oct 26, 2021 at 3:38 PM George Kennedy
>>>>> <george.kennedy@oracle.com> wrote:
>>>>>> On 10/26/2021 4:30 AM, Geert Uytterhoeven wrote:
>>>>>>> On Mon, Oct 25, 2021 at 9:37 PM George Kennedy
>>>>>>> <george.kennedy@oracle.com> wrote:
>>>>>>>> On 10/25/2021 3:07 PM, Greg KH wrote:
>>>>>>>>> On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
>>>>>>>>>> Do a sanity check on pixclock value before using it as a divisor.
>>>>>>>>>>
>>>>>>>>>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
>>>>>>>>>>
>>>>>>>>>> divide error: 0000 [#1] SMP KASAN PTI
>>>>>>>>>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
>>>>>>>>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
>>>>>>>>>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
>>>>>>>>>>
>>>>>>>>>> Call Trace:
>>>>>>>>>>       fb_set_var+0x398/0xf90
>>>>>>>>>>       do_fb_ioctl+0x4b8/0x6f0
>>>>>>>>>>       fb_ioctl+0xeb/0x130
>>>>>>>>>>       __x64_sys_ioctl+0x19d/0x220
>>>>>>>>>>       do_syscall_64+0x3a/0x80
>>>>>>>>>>       entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>>>>>>>>>> --- a/drivers/video/fbdev/cirrusfb.c
>>>>>>>>>> +++ b/drivers/video/fbdev/cirrusfb.c
>>>>>>>>>> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
>>>>>>>>>>          struct cirrusfb_info *cinfo = info->par;
>>>>>>>>>>          unsigned maxclockidx = var->bits_per_pixel >> 3;
>>>>>>>>>>
>>>>>>>>>> +    if (!var->pixclock)
>>>>>>>>>> +            return -EINVAL;
>>>>>>> This is not correct: fbdev drivers should round up invalid values,
>>>>>>> and only return an error if rounding up cannot yield a valid value.
>>>>>> What default value would you recommend? Here are examples of some of the
>>>>>> possible cirrusfb pixclock values:
>>>>>> 40000: 25MHz
>>>>>> 20000: 50Mhz
>>>>>> 12500: 80Mhz
>>>>> You should pick the lowest supported value.
>>>> In bestclock() the frequency value ("freq") is not allowed to go below 8000.
>>>>
>>>>            if (freq < 8000)
>>>>                    freq = 8000;
>>>>
>>>> If pixclock is passed in as zero to cirrusfb_check_pixclock(), is it ok
>>>> to then set the value of pixclock to 125000, which will result in "freq"
>>>> being set to 8000 (or adjust the passed in pixclock value to make sure
>>>> "freq" does not get below 8000)?
>>> No, clock rate is the inverse of clock period.
>>> So the smallest clock period (fb_var_screeninfo.pixclock) corresponds
>>> to the largest clock rate (freq in bestclock()).
>> How about this?
>>
>> This gets the frequency derived from pixclock to maxclock or rounds up
>> pixclock to get the frequency as close to maxclock as possible.
>>
>> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
>> index 93802ab..2e8e620 100644
>> --- a/drivers/video/fbdev/cirrusfb.c
>> +++ b/drivers/video/fbdev/cirrusfb.c
>> @@ -620,6 +620,18 @@ static int cirrusfb_check_var(struct
>> fb_var_screeninfo *var,
>>                   return -EINVAL;
>>           }
>>
>> +       if (!var->pixclock) {
>> +               long maxclock;
>> +               unsigned maxclockidx = var->bits_per_pixel >> 3;
>> +
>> +               maxclock =
>> cirrusfb_board_info[cinfo->btype].maxclock[maxclockidx];
>> +
>> +               var->pixclock = KHZ2PICOS(maxclock);
>> +               while (PICOS2KHZ(var->pixclock) > maxclock) {
>> +                       var->pixclock++;
>> +               }
>> +       }
>> +
>>           if (cirrusfb_check_pixclock(var, info))
>>                   return -EINVAL;
>>
>> The work can't be done in cirrusfb_check_pixclock() as var->pixclock is
>> read-only because "var" is "const struct fb_var_screeninfo *var".
> Perhaps the const should be dropped from the var parameter, so the
> rounding can be done in the function where it makes most sense,
> and where most of the above operations are already done?
>
> Then, you can simplify:
>
> -        freq = PICOS2KHZ(var->pixclock);
> +        freq = PICOS2KHZ(var->pixclock ? : 1);
>
> and change the "if (freq > maxclock) return -EINVAL" to use maxclock
> instead.

Thanks Geert,

Will make the suggested changes and send out a v2 review.

George
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

