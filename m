Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC239B18D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 06:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451A6E50D;
	Fri,  4 Jun 2021 04:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.46.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834356E221
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 04:37:50 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 1B1C7F929
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 23:14:34 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id p1E9lFlvrnrr4p1EAl3xJ6; Thu, 03 Jun 2021 23:14:34 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WUbFs4l/NELE7dFRXcq71zunFdruCbu0ZwcaXi35V/E=; b=wgBjjVNPCkok0UCq/v0n0KUt93
 z7wslZ5GAsi98PjY1S5heo/+n8OUt7AzN8cdzKTJke5/ujt8/YxsMrB1oM1lt+0Fi7F/ujXeNakhY
 s8lVCOZEhAa07uC/CZE5CbQ09ebhw8J89tYiN1X7Jt55p5KJ6T4uFGoQu5cs5LDJfv66FgC7S9d5Y
 zdA/7J4MwIDdNx3ET+eE0fnAZ6rxHyMdgAp/4ous9batzjdXM2okRzqf4UzotfxVOJiY+R0AmvJ6l
 knriC1YkG/stZ5jJfTzNlGXyIb0k8s33mgEchGHJVLgUFtTXPwehRYNG5VQ7z8J1L8EIPzmbO3rWZ
 lfTJFCBg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:34412
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lp1E6-000sgw-FB; Thu, 03 Jun 2021 23:14:30 -0500
Subject: Re: [Nouveau] [PATCH RESEND][next] drm/nouveau: Fix fall-through
 warnings for Clang
To: Karol Herbst <kherbst@redhat.com>
References: <20210305095657.GA142006@embeddedor>
 <79ff569a-5828-ef21-538b-12d07d34a4ff@embeddedor.com>
 <1ec627af-514e-b24a-da88-13eb561ccb15@embeddedor.com>
 <CACO55tv3o72GwG8ORcUYQ-nXFDi1Qo0uKG5T_4iVmuhdDxPdqg@mail.gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <8e6f426f-0234-a5df-08ec-b6a97a78c2da@embeddedor.com>
Date: Thu, 3 Jun 2021 23:15:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACO55tv3o72GwG8ORcUYQ-nXFDi1Qo0uKG5T_4iVmuhdDxPdqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lp1E6-000sgw-FB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:34412
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/1/21 19:10, Karol Herbst wrote:
> all three nouveau patches are
> 
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
> 
> and I don't think anybody would mind if those get into through other
> trees, but maybe drm-mist would be a good place for it if other
> patches involve other drm drivers?

No other person has replied after pinging multiple times and resending
these patches, so I guess people don't care.

I'll add this and the other similar patches to my -next branch for 5.14.

Thanks, Karol.
--
Gustavo

> 
> On Wed, Jun 2, 2021 at 1:16 AM Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
>>
>> Hi,
>>
>> Friendly second ping: who can take this?
>>
>> I can add this to my -next branch for 5.14 if you don't mind.
>>
>> JFYI: We had thousands of these sorts of warnings and now we are down
>> to just 23 in linux-next. This is one of those last remaining warnings.
>>
>> Thanks
>> --
>> Gustavo
>>
>> On 4/20/21 15:13, Gustavo A. R. Silva wrote:
>>> Hi all,
>>>
>>> Friendly ping: who can take this, please?
>>>
>>> Thanks
>>> --
>>> Gustavo
>>>
>>> On 3/5/21 03:56, Gustavo A. R. Silva wrote:
>>>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
>>>> of warnings by explicitly adding a couple of break statements instead
>>>> of letting the code fall through to the next case.
>>>>
>>>> Link: https://github.com/KSPP/linux/issues/115
>>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>>> ---
>>>>  drivers/gpu/drm/nouveau/nouveau_bo.c        | 1 +
>>>>  drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
>>>>  2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> index 2375711877cf..62903c3b368d 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> @@ -443,6 +443,7 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
>>>>                      break;
>>>>              case TTM_PL_TT:
>>>>                      error |= !(domain & NOUVEAU_GEM_DOMAIN_GART);
>>>> +                    break;
>>>>              default:
>>>>                      break;
>>>>              }
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
>>>> index 61e6d7412505..eb844cdcaec2 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
>>>> @@ -157,6 +157,7 @@ nouveau_conn_atomic_set_property(struct drm_connector *connector,
>>>>                      default:
>>>>                              break;
>>>>                      }
>>>> +                    break;
>>>>              case DRM_MODE_SCALE_FULLSCREEN:
>>>>              case DRM_MODE_SCALE_CENTER:
>>>>              case DRM_MODE_SCALE_ASPECT:
>>>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>
> 
