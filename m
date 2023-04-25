Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A126EE19D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 14:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD9C10E0AA;
	Tue, 25 Apr 2023 12:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C917210E0AA;
 Tue, 25 Apr 2023 12:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1+pV6aaiWVQlANhbZob0vMkcBzaJFa+tu1XPL5v+nDwtyKx6J2FHhuACrTjqxw7IB6iBpfItgDDeGp7X4Tjy2uH4gEnFGwF50tcLlb0QUQsTO3Eq4C3sfRbAX/jOv7a9cKezTHeLrNYfUEeB4Vwntnkzr5RtWHN+agsscx4tlgdRYTPTCdVUZZSOgMbqtQVmE9xShP/mVALJJDCh7dmy6Vjk/WoauDiAYceCSBV3poN0USJmoY3AyDsdTF0FXbVeOrRSitvSG6usJDEe7/E8o6DwbiRNlg7XGMjxFdN/M6AQcuKx3FwXqhggeBvdydjpy3CSVikhTnIv+kUW/Rmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFiHgNk5cdVBlnENELUwb8m8wq4wzavmBSip69j4HEE=;
 b=OKLMLxPiNFqx/wBcSyL2K2ck+FmZV6STu5pGsb9I3DhjonvXYr937GX8coBvGUiVxbrddr4gvvFrP9TQWGoBE8NTI3T7gpoLG6Pw+G2TEJ5dt7ryvOIKGSRQCZgLzUhkeoltvFG3HX6fA9EsVnmDr+V9GbXD+RUc7k3BXvZFw7reaO2ru2za9eo9sfOU2z06Edhopl+yVLqTDC5bHScELJYgTukRGHkxW/QVaRS+23b4X+eUNBRQ37KHBcfwc/6EX7R7YAmdHxZK/lq8+1Lh8YP+1CDWBrOaTexBHjXXerVS8RFkICiLbvQlWK2SgmUWDe/PnQQBrNjasODz9oOx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFiHgNk5cdVBlnENELUwb8m8wq4wzavmBSip69j4HEE=;
 b=TfZh+BEeEySJiXt9ppIs/7z+LYSJyeDNZAuOUv7Nlvm7RGc4hmVsxYKng3kJDcmSmPJhgOzTnR32u4mlBqPsGdKo8Z1aJzdcV4ZeYEzHnaO4QL9ZeHWcpHC+Gso1n4BJHsNe31aNdNKP64QWY8ks8uGyg0vmdz5Vz99/ey4GhqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 12:08:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:08:22 +0000
Content-Type: multipart/alternative;
 boundary="------------4vF7ICTgBsvDR9cJbedLp4R0"
Message-ID: <19406ec5-79d6-e9e6-fbdd-eb2f4a872fc4@amd.com>
Date: Tue, 25 Apr 2023 14:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Content-Language: en-US
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
 <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
 <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 13abe155-0c9e-462d-5959-08db4585c3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kbIdbURekwNNaJ5EkJ4m6icv6sUCT9X2JFU1S8N4t1jCs/jLfaS3FGd6BLhz1OFd22ikuqswYXV25V22ytvwFbG5twiG10C68h7ci/8/hb3FiZDiL6T2QQcp+TfsuUPncECcbt9VPAoYumgLVOGlZkdTBToWhULuOrZHcmRLbC+TLUaikVNmRo8iUdlOS4KlMHC8UF4DXltEv59lqgufS77mdg39fzbDpGfl0fdGvRvt9aIES7hGZpfTnikkta1kXHePVG1HNdoFujoIaVD0ZvSGkp4yEjt0gzwKo3wNLKlcJCdjHulHQL5nhV7eOIeqrCCCrLAZQxmxiX3LkSp1SRyFJ65r/dGrGqhiLCz+veVRpv5vO4u4vnaLU+eRJjSujtZT8ZqSLZPmatDlxUijrrshpw5jsUW1Ryz3E7pOsQm7ZFHTeuiBVjIMca21CGTBePeKtN1nFMWj6O/dNMCyu4T1akhN2NpSNtGawbopcM+GahGURrdnE7jpLLc43akKF+dv/XuJsLV4Ivuynuaw4jyR5YvFkof8ikRD2H/xPSuhcEqtLKf8W+ZRxwyDHVatZLdNYkIIiHHK8A1SLFeIsQsybTSdk3EtwSzoGbnpSoq1pzPEcrefOtcV4MseQdnIipZiNKoYDvteWk5VkmY/rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(36756003)(110136005)(54906003)(31696002)(86362001)(478600001)(38100700002)(41300700001)(8936002)(8676002)(2906002)(166002)(4326008)(66476007)(66556008)(316002)(66946007)(5660300002)(186003)(6512007)(6506007)(53546011)(966005)(31686004)(83380400001)(2616005)(6486002)(33964004)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1tYmhqSmo4NzZOYlFldG50OVQ1Z2ZzeGY0SWMvbXdMRnp1aVRGaC9EVHZl?=
 =?utf-8?B?MHk0K0gxazBneE5FWFNmTm54T3RiSTNQWHkzS2RaVWkxWk52SGJHeUwvd0xX?=
 =?utf-8?B?dWY3eHZleG1FdzFiWDI0YmR6NmxCQzdhWlZUaFVBUTVEeG1Cbzd3UVM5cVVt?=
 =?utf-8?B?a1hLKzMrYjVvRnFHMnRIQ2YrVFVRcHdyclJzUjVaSE51WFBJRDNKc0xINHVV?=
 =?utf-8?B?TFZhcHJLYm16RnI5eTB1NnVmLzVrV1ZVV2hYWnBxNWlrd1hiVUV5MU93RFBI?=
 =?utf-8?B?TTlwMlcrd1lzWFVFUTZ0K1FSZytlWHl0MVJqT2ZNY1V1MjRGanhDVUNZdHN0?=
 =?utf-8?B?ZFQ2THp0MFpPbjBxWG1oR1l6aWdPZytNRVNnd0tuUlg5MlRmT09VZGlsc21p?=
 =?utf-8?B?MGx0c2s3WTVjL3owMmc4UEFJZU8xTVhLZVJOV0pEcWRZYXllSFlFaDJWYUtj?=
 =?utf-8?B?NHp6M0NkQ0ZHUm9pc29JTW1qZksyd1BHekN3SEsrOHVYckpmRnFwUGd0NDMw?=
 =?utf-8?B?WU4xWkR6MzJaaU4xdEFEekszeWZPZTYvdTZoZHdGWExGVFpTK2ZxUkZTWXBp?=
 =?utf-8?B?aXNtVHdZd0dKaHV0VHZ2VXdpWTk1TFFjY2w4cFhuY3h3QlFScjBpVmpxVlFK?=
 =?utf-8?B?Y25QdnVzbGNONDc1NnJ6SSsvY3cxTHVxM2tpMEljOWZoamZLQk5rRVpnc2V2?=
 =?utf-8?B?TnJYSEUyMzB6cER2L3c5b1hSOVZ6YjgrU3ErNElqMG5kVGw2M3QrQlN4QktN?=
 =?utf-8?B?ejlYY29WejNtaTJrd0sxN1NTdFE5eTVzWHRPblBtU01HaFVocDJtZ3ZFM0hx?=
 =?utf-8?B?dmxoSXdpV1plOVYyN2dCdlNkN1NNcVdSN3lpZk9obG42bEtrYkxWdjRscGc0?=
 =?utf-8?B?YWw0cmZsc0I1MmhlODNwUXZ5TUJ5OE1WWnlIazF1b2UyenFoRW0yNW4wbWEr?=
 =?utf-8?B?eXVjaWMxSWsvdDI3b09ERGFkTHNETGF3RzNoamxha3JQN0hxYWNnZmZmYkpj?=
 =?utf-8?B?NWFDampHVHQrcjcvckF6SGp1SDlJZWZwK1JsYm5QUjY0TUUzRW1DWW5ITkgr?=
 =?utf-8?B?RTF0RnAvMXl1cnd3VVNZL0VnUWd4K1VkaVpHR3BCaWJFQ0s1KzRMV3hpM2dZ?=
 =?utf-8?B?NGQ5bkM5MmdOZXQxVm54di8rUlhJK2FBL2ZkQ3VXQXVJSnNkMCttSmJDdFo2?=
 =?utf-8?B?SFNvTHFKVnZsaHc2bWQyQTduZU1uaTJGdnVWSFBmcjRKR3BBVzVTOFVDMTdl?=
 =?utf-8?B?V1cwZTFRMlA4ditCZ3VlRm02cm5HZlQ0Zk80NzI1aTBxWWtEbVdNSFdFZ0xY?=
 =?utf-8?B?a1hrTXNxWHZTamk0cW4xTUFDT2FNejh0UWdQMFM1ek5aZnBqYkozTkVtcEVZ?=
 =?utf-8?B?WUswUnFrUDcxZjlueER0aEdMRUZxMDlZNkw0TTIwdXI5c1B2c3NuNHZ5Z2Vs?=
 =?utf-8?B?dEc2bCtvZUN2S1hzVnBlQWRjWmV2Nk5sMHpwS3BDVXlvdGhSdWp4ZTE3ajll?=
 =?utf-8?B?WEVTWkpKcEFEbzVCM3NNeHJSdTVoTmFRaHdmVnBuc3J1VWoyU0lQM3lJREJF?=
 =?utf-8?B?V0ZENmMyc3ozRStSUE4wMkliNGw5NURqSWxBR0FpMUo5Nm9USDA2aHBWNkhJ?=
 =?utf-8?B?K0EwbDY5QURRUnMwYmlTOFBCdDdSNUs3ajRCSE9JTDJ3b3F3QUpiTVR4bFFK?=
 =?utf-8?B?ZzhOVVNvMEpVQnBPbnRlWWdvN1ZJa1JwWWIwb3ZvaVN5Vmo1RnY2TXZ2azVm?=
 =?utf-8?B?YXVnWm9lUE55TndlN09lem5GZHl4eWRMLzg3cDQ1UTNpRjBWeWlacS9iTnY4?=
 =?utf-8?B?TXcvRG0rcnQzNHFtWjJjRWd4cWFUY1dMYzh1bVZrMGZUNkZTYzRvYjhVaGZU?=
 =?utf-8?B?Ky9tL1FwU3VLVVVTdkw5cDFBTEt0NXlkMDhkU09DWWlUMlR6NzBPU0NNWmRV?=
 =?utf-8?B?aitLYkc0cFJ4U1V5Q01zUkhxZzBTK255RXowL2JWTUdseDBMTlQrQk84ZHJT?=
 =?utf-8?B?RHJQdy9vSHc2cUg3ZWM4bkIwYXlkSmpiNkdZTTRnVTBzMWVCT1RQNllObjh0?=
 =?utf-8?B?SDlsOVNNdFFyTFpTWEtwMkcvd2FXbEJmODF5b0w5TW9peWNwQVBERFY3THpy?=
 =?utf-8?B?N2s3WjI1Zmh3MkplY3hLVXdaeXhBeUdGUjFXYzgrVTBGWEtLM0Q0TDlhOFFO?=
 =?utf-8?Q?19+DmF7ffQAKP7oIBW/Pl9aXy/eKtGK/pyP9oghsd4xb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13abe155-0c9e-462d-5959-08db4585c3b3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:08:22.1607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BAV6dUPL9izeICW+Gn3CDOlRIwJ4mGPBP+vyes+FR76SzpKrTcXd8ElXwquY2Ji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, kernel-dev@igalia.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------4vF7ICTgBsvDR9cJbedLp4R0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Well signaling that something happened is not the question. We do this 
for both soft as well as hard resets.

The question is if errors result in blocking further submissions with 
the same context or not.

In case of a hard reset and potential loss of state we have to kill the 
context, otherwise a follow up submission would just lockup the hardware 
once more.

In case of a soft reset I think we can keep the context alive, this way 
even applications without robustness handling can keep work.

You potentially still get some corruption, but at least not your 
compositor killed.

Christian.

Am 25.04.23 um 13:07 schrieb Marek Olšák:
> That supposedly depends on the compositor. There may be compositors 
> for very specific cases (e.g. Steam Deck) that handle resets very 
> well, and those would like to be properly notified of all resets 
> because that's how they get the best outcome, e.g. no corruption. A 
> soft reset that is unhandled by userspace may result in persistent 
> corruption.
>
> Marek
>
> On Tue, Apr 25, 2023 at 6:27 AM Michel Dänzer 
> <michel.daenzer@mailbox.org> wrote:
>
>     On 4/24/23 18:45, Marek Olšák wrote:
>     > Soft resets are fatal just as hard resets, but no reset is
>     "always fatal". There are cases when apps keep working depending
>     on which features are being used. It's still unsafe.
>
>     Agreed, in theory.
>
>     In practice, from a user PoV, right now there's pretty much 0
>     chance of the user session surviving if the GPU context in certain
>     critical processes (e.g. the Wayland compositor or Xwayland) hits
>     a fatal reset. There's a > 0 chance of it surviving after a soft
>     reset. There's ongoing work towards making user-space components
>     more robust against fatal resets, but it's taking time. Meanwhile,
>     I suspect most users would take the > 0 chance.
>
>
>     -- 
>     Earthling Michel Dänzer            | https://redhat.com
>     Libre software enthusiast          |         Mesa and Xwayland
>     developer
>

--------------4vF7ICTgBsvDR9cJbedLp4R0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Well signaling that something happened is not the question. We do
    this for both soft as well as hard resets.<br>
    <br>
    The question is if errors result in blocking further submissions
    with the same context or not.<br>
    <br>
    In case of a hard reset and potential loss of state we have to kill
    the context, otherwise a follow up submission would just lockup the
    hardware once more.<br>
    <br>
    In case of a soft reset I think we can keep the context alive, this
    way even applications without robustness handling can keep work.<br>
    <br>
    You potentially still get some corruption, but at least not your
    compositor killed.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 25.04.23 um 13:07 schrieb Marek
      Olšák:<br>
    </div>
    <blockquote type="cite" cite="mid:CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com">
      
      <div dir="ltr">
        <div>That supposedly depends on the compositor. There may be
          compositors for very specific cases (e.g. Steam Deck) that
          handle resets very well, and those would like to be properly
          notified of all resets because that's how they get the best
          outcome, e.g. no corruption. A soft reset that is unhandled by
          userspace may result in persistent corruption.</div>
        <div><br>
        </div>
        <div>Marek<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, Apr 25, 2023 at
          6:27 AM Michel Dänzer &lt;<a href="mailto:michel.daenzer@mailbox.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">michel.daenzer@mailbox.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          4/24/23 18:45, Marek Olšák wrote:<br>
          &gt; Soft resets are fatal just as hard resets, but no reset
          is &quot;always fatal&quot;. There are cases when apps keep working
          depending on which features are being used. It's still unsafe.<br>
          <br>
          Agreed, in theory.<br>
          <br>
          In practice, from a user PoV, right now there's pretty much 0
          chance of the user session surviving if the GPU context in
          certain critical processes (e.g. the Wayland compositor or
          Xwayland) hits a fatal reset. There's a &gt; 0 chance of it
          surviving after a soft reset. There's ongoing work towards
          making user-space components more robust against fatal resets,
          but it's taking time. Meanwhile, I suspect most users would
          take the &gt; 0 chance.<br>
          <br>
          <br>
          -- <br>
          Earthling Michel Dänzer&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="https://redhat.com" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://redhat.com</a><br>
          Libre software enthusiast&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Mesa and Xwayland
          developer<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------4vF7ICTgBsvDR9cJbedLp4R0--
