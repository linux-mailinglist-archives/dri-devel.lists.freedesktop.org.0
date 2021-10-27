Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3600343CD6B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 17:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEBE6E5C1;
	Wed, 27 Oct 2021 15:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3CD89C13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:22:22 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RFDf1X023028; 
 Wed, 27 Oct 2021 15:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/4z0q7Ra7dgojQb0NDe+9ZboRy0nx6RarBIJ0WiMkiI=;
 b=0kFH7P4hzF6sJuC4AD+Y3rtA2IFQ8oPGMSNedmyrkkHvkgdByX0XPyvNr6jCE8tKUA4n
 Lt0dN9QK4n8Z6vRNIB0kaWDFRKOSl1yohMorzE4zlMJkgPhmosDME0WPKzBS7S5wI0tj
 O0ONw+TP8pwQIJkE80BxGMgNi27ohgFcY/0RjMtSEpG77bD6AKFZjKldqE2wkIwVcX0D
 H9+exPAGdZVxuCgisoOmIUGyu8wbUgU6EvxYk6S/AcaTnN7VkNonBj/LpDw/gZtH/VC4
 eMlFT+LuLnTDuffro+Wfgd2rZ6zhtAAuyfHArfH9LrG2m3dpv3NVcff66rDG0as3ycE+ mA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4g1aj2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 15:22:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RFBIKg055161;
 Wed, 27 Oct 2021 15:22:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by aserp3030.oracle.com with ESMTP id 3bx4ga338c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 15:22:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmRba64Sk0ThPVXF6ICBh6CdV9QxwJzN0GIsyISfwl8ZbQUz0+DSEmo9rlEAcE3q/Xezl07SWEOaAkvVORAaKkzybLufOA1sv8xJzudVFXbnCYCFLvja39ja0+APARSKIQAupha+Gedm5PD8p+e3je/CBK3V0D4QfnV/dexGehZcL1R2CLloYdesUAwgpbVXrBmSRUbHtBYMPL6g/mh2ayWC48BhA8KUFPmP5qunpPpXc3zasMZ5aLKPBFlm4BnJrVUW+SfMKAS35E9wiKLE35zeLfqxFeXd/zxlb0BxheyeVrEToc9cQDFO60778bqcrSX+1+tS613ENnj6ul4lEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4z0q7Ra7dgojQb0NDe+9ZboRy0nx6RarBIJ0WiMkiI=;
 b=TV5Z/MIpcSCIu5hbGpRAmeuZysHHjr1aiHC8rBCI3kbN9xyypUE06+EBLKd/brt3YEt4Owo/FtMEf3T6W9LJv35ljmt+Vbos9jAFEEtUNfbgxPPQoeOO4+KGMp+c8oSmmRn0Yv46J2KX8Geqjn69q46mBvJx/F+IyjWfU84QZtUdlek3NCY0yXaU/XOBlFcuFZ/y3yFyJwPFjksUULn/SyOIfSmozL+OwSgiYMqrdzFoDdRlgfCYC/1PvUUMqSImXce9M771wmmQzivHtt7WQDYvhvyhb/HxHl6TrBUdG6TwT37SsTpKVjLDdrOhx83RKpVJCitBPL+diAlYFs0RqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4z0q7Ra7dgojQb0NDe+9ZboRy0nx6RarBIJ0WiMkiI=;
 b=m1SLPkI0udMgUT01yZMkVv9dF0gHxAOHKFsbZkSRbl4DGWGpm1u6bMwBvRKPtv4sSHKQgX3wJ3H1god6gdcwOlBYO5tzlQe0jtovmNElKok5KN8nD6VtZ7pHvvbfR0t8dX60blyZZwXBSsL7W1OJDF2mN4pdvqQo447UEP9uq7Q=
Authentication-Results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN6PR10MB1458.namprd10.prod.outlook.com (2603:10b6:404:45::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Wed, 27 Oct
 2021 15:22:11 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 15:22:11 +0000
Message-ID: <faf1e157-d70a-4522-e84e-24934f27042f@oracle.com>
Date: Wed, 27 Oct 2021 11:22:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
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
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:806:6e::29) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.224.197] (138.3.201.5) by
 SA9PR11CA0024.namprd11.prod.outlook.com (2603:10b6:806:6e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Wed, 27 Oct 2021 15:22:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1364bb72-7958-4a75-d102-08d9995d8bc9
X-MS-TrafficTypeDiagnostic: BN6PR10MB1458:
X-Microsoft-Antispam-PRVS: <BN6PR10MB145819DE0ED4C50A1996095AE6859@BN6PR10MB1458.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zy3D2HcreJUcbVdrcrCXs1zKZt1HO4lFR3UhG9hVef+n3AfdehElJYYvPpm5S7U1JlZeiAuiubIAxKpygJvG9g2jXMZx70NC5FcN46J6abAQFp/91Tl1T0xLdTnFFkaY970zzwgS7oGkGYZNyoi2NbVdAkG5A0YM7ymCAvjuNPvSSqJwoVX9mGkGUrAKkXy7Pg19Iz22qO5CIfYBxVJCSIp5J8NjqTMZZ++kZeXNgjRsyrqONucLz+vLUbDevyU9FftSyBET9ZsV/0K7g2ZCRCPybPMKSUHHWo8O8X+H+oDYFFWk+nKGdz2a9tR0ft3F59BXCEnhaJXx4r70LqECN61xsXY9VZNg9zBl3n6kUw5VMKZhZdp8DfvjACzvffGoEyzn46hu9MBGqtMezHUQ2zo/srdsVRNUVQWWTbIQC9Cte70RLSZXTgdzQxFG3S4wPOAtQJRtT7iuos/j4WPVCtHYitJAkbUim1bZGn5aUwqHoZYVGxwPoxeKTr7vCY2CGtHUfVlqVTkE+RKCMjQEq09U8I84JCVTZmzK5lXWnYhFPOPT3kB5vCyFJTmPBHjAoz/+QfE4p8T7svsO53jqvWq0/tjVF9mSLNnVYIvPYeiUejUbvAPIgLHunWzjKR/w6q6+fjXqFISCgNhP0pwVdfTCXSdIB9AMv+NL2i8ZeL4wDgRFAR3/EIoEs+Xht5Q9EGA4NCBSu9O+cznDpdJhnvSrnN3GL7+AXM8qbq3FZMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(8936002)(6916009)(186003)(4326008)(53546011)(26005)(508600001)(8676002)(31696002)(66556008)(83380400001)(38100700002)(5660300002)(316002)(54906003)(16576012)(6486002)(31686004)(86362001)(2616005)(6666004)(44832011)(36756003)(2906002)(956004)(66476007)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckNyWVArUzBFTXVaU2ZPWXJGNTRJTjB6WVcrMUNIeDRKdXpSVHQzY2hnaGNz?=
 =?utf-8?B?QUR2bEhLVTBKaWVpZlpHZzZXdXJuaElnY3B2YmhsOVd3WjRubHFhWC92RGo2?=
 =?utf-8?B?UUJsUjZLeklhL2JXU0lsRVFhdTI0WFdoNk9TdWdnZ1hRRzlMQXYxa1FlZkNR?=
 =?utf-8?B?aUhVVUs2U3M5Yml1YlFnYzhQb0loK1ZWeW5PREhFU0JrMGxtcTVTVGpkV2lD?=
 =?utf-8?B?cStuYzRhYmpHcmE0b05CNEFUcUVFM2ZTRS9vWXZVa3NBYmE0ZFB6VE1IY21v?=
 =?utf-8?B?akVEK00vQ01Ud0FmN3JYQ21OUlVJZEN1NEFjVmE0b09waDNLbTFjb1FsNDF4?=
 =?utf-8?B?MDZSVm5pSmhmQ3EveFFpS29FUER6RXlWWFFLMW9JbWY1bllycjlzdDF1OW1s?=
 =?utf-8?B?MmQrT0RCLzY1ZFYyR2hvSkFGWFo5NE9PNlJEWEFXTnhjNk5WelQzR05FeVNN?=
 =?utf-8?B?bnQ3OU42U1RCUEJHZ2FSS2l4TkJNZHBqYmhMbXVkVXAvSW9SN1RldlNsWFZJ?=
 =?utf-8?B?elg3WnBFQlM1UkFLcHB3bGRqYndBamJWd1MrVmtiRExxRXVCd2RtS2Vha013?=
 =?utf-8?B?VTZZTmpKOVQ2cU05NmJTdElQMldPMHY2Q21LRHNmMWx1dGVnQ0lnOFFaaURq?=
 =?utf-8?B?Wlpkem52dHdZSnZJMkZ4RHhKR0JzaHluUy9lMzRoSUFzWUZwTVk5STBIdndY?=
 =?utf-8?B?cXBJYTlXS3dDTXNYRjA4RFVNUS8xdExndFpkdzZmWlVOWVdsMUw1YXFPcVl6?=
 =?utf-8?B?bXJqSDdxR2pCTkMxSXk3TlhwOUxqdCt2ZFlzcGpMMDMraVNLYzE4aUlZaWZJ?=
 =?utf-8?B?SEs3REEwazEzaC85cW1zV1BxSW12allIcmc5OHg4MG0wL0F2YnVXVXp2TlFY?=
 =?utf-8?B?M3J2SVVNa0Z3MndYNzlLUWNBcWhsRFRlZVc5eDVOa0ZwNzNjR29pNkRRWHRL?=
 =?utf-8?B?RUZwdXZocElkeVhvYytVM3FGYkN6cTFHckVoL2Y0aStBYnRZeXdKTUo1K1VF?=
 =?utf-8?B?MkEwVmpZMnZMWjAzdGpnakxEU055RGo5ZCt6UjNwRTlIaE1Ic1lzSmExRGZq?=
 =?utf-8?B?b0lnV0NoS0FOZ0FwRFRhL1Fjd1NocEtxblFDMGxDQ0pxMDVTUEVvem02MFox?=
 =?utf-8?B?SkRBQWhWd09iMTkwUHZzaWtGM0VFSzlwdENqb2lXeVdjU2xUNHFiRzc3N3la?=
 =?utf-8?B?VmFUanR3RUhyL05hNU81QThpVnhrYXY4bHdBcXRaeFlPTDdyYkNPS1c1Y1ll?=
 =?utf-8?B?RjZXQjlUUDVqaHVLeXhNVFFLRzk0QnRocDRUMytDWDVmNTNuM3lZRE0wbE5p?=
 =?utf-8?B?OTczNHZTNUdveVEwMW01Q2tRQUU1bWpLMXVLaXlZLzNDK2xwK2FoUXJmQkYx?=
 =?utf-8?B?S2pOeGo3b1RNaGJOWFNlY0VCU2txWk9LNU9BRnlsMlA3a3ZGUUJaT05qWEJP?=
 =?utf-8?B?L0tRWTl4RXJveU1aczFkdDVPWDcrbnZyejZCVlVOQlFVQXd2blluVENvdTZa?=
 =?utf-8?B?c2haQlZ3MXoyWElYWmNuVXFHWGJycUEwb0Q1T2U5WmcyVWgyLytEQkowTHo3?=
 =?utf-8?B?R0hNakJQVW5OdXZxZzlTVnNMSFJyemxvVUlUNkdZdURka0R1bHZ4bE13dnFB?=
 =?utf-8?B?YmFwV0hTRG5hRnZwZEM4dlZSTlZ5bzNOUkdmOHFHby9HMmZRUnd1bEF6b00r?=
 =?utf-8?B?ekFGSVg2a3dsK3UxQlc4YU80N1pQYjdlUlFrUy9Xc0RGbk5vQVpSVjROVDZm?=
 =?utf-8?B?THVrcTM5QzFEaWZ1RkI3OWdFQlJGajFGRmRtSVU2NnZNMHV6R2t3YkN5N1hn?=
 =?utf-8?B?VFlDK3lQOG0xdy82c0tob2g0WXVlTW9sSVNybjFaNzJxVjc4d3dNQ1lHZU9v?=
 =?utf-8?B?anVBVS9uUXh0VG1HOXBsOG8zcTcwVFpvSzdqU3VEM0VndzRIWWpwYURhWUx4?=
 =?utf-8?B?VERBb1o5M0dVQktFY0tobmV0OVZlL2djaEpGWFJ5bVpUSTYzRVlycElaY29S?=
 =?utf-8?B?T0VSM2l2UERzZFA0RkV0ZzZVTDJpb1BlNDdFQjBERVVienMvZFUrS000aStz?=
 =?utf-8?B?K0lpZGNqS0t1SllUSmk4VUxzOVI1ZmM2V2g4TzdLSEpURUJlK2xHQjJ6QlVq?=
 =?utf-8?B?NjN1SG9wYkZFMERHalQ1b2srcXZRZW9EY2xONDlnSTBiam1EeHlEcHRvQ3NZ?=
 =?utf-8?B?MDF0WmRYMU1qb3lPZ2NBN1dBR00xVVhzTE03YTBvVU5vTWZ0TVZVd2NZZ2VT?=
 =?utf-8?B?Yk03ODdzNW1talBidk1uWXJuc2VnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1364bb72-7958-4a75-d102-08d9995d8bc9
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 15:22:10.8949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMl4hE2y0YcjfmO6KwYz73LEwROZNrOfFo/I1XXv9LkXCmjY/FuGHGGPJpFUVc4xOCr1pm07jLSKXWsOT1zo7/ZP0IsfxOXzI1AfO3lyiKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1458
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270092
X-Proofpoint-ORIG-GUID: d08FPyloDlNUbWxxxcfQvh3KEfy1-rlD
X-Proofpoint-GUID: d08FPyloDlNUbWxxxcfQvh3KEfy1-rlD
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

Geert,

Does this look ok?

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 93802ab..3d47c34 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -469,7 +469,7 @@ static int cirrusfb_check_mclk(struct fb_info *info, 
long freq)
         return 0;
  }

-static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
+static int cirrusfb_check_pixclock(struct fb_var_screeninfo *var,
                                    struct fb_info *info)
  {
         long freq;
@@ -478,9 +478,7 @@ static int cirrusfb_check_pixclock(const struct 
fb_var_screeninfo *var,
         unsigned maxclockidx = var->bits_per_pixel >> 3;

         /* convert from ps to kHz */
-       freq = PICOS2KHZ(var->pixclock);
-
-       dev_dbg(info->device, "desired pixclock: %ld kHz\n", freq);
+       freq = PICOS2KHZ(var->pixclock ? : 1);

         maxclock = cirrusfb_board_info[cinfo->btype].maxclock[maxclockidx];
         cinfo->multiplexing = 0;
@@ -488,11 +486,13 @@ static int cirrusfb_check_pixclock(const struct 
fb_var_screeninfo *var,
         /* If the frequency is greater than we can support, we might be 
able
          * to use multiplexing for the video mode */
         if (freq > maxclock) {
-               dev_err(info->device,
-                       "Frequency greater than maxclock (%ld kHz)\n",
-                       maxclock);
-               return -EINVAL;
+               var->pixclock = KHZ2PICOS(maxclock);
+
+               while ((freq = PICOS2KHZ(var->pixclock)) > maxclock)
+                       var->pixclock++;
         }
+       dev_dbg(info->device, "desired pixclock: %ld kHz\n", freq);
+
         /*
          * Additional constraint: 8bpp uses DAC clock doubling to allow 
maximum
          * pixel clock

Is the pixclock round-up still needed? Without it the frequency may be 
slightly above maxclock in some cases.

Thank you,
George

>
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

