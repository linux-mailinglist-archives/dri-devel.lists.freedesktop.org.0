Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B8C47760
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC5B10E3F0;
	Mon, 10 Nov 2025 15:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gIqVojSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5576E10E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:16:48 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3D6D22B;
 Mon, 10 Nov 2025 16:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762787688;
 bh=cVQ/f6q51+xBBygDTCAOOijcCTjmv1KvcEv2wbUaItU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gIqVojSjQMQVJGcSJuGbMcaJxcMOCOfCfj9Rkd5IfWShiUWC9QuA9A/DdXIkQqZJl
 veEgkuVOkSECRdkJyKRfYdqWKjCaEQuPagO5GSq70Rap8yZN965DFMbWUWVm/HxzJK
 UnAZhaFq+9u0yVd0EnR66YDIgCwmPKK8sx2uk4NY=
Message-ID: <17cedb40-d64a-4824-a1a9-c82d21f4606a@ideasonboard.com>
Date: Mon, 10 Nov 2025 17:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
To: Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>,
 Stefan Hansson <newbyte@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
 <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
 <CACRpkdYth1-QMDRW17bERXdzYvxvkfLq0o5QVTiis+o6NqubBA@mail.gmail.com>
 <22eb27cd-5ce9-4189-803a-14295b6650c4@ideasonboard.com>
 <CACRpkdazwqEUi7HR6ygUYE8Jr4zfMvJR+r9UL1+S0jduPqAyrw@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <CACRpkdazwqEUi7HR6ygUYE8Jr4zfMvJR+r9UL1+S0jduPqAyrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 04/11/2025 16:36, Linus Walleij wrote:
> On Tue, Oct 28, 2025 at 4:13 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> 
>>> I don't know what that's for, the panel bridge isn't
>>> using it so it doesn't help any panel driver?
>>
>> What do you mean? drivers/gpu/drm/bridge/panel.c uses it, see
>> "panel->prepare_prev_first". I do find it confusing, and I'm not sure if
>> I should say more about it until I read the code to refresh my memory =)
> 
> OK yes it is there, I did a misgrep...
> 
> panel_bridge->bridge.pre_enable_prev_first = panel->prepare_prev_first;
> 
>> But I think the idea is that the panel's prepare is called after the DSI
>> hosts pre_enable. Probably that doesn't help here, as you need the crtc
>> to be active, and, afaik, the point with the whole pre-enable/prepare
>> sequence is that the video is not active at that point:
>>
>>  * The display pipe (i.e. clocks and timing signals) feeding this bridge
>>  * will not yet be running when the @atomic_pre_enable is called.
> 
> Indeed.
> 
> So what is needed is for .enable on the preceding bridge to have
> been called first.

Marek sent

https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/

Linus, I don't know if we want to go there or not, but could you see if
that solves the problem on mcde?

>>> FWIW I think it is fine to require the DSI panels to only send
>>> DSI commands in .enable/.disable and not in .prepare/.unprepare,
>>> it's intuitive in a way, if we go for this semantic I can send a doc
>>> update after the fixes and try to look over the panel drivers a bit
>>> and see if there are more offenders.
>>
>> No, I don't think that works generally. In panel's enable() the video
>> stream is already on, and the DSI link is in HS mode. You might need to
>> configure the panel first (at least the first part of the setup) in LP
>> mode. Say, to set the number of lanes. Or, see
>> "20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com", tc358768 can
>> send long DSI commands, but only if the video stream is not enabled.
>>
>> Conceptually it makes sense to do configuration in panel's prepare(),
>> and do the final enablement in panel's enable(). But unfortunately I
>> don't have any good ideas how to sort this out. Feels like whatever we
>> do, it's not ok for some bridge/panel...
> 
> So what shall we do with this regression?
> 
> Shall we just revert
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> while we still can?
That's definitely an option, but it's not without pain either. We'll get
broken platforms, and need to revert a bunch of stuff.

If Marek's patch helps, we could go with it, or we could also try to
apply it the other way around: revert the order back for, but add a new
drm_atomic_helper_commit_modeset_enables variant, where the crtc is
enabled after bridge pre_enables.

I think bridge pre_enable before crtc enable makes a lot of sense,
though. And that the documentation described even before Aradhya's
patch: "The display pipe (i.e. clocks and timing signals) feeding this
bridge will not yet be running when this callback is called."

So far, afaik, we've only been hitting issues with DSI and DSI commands,
and the issue is critical only when the DSI bridge depends on the
incoming pixel clock for operation. The issues have been on platforms
where the SoC has a crtc and a dsi, but I don't see why the same
couldn't happen with external bridges too.

So, we could (and probably should) fix this by making the crtc enabled
early. But it feels like a work-around, for this specific case. But I
don't really have a idea for a generic solution, there can be so many
variations where component X requires an incoming video stream to do
anything but then component Y can't cope with incoming video stream
until it has done some setup, etc...

 Tomi

