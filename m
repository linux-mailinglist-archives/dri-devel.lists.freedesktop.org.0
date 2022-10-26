Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021260DC14
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 09:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED09A10E480;
	Wed, 26 Oct 2022 07:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D04E10E480;
 Wed, 26 Oct 2022 07:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyamF21IDmbOQVD27LpG0fckVjCC4PlqVllwWCUMdvyX0srdIEXOpFoVerCN9pVMa1EJNnLDyQ7ldymAYvuN2XR/wuL1/EFVUtydWQaoK7WpMq6q6Vu3lOVKlOevZIN82I0BINMeuv3zYFm9VVOhSeGJY4geIF7NofQTuwSUGIJqNSGvSxKpUZ5pT9DR9Dsny5GKdMLmduwfZOHJ/lpB2qyKwBQiBhC92aC3yP57tNQ0uGE2wqdfz+u2Inn/PujcNNpoVn/FVmCn83a5djkUEyS2yBpRlgK6hO/oyxnOXauJ1+9NU1IIXZU96ogPmly2s3YIxKJ/JWUKLo5kxGYLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z/oBrxRD6MTIhGRxvznmTWAxOxraJu3ENl6lffmUUs=;
 b=QtHjrPTWBIDPt/lIHiz70xsJDy5ID8W2mLa3jZw9nZRzZaDAmK0rOUpn7o2kSVxYBT6Rl1gjg2e913IcwU1ykw1746XOuWDjmb6qyZ/2FqL7iPYynV51va7YffcMP00L0k3fkockiPhEoxLUfk7LVAylSNR4ktMas73charza1SVz3FKcqY6dpWytI5D2w7iZj+pJ37x4SmDE9IJPcIK3W7vQ3HsgDN740nn/sSrHEwS3N3Kaor0fvUbGs+D6+K536sO3Z84bEvPsScziYwhnBKTblnS0aZEBsWHdzcd5y0wzcbxumnPhFjhUA7tMDilT/SzqVrf+1l/C1KP84lxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/oBrxRD6MTIhGRxvznmTWAxOxraJu3ENl6lffmUUs=;
 b=YYktoLGw/kVhn1IM0ecWcdyn/S16o+f9GNg2V6yz+GgEyBQkOJEy00PydDS189kQX0t2sSEAQsi0TV+5ryNmxg1wmL8qvRNN4iz7jMfwpSwCUX5r5+vwSC1DG7iQYzhYoK78mVTawmeytIyotH7Dy2t4+vz4tW2iPEvzlU8SJUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 26 Oct
 2022 07:29:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 07:29:48 +0000
Content-Type: multipart/mixed; boundary="------------wrLDtDWuQEPzB8StOnOHS7Bp"
Message-ID: <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
Date: Wed, 26 Oct 2022 09:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6 some games (Cyberpunk 2077, Forza
 Horizon 4/5) hang at start
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 97784d10-4273-437a-0da6-08dab723dcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFCCnaZEPmcdvG5l3ZNANxAdh8ZmcfDvtUASJodP65+yHSONyaJkvoP8RWqTSNWqUhESEmPYmj8LnlKoPQVlmofv/N56bhGCQ3+zSLKHjb2A7Efjcv61P/Gl9OUSbAZOXJtW+sa/6gMaPZMTVdqh761Lk0VyLyFVqT+B3cqQ8bGun6TRhBOPyCIUqMRNCoagdwT/NpBX9qK7IZ+ie5NtT83Bs7z0dcB2Qy9PjQUDhru+LmQa7+aHO+Hw0Mqcg499ksylJMy060xy/1TYg948gqaZuPBv9h+Y2Ou7v7II0sEZ6rFRT+hwqDOwrOXy//843xmWHr8r7Ybm73N6qZQeHl39/N3w6PnAPyVV60GUmk5sp7mC5Hy8nCWVBhYUu9jEf99D9Ia7Z+4g85hhZCee5zv65C5/0AZqggfChG/gAETFdiJQJTN/S3CeOk0pr4QtUxDh4ZQGGbtZ1QGW55Um+RUJg24icRrwKGA5pK2luWCEg3YjBjtpSVCLQNiSXjS6S07pbkWnbnH/Ce4JwQrp+eJi78aD/UHZjp6XBf8yHswR519X5sIRE0zDQ1z2G7sYaP7CCKy2oJO8z384exLRolcpmDo0dqDS0XpoWgUzlWcyfx2sfzSWIr5Px70TV7skmawS+pXSUDvmfmW8t3E/+YwjwxlgZRreTJpqg3mDxdPoi1ocaPAE5iBIK/3QT3iIFzaTMUzTEYJmEfiPPF5B34Lfa6XCoQQwSisGDbR8cEosQgSIYK4Xl+YaNCCybJBaFs+rpyyPSsDqgsFHH88Pw9fXNkgzilwyNyilpAyi/ZpYgT/7fvSn1pJ2Sy+aDFPy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199015)(6666004)(186003)(41300700001)(478600001)(54906003)(36756003)(8676002)(4326008)(6512007)(8936002)(6486002)(6506007)(53546011)(6916009)(31696002)(86362001)(2616005)(33964004)(316002)(83380400001)(66946007)(66476007)(38100700002)(66574015)(2906002)(31686004)(66556008)(5660300002)(235185007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZrT0hVWFdrTmFEa2ZYVlhLVkt3Lzk4cEc2ZmlxV0tpTVhpRjR0THRhMmpW?=
 =?utf-8?B?SzF5N1MrR0JEcDdXK1Q3QXAzQU1pdG5pUVQyOEFINjU2aWQxT0t2NmdFaUFq?=
 =?utf-8?B?UEYzK2JZeHRwemc1N1V2a3YySDR3WWt2c1hRUm5tQlhCejZUT2JpeUh0MmZy?=
 =?utf-8?B?SzlWL2FidCtSMVRnR2xQRndwS2ZEM3pOemZoL0Q4VDYvTUtRRkVLcUQyd3Bs?=
 =?utf-8?B?Z2RleVEvci9TWERranRxMFc2QjRwVVA1MnptZlMzSm5MZkNpTzBtY1UyMHJ1?=
 =?utf-8?B?UGF3V1U0NlNEY0F3YlI5aGpIRXcrQ1l1bExQRFBHNEh5a3pBcHVTbHVkNGZh?=
 =?utf-8?B?WmNZYWkvYkpmT043Zk9sSFZHQWU2cUhKaGUrTy8xNm5DZ1pZdlVmTnVnMHVo?=
 =?utf-8?B?Yjh2eFg4UzdiRCsxSkNiaDY3SWNvVElocE1JL0s1aTFxRGNCdmdORmgzQ0Mz?=
 =?utf-8?B?ODU5K3ZlNG5qUVJYK0NnRThpSUE5L0svZVJsd3dNRkkxUXBPYnBEVllCQWhu?=
 =?utf-8?B?cWZUc2ljTTJlVDVRREZ0dkRHSGNCUTMwbGRqbFVvaVFhN1RzR0tWLy85REhT?=
 =?utf-8?B?NlN6aXFlcytOL2RXckdJYWN4S0RoYTZOZlRqQzJjSjZmT3BnSVZlZGQ0NSsx?=
 =?utf-8?B?cHoxQlU3ek1KekZ2d1RlVUN2ZXgyNkpPVGZPWFA4bmhYMUJiSmlrdzNLTWtR?=
 =?utf-8?B?MG9ENU4zZTBWWEpQS1ZTVXE2VnUvaDZaM0JsaEhxU2VpR0pCdTJVQ1Fjaldq?=
 =?utf-8?B?clNidm1wZjk0T3IrSEYzblBpTVhrdys1cDF4QktOa1Q0bktlREhBVnNicVov?=
 =?utf-8?B?ZitPZTIrT1lwZS9vWS9uVWhBUmYxenUrTmpVTFJrWE5XUGNiTmlPWU9Yc0hU?=
 =?utf-8?B?VTdVUWhPSTJiM21vWXJJNWFOYTVBTGZIMzJYLzRTMWtkSkwwNVVORkxOUXN6?=
 =?utf-8?B?UlF0TnIwVHBYakN0VFdPbnVSbUpLdmhTVEhueThueHNtTzJjY0t6R2g3N1hk?=
 =?utf-8?B?Y3JwdE82WXRZcnhvbTA2aUhPd3RHcmhrdkVUMzk5ckJOSzFlS0NZaUF5UG42?=
 =?utf-8?B?ZDA4ZURXajlrS0pvZWsvdW85WWVnWjdwVHJCSVpYK2lkRkhMRzZTTzdHWU1k?=
 =?utf-8?B?YkNYY0VuZzF4dkZneDVOYlREcTU4NzNWeXA3Y3MvcHJVaW9WYkN5L0tRS1Q1?=
 =?utf-8?B?ZlB3MjRuazVDdTVOcE53NlJvVHJheE85Zk5KUWFjckZzMHVzZWR2Z0I2dEJE?=
 =?utf-8?B?bVVFVEFTRnFxOFBrblRoczF6MFZKV2JJMmx1K0hSMzNtTU1NWno1cnA4b250?=
 =?utf-8?B?SU9YS0VPcjJuMWtWTHVkUXpTQWNwWVRDdE44bmJzQVRBNGRCSmRtY1JLVGZN?=
 =?utf-8?B?L3NsdGZobE5SSituREdPVzMwTHR3TnUxUmhaenRQL2lwbkxvd3pTazdrRmtk?=
 =?utf-8?B?UEFKRS9xbDZySjF1ZTlKc2JRYUhEeml2NDFTRE55YW5VbjRLVHphWTJWdThn?=
 =?utf-8?B?OHZRZUlLTStrK3ZJMEtocHJTMDdHbXF2RS9tZkxOdzJwYml3Lzk4QW1SMTNM?=
 =?utf-8?B?Z1FMN3F5YVplZ3lMREFBNTY0aW5HdU5RUHBGN1pOTUt5RGVmSk9JTHdiVFp5?=
 =?utf-8?B?U0lFL2FiQUZ4bk1YcnNXZ01vRTZSYTBiMW10b1N4c3NHNWRESjZ5S08wKzhT?=
 =?utf-8?B?dWpnZEZacjFOWGVkQWkzQTBYYlltdGdWZkgyeUxpd2VZa0kycDZkV3E3eTEr?=
 =?utf-8?B?MCt3YVlYRTJkcDM0VDJoRHhHcEhQMW5tQ3FIcUZ5dk9WT0NrY1pzWTNGdGhI?=
 =?utf-8?B?cmp0RkcyWmRPRkFKMUFidkpOR2YzdUJtQ0JnRGJSWGF4KzV2YW5MSTYrYmN3?=
 =?utf-8?B?RHFvVFVMSHdQamZqRk5pZFFFZnRpeUwzQnpHUFBlZ1J2ajcyQUY0aGhKZzls?=
 =?utf-8?B?Ry91aUh6dXpLeitISjhpdEswMEduL2RyV0Y1Zmw2K21TYWw4MmRrOUorZUk4?=
 =?utf-8?B?K3FSZ3VjMEswWFRvU2x6bHZHL2VoSFRMVm5yQyswYkNLT1ZLWEUwWXhzTzdO?=
 =?utf-8?B?ZkNmZWdpc0YvcG55Wm5nWTdJS1FNSXlFcVMwblY0ajJmL1o4UmF1T29nb2wz?=
 =?utf-8?B?S0VCNlcyRTJ2cFdmTjNtTVpwbktxc2RDQURLbXJVd1VnR0xIQkc0cktvV0Mw?=
 =?utf-8?Q?ihd9RHUe0TQSTHWjoXf86pstwGYOTt7YxvdbvgaItKm7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97784d10-4273-437a-0da6-08dab723dcbf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 07:29:48.6592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/7dLNUdGfYpX81wAlbLobvsyilG+/YnwGgbSMqJezy9JMvsXxQ0JXjaNiGGY6pd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------wrLDtDWuQEPzB8StOnOHS7Bp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Attached is the original test patch rebased on current amd-staging-drm-next.

Can you test if this is enough to make sure that the games start without 
crashing by fetching the userptrs?

Thanks in advance,
Christian.

Am 21.10.22 um 14:36 schrieb Mikhail Gavrilov:
> On Fri, Oct 21, 2022 at 1:33 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Hi,
>>
>> yes Bas already reported this issue, but I couldn't reproduce it. Need
>> to come up with a patch to narrow this down further.
>>
>> Can I send you something to test?
> I would appreciate to test any patches and ideas.
>

--------------wrLDtDWuQEPzB8StOnOHS7Bp
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-amdgpu-partial-revert-remove-ctx-lock-v2.patch"
Content-Disposition: attachment;
 filename="0001-drm-amdgpu-partial-revert-remove-ctx-lock-v2.patch"
Content-Transfer-Encoding: base64

RnJvbSA4NTJjNzg2NTZmMDgzMzk0Mjk2YjNkM2I5NmRiMzM2MDhjZTBmMjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Q2hyaXN0aWFuPTIwSz1DMz1CNm5pZz89IDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkRhdGU6IFdlZCwgMjYgT2N0IDIwMjIgMDk6MjY6MDEg
KzAyMDAKU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBwYXJ0aWFsIHJldmVydCAicmVtb3Zl
IGN0eC0+bG9jayIgdjIiIgpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxh
aW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVGhpcyBy
ZXZlcnRzIGNvbW1pdCA2YzA1MmFmNzc4YTYxOTc3YzI3MTYzMjA0NGM3NTRkYmJjYTRmODkyLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICB8IDI2ICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
dHguYyB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmggfCAg
MSArCiAzIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwppbmRleCAxYmJkMzliM2IwZmMuLjBi
MzMxZThiZmJhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKQEAgLTU3
LDYgKzU3LDggQEAgc3RhdGljIGludCBhbWRncHVfY3NfcGFyc2VyX2luaXQoc3RydWN0IGFtZGdw
dV9jc19wYXJzZXIgKnAsCiAJaWYgKCFwLT5jdHgpCiAJCXJldHVybiAtRUlOVkFMOwogCisJbXV0
ZXhfbG9jaygmcC0+Y3R4LT5sb2NrKTsKKwogCWlmIChhdG9taWNfcmVhZCgmcC0+Y3R4LT5ndWls
dHkpKSB7CiAJCWFtZGdwdV9jdHhfcHV0KHAtPmN0eCk7CiAJCXJldHVybiAtRUNBTkNFTEVEOwpA
QCAtNTc4LDYgKzU4MCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3Bhc3MyKHN0cnVjdCBhbWRn
cHVfY3NfcGFyc2VyICpwKQogCXVuc2lnbmVkIGludCBjZV9wcmVlbXB0ID0gMCwgZGVfcHJlZW1w
dCA9IDA7CiAJaW50IGksIHI7CiAKKwkvKiBUT0RPOiBJbnZlc3RpZ2F0ZSB3aHkgd2Ugc3RpbGwg
bmVlZCB0aGUgY29udGV4dCBsb2NrICovCisJbXV0ZXhfdW5sb2NrKCZwLT5jdHgtPmxvY2spOwor
CiAJZm9yIChpID0gMDsgaSA8IHAtPm5jaHVua3M7ICsraSkgewogCQlzdHJ1Y3QgYW1kZ3B1X2Nz
X2NodW5rICpjaHVuazsKIApAQCAtNTg3LDM4ICs1OTIsNDEgQEAgc3RhdGljIGludCBhbWRncHVf
Y3NfcGFzczIoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnApCiAJCWNhc2UgQU1ER1BVX0NIVU5L
X0lEX0lCOgogCQkJciA9IGFtZGdwdV9jc19wMl9pYihwLCBjaHVuaywgJmNlX3ByZWVtcHQsICZk
ZV9wcmVlbXB0KTsKIAkJCWlmIChyKQotCQkJCXJldHVybiByOworCQkJCWdvdG8gb3V0OwogCQkJ
YnJlYWs7CiAJCWNhc2UgQU1ER1BVX0NIVU5LX0lEX0RFUEVOREVOQ0lFUzoKIAkJY2FzZSBBTURH
UFVfQ0hVTktfSURfU0NIRURVTEVEX0RFUEVOREVOQ0lFUzoKIAkJCXIgPSBhbWRncHVfY3NfcDJf
ZGVwZW5kZW5jaWVzKHAsIGNodW5rKTsKIAkJCWlmIChyKQotCQkJCXJldHVybiByOworCQkJCWdv
dG8gb3V0OwogCQkJYnJlYWs7CiAJCWNhc2UgQU1ER1BVX0NIVU5LX0lEX1NZTkNPQkpfSU46CiAJ
CQlyID0gYW1kZ3B1X2NzX3AyX3N5bmNvYmpfaW4ocCwgY2h1bmspOwogCQkJaWYgKHIpCi0JCQkJ
cmV0dXJuIHI7CisJCQkJZ290byBvdXQ7CiAJCQlicmVhazsKIAkJY2FzZSBBTURHUFVfQ0hVTktf
SURfU1lOQ09CSl9PVVQ6CiAJCQlyID0gYW1kZ3B1X2NzX3AyX3N5bmNvYmpfb3V0KHAsIGNodW5r
KTsKIAkJCWlmIChyKQotCQkJCXJldHVybiByOworCQkJCWdvdG8gb3V0OwogCQkJYnJlYWs7CiAJ
CWNhc2UgQU1ER1BVX0NIVU5LX0lEX1NZTkNPQkpfVElNRUxJTkVfV0FJVDoKIAkJCXIgPSBhbWRn
cHVfY3NfcDJfc3luY29ial90aW1lbGluZV93YWl0KHAsIGNodW5rKTsKIAkJCWlmIChyKQotCQkJ
CXJldHVybiByOworCQkJCWdvdG8gb3V0OwogCQkJYnJlYWs7CiAJCWNhc2UgQU1ER1BVX0NIVU5L
X0lEX1NZTkNPQkpfVElNRUxJTkVfU0lHTkFMOgogCQkJciA9IGFtZGdwdV9jc19wMl9zeW5jb2Jq
X3RpbWVsaW5lX3NpZ25hbChwLCBjaHVuayk7CiAJCQlpZiAocikKLQkJCQlyZXR1cm4gcjsKKwkJ
CQlnb3RvIG91dDsKIAkJCWJyZWFrOwogCQl9CiAJfQogCi0JcmV0dXJuIDA7CisJciA9IDA7Citv
dXQ6CisJbXV0ZXhfbG9jaygmcC0+Y3R4LT5sb2NrKTsKKwlyZXR1cm4gcjsKIH0KIAogLyogQ29u
dmVydCBtaWNyb3NlY29uZHMgdG8gYnl0ZXMuICovCkBAIC0xMzM1LDggKzEzNDMsMTAgQEAgc3Rh
dGljIHZvaWQgYW1kZ3B1X2NzX3BhcnNlcl9maW5pKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpw
YXJzZXIpCiAKIAlkbWFfZmVuY2VfcHV0KHBhcnNlci0+ZmVuY2UpOwogCi0JaWYgKHBhcnNlci0+
Y3R4KQorCWlmIChwYXJzZXItPmN0eCkgeworCQltdXRleF91bmxvY2soJnBhcnNlci0+Y3R4LT5s
b2NrKTsKIAkJYW1kZ3B1X2N0eF9wdXQocGFyc2VyLT5jdHgpOworCX0KIAlpZiAocGFyc2VyLT5i
b19saXN0KQogCQlhbWRncHVfYm9fbGlzdF9wdXQocGFyc2VyLT5ib19saXN0KTsKIApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCmluZGV4IDMzMWFhMTkxOTEwYy4uM2EyM2Zh
NDViZmVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCkBAIC0zMTUs
NiArMzE1LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9jdHhf
bWdyICptZ3IsIGludDMyX3QgcHJpb3JpdHksCiAJa3JlZl9pbml0KCZjdHgtPnJlZmNvdW50KTsK
IAljdHgtPm1nciA9IG1ncjsKIAlzcGluX2xvY2tfaW5pdCgmY3R4LT5yaW5nX2xvY2spOworCW11
dGV4X2luaXQoJmN0eC0+bG9jayk7CiAKIAljdHgtPnJlc2V0X2NvdW50ZXIgPSBhdG9taWNfcmVh
ZCgmbWdyLT5hZGV2LT5ncHVfcmVzZXRfY291bnRlcik7CiAJY3R4LT5yZXNldF9jb3VudGVyX3F1
ZXJ5ID0gY3R4LT5yZXNldF9jb3VudGVyOwpAQCAtNDA5LDYgKzQxMCw3IEBAIHN0YXRpYyB2b2lk
IGFtZGdwdV9jdHhfZmluaShzdHJ1Y3Qga3JlZiAqcmVmKQogCQlkcm1fZGV2X2V4aXQoaWR4KTsK
IAl9CiAKKwltdXRleF9kZXN0cm95KCZjdHgtPmxvY2spOwogCWtmcmVlKGN0eCk7CiB9CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguaAppbmRleCAwZmEwZTU2ZGFmNjcuLmNj
N2M4YWZmZjQxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2N0eC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguaApAQCAt
NTMsNiArNTMsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2N0eCB7CiAJYm9vbAkJCQlwcmVhbWJsZV9wcmVz
ZW50ZWQ7CiAJaW50MzJfdAkJCQlpbml0X3ByaW9yaXR5OwogCWludDMyX3QJCQkJb3ZlcnJpZGVf
cHJpb3JpdHk7CisJc3RydWN0IG11dGV4CQkJbG9jazsKIAlhdG9taWNfdAkJCWd1aWx0eTsKIAl1
bnNpZ25lZCBsb25nCQkJcmFzX2NvdW50ZXJfY2U7CiAJdW5zaWduZWQgbG9uZwkJCXJhc19jb3Vu
dGVyX3VlOwotLSAKMi4yNS4xCgo=

--------------wrLDtDWuQEPzB8StOnOHS7Bp--
