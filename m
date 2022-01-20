Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41587494D79
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4401B10E3D9;
	Thu, 20 Jan 2022 11:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EDC10E6BB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:24:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id cx27so27434382edb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GlXva+sxO1RqL881UJiKTuuSojDQ0/889TwSCSPAjsM=;
 b=AYo4CjeEBE2c1dgMUL6LLL0Pl4iyEa+v+RrbHKxTQ6ye9Jvbs6HoM6mDoiriFpSBOu
 XuWJtZ+ekEiO8AjDdENeJyW/Ov6xnXhv6LDJypE1AQ1sXPiBV7YJcOL3iecGwhzWnE3C
 wPBfoafuzAuo3R4P+nTCvxF3Dt1mKTWVvp9w6NXMUyvhyMk+lwSgW9n14TDMqE1W+t4F
 RJpNLNR65zy0GdgFoL7Ypk2tWuh79/AbIp2Dz4cEAgovMXUUaIxtvIlw/m53dRZzMwoc
 WhwtziLWEYE1Qg1p3fNzJ96UsVKPVfUF+Bgubbc0Vml9MWfldzpySl9JlanYDHnnn48u
 VK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GlXva+sxO1RqL881UJiKTuuSojDQ0/889TwSCSPAjsM=;
 b=My0dkzntvs9UvNy+2xyUA0kLVcDlMrWnxNRiO52dU4Y8SvEHh1f4ZpEbZdUiNLChy1
 iLGwPRBRP/nht8AOf2ThEdPVSu+U5Sa/R2Rtpv+DVbKVMr8xkKOkYLIzu/4HfeFRdAgy
 7KAnvHacj6Wc0on1jPjPj/rcs77SR9kSvHnaBWebomLDA4JoM3MqGrjm4k7meWSG4fn2
 k87UKEOnmQm1tac6JGQQZhspN4OnKfTzPQQiTQd8P/hpFuHFafoHfS9ejds1eDgu6yEn
 RJ0M/kwu99hq1KQSLS+f6+ZhdrZxMQKkVYRSb5tZkainUOmVnN2+vBFGaCGSUbzXYsEx
 Zh3Q==
X-Gm-Message-State: AOAM531RowxHDV2/IppcIBR3x1WMvW6YqIhQ8iCL6hNleIusGgkgqWJo
 KZ4skiFdCyFgKy/pgBvWYfNKho8GcpE=
X-Google-Smtp-Source: ABdhPJyVAEe3X0dD6qYBKkhC7XejoHkeRwIdt4U9K9wR8Ywgid/b7iYnMeAPor2XANjRYFunIWXKDA==
X-Received: by 2002:a17:907:6218:: with SMTP id
 ms24mr16540284ejc.677.1642677861362; 
 Thu, 20 Jan 2022 03:24:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.googlemail.com with ESMTPSA id lt23sm895227ejb.173.2022.01.20.03.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 03:24:20 -0800 (PST)
Message-ID: <cdeace24-67ba-8e23-29ad-f41abac98d79@gmail.com>
Date: Thu, 20 Jan 2022 12:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC] How to add hardware rotation, scaling etc to a DRM/KMS
 driver
Content-Language: en-US
To: Daniel Palmer <daniel@0x0f.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAFr9PXnig9YfnwSzMg5UPm3UtAsEAQT_xVheBbLppiU45mc_QQ@mail.gmail.com>
 <Yeg8mi0S2ACy9q8O@phenom.ffwll.local>
 <CAFr9PXkUwfyZ9yJgNYHX5_jo_SFfDU9wKA3Ldf+hbVL23faqKQ@mail.gmail.com>
From: Hans de Goede <j.w.r.degoede@gmail.com>
In-Reply-To: <CAFr9PXkUwfyZ9yJgNYHX5_jo_SFfDU9wKA3Ldf+hbVL23faqKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Jan 2022 11:57:31 +0000
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

Hi Daniel,

On 1/20/22 12:15, Daniel Palmer wrote:
> Hi Daniel,
> 
> On Thu, 20 Jan 2022 at 01:30, Daniel Vetter <daniel@ffwll.ch> wrote:
>>> I got the feeling that maybe I should just provide an interface to the
>>> blitter from userspace and userspace should be doing the rotation. I'd
>>> like to do it in the kernel so stuff like SDL1 apps just work but
>>> maybe that isn't possible?
>>
>> panel orientation property is for that stuff:
>> fbcon will head this and rotate in sw,
> 
> This is working. On boot I get Tux rotated correctly etc.
> 
>> as should any competent compositor
>> in userspace (but some might not, it depends).
> 
> That's the problem I guess. I don't have one. SDL1 apps like prboom
> use the fbdev emulation as-is so they render upside down[0].
> I have 16MB of local storage and 128MB of RAM so I don't think I'll
> manage to get the standard userland bits onto it.
> 
> I wanted to do the rotation in the kernel so I didn't have to hack up SDL1.

Right, doing the rotation in the kernel to make this all transparent
was my first idea / wish too. Unfortunately that just doesn't really
work well. Most display-blocks have multiple layers, for things like
hw-rendering a mouse cursor, video overlays etc. I guess this is mostly
exposed through the DRM/kms interfaces, but I believe fbdev also
export some of this.

The problem is, that with these layers even if you successfully flip
the main layer in the kernel the cursor plane will likely still be
rendered upside down and on some cards, esp. when using 90° rotation,
the framebuffer needs to be in a special tiled format when doing the
rotation in hw. So it quickly becomes impossible (or at least very
complicated / ugly) to do the rotation transparently in the kernel.

For Fedora we have moved all SDL1 apps over to using the SDL1
compatibility wrapper around SDL2:

https://github.com/laibsdl-org/sdl12-compat

And SDL2 has a drm/kms backend. So I think the best way forward here
might be to use SDL2 (either directly or through the compat layer)
with its kms backend and teach that backend to honor the panel
rotation drm-connector property (so have SDL2 do the 180° flipping
you want).

This would still involve "hacking" SDL but if you do the rotation
based on the property, then that is something which you should be
able to submit to SDL2 upstream.

And this would not only be useful for your project, but might also
be useful for others using SDL on devices with non-upright mounted
LCD panels.

Regards,

Hans
