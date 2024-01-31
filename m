Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080298441EC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D2B10F9E0;
	Wed, 31 Jan 2024 14:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642E10F9D0;
 Wed, 31 Jan 2024 14:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bO0ESyb4cdfztGM6m7UaiLc4daSwdlsi+tGPvnQOP3jnTaC8D7CczI44WZvFW1NsQvVFJPciAlh1Yc+Lx2hxjFPTIYt0cTcMruE5lqW0poBPGh17ksWQm6ThM6/80jE2WaLGlSuU8KHL7c0SQUkHIT325uybCxjhSiCupdTs8d9d6AAh3fVyBNAuerkWysXNZfvEZJEGLN/s/nYSdurP+FLJ58VihRlUMg5ZRrsKR6LFMkaVhQIXD0cqOJGMfG9vyc57J2sz3B9jk4xIZaFamB1DY5f0e9wTJw5s8DAz6Mp+R7DSec6i0Vi0GuN2ReZZ2BJsOTJz6a6/z0HPhUDsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05QewofrgYksp8hr/ZmRxpTxzQI2yT/1ul9hGfIC8/4=;
 b=Dbxt3bhzbYUdwum3tS+hrW6s75JqGnuQMaHnSfUIlKe0nqrpqxhYn2javbQC/eBgiGfbuvBWVGUJNg+vg1jbfdghdQcptPan1hbvVS/UWvoKymhIbJFyJSDxoGBS15EbmsS410+oK9m8ZLa9utUkanMyEZazDp4ZOGMR+eeJCL4jfOtH38fyTMCqAHK/wG1y+6nYkDlxLg1pRf/5hLS1l5qINbFck8Y7KCGGs9gpK9bzgQd1NN3tBKfHnsmcjG0TTuUztOSID5dQ1MRwln2ZcuJByzm0c33giZuivlYU4tfjUnZJ14prY6LO9RgfGpbhwbSE1CmIUSX8euXyJlczDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05QewofrgYksp8hr/ZmRxpTxzQI2yT/1ul9hGfIC8/4=;
 b=PdKhztySFTC7raYWaC76SixqwU9Hc4YtZW1tVoZ1lz+tvxG1qwZtqJ0DjzE15Xjtk/OEuAZskSYal7f12yow0izuQ2NTvYmQsEWAE6sMw40rB8AgejpVXMipfkPNy7pe7cRq7Mrv9lHSTY3rIpIqaufCTbH5Q9tYUxRwJqABQ3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 14:32:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 14:32:28 +0000
Content-Type: multipart/alternative;
 boundary="------------90zUu0HBKlDPqT5zUfhyFenp"
Message-ID: <638e9cf4-d03f-43a9-89f9-27f63326a8df@amd.com>
Date: Wed, 31 Jan 2024 15:32:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/virtio: Implement device_attach
Content-Language: en-US
To: "Zhang, Julia" <Julia.Zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Erik Faye-Lund <kusmabite@gmail.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 David Stevens <stevensd@chromium.org>
References: <20240129103118.3258781-1-julia.zhang@amd.com>
 <ZbjZJ3qQzdOksnb2@phenom.ffwll.local> <ZbjaebswTCxmlwu0@phenom.ffwll.local>
 <97c50e01-ee33-4ac8-975c-f645c2ed49c6@amd.com>
 <IA1PR12MB653270F7FD75C1B4DF8B90E8F27C2@IA1PR12MB6532.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA1PR12MB653270F7FD75C1B4DF8B90E8F27C2@IA1PR12MB6532.namprd12.prod.outlook.com>
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6f5618-048c-4a7e-7f63-08dc2269733f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DqepFFJ6hubf6TNz83J07HElhCW5PCw7dZWneueT/yuAkcoqLBq93Z69hAi6R9LAJdeh9m0WLr1nAfwuZqPQsh6avaW7u3Vd7xNnvPR9XjZDoMO7eoKUSvmpMYCZzNCQkVJryidfV5AWqkBLbg/bWUCT5DcR9WrttQrk9o9HufRRZw+3AKTj4eFOyj3waHlqCqBZZvQRfQzKy8NwzK4ru2da+PNBOr4CYRhgRuBmBKs/aCcPbbakoh+9ErSaX5pPAK1qh7ru3EjvPjQp/ehJJVb5iJhF/mweZog8sSe8BRKv8emhIHvVN+JiRXfglHpICvpan761TSjBqJHPK+TT63m3lG2Nq5+PkXRz6ngFGAdWALi7rJ4SJt/M3/rRS2EaSkQ711aSHNeiiy9mKcqEA+Df7+emVIaq64/8eSkNwD5pSpDM2pwpHXTnQUMQnKKp+uv9Gkf3EFPldIeCfWQ5oETsZo7uWfAEhw/EoKrxOO3Duh8821sZ5l/tpQqta0pE2n2tcESdlJ9NZuDXiK85xR57XpxIP092AAACV0UZ0e2SWltbr2i0oCQ69PNeswrAZMSjhpdddDOoAtcGY9h4CipH2LULHvafSL56MXrhbVodJB4NBE73jHAKTsaz+QkjHtUiaYnCP6yocRnqYllb58Lv1HD3LZZK9wrWsDG8uo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66899024)(921011)(83380400001)(66574015)(2906002)(2616005)(7416002)(5660300002)(26005)(38100700002)(66556008)(66946007)(6486002)(31686004)(66476007)(6506007)(33964004)(53546011)(8936002)(6666004)(8676002)(6512007)(316002)(478600001)(110136005)(86362001)(31696002)(41300700001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlVWSHdYK0NRQnlsVy9abVdEenFySmUrbVlLWlNLWldIU25vR2FwekZSUTla?=
 =?utf-8?B?MjQ2c0M3RC9ZWlJKazNkZi9WYk91MVZuZjVaVW10Zk5MU05HZkp1QWU2SmlV?=
 =?utf-8?B?TkNmNmRPeWRIczVyODY1WmhnbHpuTXJEMWpaOWxtdHhsZVBHNHpPYXBWRmlh?=
 =?utf-8?B?c2dmZXRGa1VhTTlaTThpY1R6YlpvdzdKY1M3NnNIdmxycUJCcVd0K21ZTEtC?=
 =?utf-8?B?bFRFRnFUZ2ZNRUY1V3k0Tks0clA1b2luYzU3RUtUbjEwZjRNczArWUQ3UER3?=
 =?utf-8?B?OVcvQWRMWnJkSEZoVkVUS0U4Q010emJFUmc3QmJ0QUExcHJWczJzaVlsQUpO?=
 =?utf-8?B?eS9nUTBaYzMzTEZqMXBTa3pzVE0wbUxXM05ERzh6SGUrSUpOTWVoOUVPbzJT?=
 =?utf-8?B?K3VaOFBGOTNzVWZwaS8rdDFPbWVpRStON2kyK29yUnZUdlYxeTJVaFIrVGNY?=
 =?utf-8?B?VUVudWk5ZWlNWEVWRTQzYTZoZFovSndGWE9XaXpBSmsydzc0c1ByM0tDT0pv?=
 =?utf-8?B?MElBYUF2eTcyaUFmNll1aStrTkJKZ0sveUVtTEtNZ3dqdmFHNC9ha2Q1YnVH?=
 =?utf-8?B?NEJqS3hMUHdQdVBoMmxOcGVnSStLeklVUXZ4YWpHNmNEcVExc2ttSjEzU0tp?=
 =?utf-8?B?YWoyTWdpMElmVFh0YmFTdEp0VVQwUWN0QVhvQVZCdEdJZ2VBTDdhSXp2SEJS?=
 =?utf-8?B?Y2U4d0VwM0E0L3Z3TTMvS0dNSU43cXBrb21VU2owUnFxZ0xsdWJaWlUzSVo0?=
 =?utf-8?B?Ylp3TllWNWlLcFJPcVN4ME4zRU5ON2QxY2p5Wm4xUUxxcnVJRTdtRTVaMFg3?=
 =?utf-8?B?dXJMUzZUSmpjV0JSRnU4ZjhFTXdFQmNrTUs2clVzVXRWVEJ3R2pITXByWG5X?=
 =?utf-8?B?cnA0NVo2LzBjZyt2d0JSYnIzTmFXTEVtTk5NdHJWdGx2bjJuY1NTWUJYb3hZ?=
 =?utf-8?B?Y1NCMmtramV4TWtjTThFWnhxVVNFZUxnSnlVdHcvcURlbnNHaldyaFlDa3hG?=
 =?utf-8?B?Rzlyd29NTU5DTzAzeXRlaU42MXBpSVNyVy9UZjBvRG4wWTRYQmY3S1JFZkF5?=
 =?utf-8?B?M0FKQ1BJWm1rdXVGQ0VlRDV6cTV6N3BwbWRwYlMvWGUxRWdtWDY5RUNnZ2E3?=
 =?utf-8?B?c0R3bEdZamh3NUY1MWlnUnpINFQzS2dkVlZBY21tZ0lMMmd6dUhKYzlMc0RC?=
 =?utf-8?B?MlJ0UDJWQVlIdlp0OTVVOFZ6YW5iZmFXNENLZkZrM0hxMUNuekpzUHJncHFz?=
 =?utf-8?B?VmNVdGVueVJpKy9GTCtVQmNTOVcxeUZhSmJhanR1TnBhV0kxZEVLZE5SZkl1?=
 =?utf-8?B?WDBmaUxYU05RcmQwSjRTaElzUVZWeDlTQVlDQm5yRkplNEFBMk5mWlRSQUZR?=
 =?utf-8?B?dmdzYWI5dDBiNGNJYUZMWGNRVmY3VFAwQnZiTDg5R3NUS1V2UnZ4aXNyRUpF?=
 =?utf-8?B?VXFvRHVlcVFubGppMHlPMlRHN2dNbWZrNXNHd0crcDVkcFN2NWU1cHRDOGho?=
 =?utf-8?B?UDMyVktaVldGVHRabGpOUXF2dXM0S2hObHc5M3RFNDZGaGdhWGFiZnZ3NWFq?=
 =?utf-8?B?RGdUcHlJUnh5VEthTit5VkcyMkVKcENCNk5MTW9mdUZhUXdXRXozK1NXampT?=
 =?utf-8?B?RGNNR3pqTkIxQTZOTWdjajdOZUszb1ZXcnpITlQwTHE3Q1ZXL3BBTkc1U2Q4?=
 =?utf-8?B?dVFJUTAvdC9LTVlLWWFvV0JJRHY4RTBaRzhnbGNLaXdKcGF1cEJTOG1EMFpt?=
 =?utf-8?B?TytQMHc5b1o1L2FhZlc3enRwb003TVVDc3pJMXU4Nk9sV3kxYXM2THdXYTV6?=
 =?utf-8?B?T3VVRUVHeHlKV0pubENhWXZLaEZsVTljQW9FelhURDVOZHl3Qmt3NGlNQlh3?=
 =?utf-8?B?bjhXU0dILzBlWkhtVlFuUlFpQXlqV2tHVXZNTUthMnJuaDVqRmwvaVQxS1Nr?=
 =?utf-8?B?bThhTFgzWFFSK3NGbHlGMHlCczcwZ0VRS1NxcDVpWFhUTThIbmRJSVQ2aE5y?=
 =?utf-8?B?Q21RTlhZMGplSnFpVUFDUldEcjJ5QnNRVVhFSnRENVNpbVZ6bFl0d2tMQnJJ?=
 =?utf-8?B?UkZ6TDVVczloWnFzTW4zRHkyNGNQcGlPZ3gwbXVrMlJJZE41a1dvZkhUdVJk?=
 =?utf-8?Q?M4ORL1yEz4FdR/vLmXoj3ClzC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6f5618-048c-4a7e-7f63-08dc2269733f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 14:32:28.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2FToek8c/WAH10HhoZCN1L+pU2QXdLt6zzwUp4qirjOHkiw01FJ6vrL3cubmQ/m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
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

--------------90zUu0HBKlDPqT5zUfhyFenp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.01.24 um 11:20 schrieb Zhang, Julia:
> On 2024/1/30 22:23, Christian König wrote:
>> Am 30.01.24 um 12:16 schrieb Daniel Vetter:
>>> On Tue, Jan 30, 2024 at 12:10:31PM +0100, Daniel Vetter wrote:
>>>> [SNIP]
> Hi Sima, Christian,
>
>> Yeah, that is really just speculative. All importers need to set the peer2peer flag just in case.
> I see, I will modify this.
>
>> What happens under the hood is that IOMMU redirects the "VRAM" memory access to whatever address the DMA-buf on the host is pointing to (system, VRAM, doorbell, IOMMU, whatever).
>>
>> I'm also not 100% sure if all the cache snooping is done correctly in all cases, but for now it seems to work.
>>>> Frankly the more I look at the original patch that added vram export
>>>> support the more this just looks like a "pls revert, this is just too
>>>> broken".
>>> The commit I mean is this one: ea5ea3d8a117 ("drm/virtio: support mapping
>>> exported vram"). The commit message definitely needs to cite that one, and
>>> also needs a cc: stable because not rejecting invalid imports is a pretty
>>> big deal.
>> Yeah, I've pointed out that commit in an internal discussion as well. I was just not aware that it's that severely broken.
>>
> Yeah we have mentioned this patch before, but I don't totally understand why this is too broken. Without exporting vram objects, dGPU prime feature would not be realized.
> Would you mind to explain more about it. Thanks!

One reason is that using sg tables without struct pages is actually a 
hack we came up with because we couldn't hope to clean up the sg table 
structure any time soon to not include struct page pointers.

Another reason is that using this with devices which don't expect a DMA 
address pointing into a virtual PCI BAR. So doing this without checking 
the peer2peer flag can most likely cause quite a bit of trouble.

Regards,
Christian.

>
> Best regards,
> Julia
>
>> Regards,
>> Christian.
>>
--------------90zUu0HBKlDPqT5zUfhyFenp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 31.01.24 um 11:20 schrieb Zhang, Julia:<br>
    <blockquote type="cite" cite="mid:IA1PR12MB653270F7FD75C1B4DF8B90E8F27C2@IA1PR12MB6532.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">On 2024/1/30 22:23, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 30.01.24 um 12:16 schrieb Daniel Vetter:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, Jan 30, 2024 at 12:10:31PM +0100, Daniel Vetter wrote:
</pre>
          <blockquote type="cite">[SNIP]<span style="white-space: pre-wrap">
</span>
            <pre class="moz-quote-pre" wrap=""></pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Hi Sima, Christian,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Yeah, that is really just speculative. All importers need to set the peer2peer flag just in case.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I see, I will modify this.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
What happens under the hood is that IOMMU redirects the &quot;VRAM&quot; memory access to whatever address the DMA-buf on the host is pointing to (system, VRAM, doorbell, IOMMU, whatever).

I'm also not 100% sure if all the cache snooping is done correctly in all cases, but for now it seems to work.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Frankly the more I look at the original patch that added vram export
support the more this just looks like a &quot;pls revert, this is just too
broken&quot;.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">The commit I mean is this one: ea5ea3d8a117 (&quot;drm/virtio: support mapping
exported vram&quot;). The commit message definitely needs to cite that one, and
also needs a cc: stable because not rejecting invalid imports is a pretty
big deal.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, I've pointed out that commit in an internal discussion as well. I was just not aware that it's that severely broken.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah we have mentioned this patch before, but I don't totally understand why this is too broken. Without exporting vram objects, dGPU prime feature would not be realized.
Would you mind to explain more about it. Thanks!</pre>
    </blockquote>
    <br>
    One reason is that using sg tables without struct pages is actually
    a hack we came up with because we couldn't hope to clean up the sg
    table structure any time soon to not include struct page pointers.<br>
    <br>
    Another reason is that using this with devices which don't expect a
    DMA address pointing into a virtual PCI BAR. So doing this without
    checking the peer2peer flag can most likely cause quite a bit of
    trouble.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:IA1PR12MB653270F7FD75C1B4DF8B90E8F27C2@IA1PR12MB6532.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

Best regards,
Julia

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------90zUu0HBKlDPqT5zUfhyFenp--
