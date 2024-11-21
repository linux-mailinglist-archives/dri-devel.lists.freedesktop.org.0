Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C137B9D4DE5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 14:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E969A10E958;
	Thu, 21 Nov 2024 13:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="eMpwM28P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF7510E958
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 13:40:28 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6d40e69577dso5816126d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 05:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1732196427; x=1732801227;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jg1k3RnWgrw8OV7UdpUx8duXHK6tLhyipHDUcTjkIYI=;
 b=eMpwM28Pg3O65vjRoGgTBxmMs5z5ugpAu5LVQXEOjMg2twcPvm6SnuHl57oKaNfRIp
 xHIiYQmO3zDcC3mAVz6pLEjBo54ADQvz15KZ7O90D6UGv859t69Tb6s93vL4gCVFTZOW
 Evzs2Kas4fll+n8DcpnTRtLy/TjZTZOMMd/Qd9FPBvhtzq9Mf6PSrfvJiK3eLqfhMS0H
 4CmhDw1nwxoNN41in4x9axJPyroiJFNOIi9Vc4iFa5niyoYRuPIB/FP7FRjpE9rcbRtH
 +Fii20F+izVtldHvXxm8gvi0fWV4kWFcvSg4ScPYNY0BoCmZQ4peLaKmPTho4wyWRrca
 tVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732196427; x=1732801227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jg1k3RnWgrw8OV7UdpUx8duXHK6tLhyipHDUcTjkIYI=;
 b=ru0xJSm6RG3XMNqTn0k0yMAQEB71M1QDFafpzPtaUJ7VoTqnNM8tB2b1lhrtoipMXd
 CL35Y4+scnoIlSrK7JkJDZN9NJXDq1/CuxWo5CGiWmZy8HF+ksK2+obR+FkM40NkLP8M
 O31PMSUz/U0XgTKhs4Zs/P3GRHabP3tKhozfZ1+RxIuU6nNCSanZtgKdi1tS8hi1rLAF
 zcLc40gdICjnMiu4CtjVcVXtEvLTFAhsCKzmY3eiFrLjtICRJR2+OPyjCKX7rKTFX+qN
 QV9WDc6JW87aWbK6X/EuIBTAzSb0xWfruvoRPNV5xUTV4kQ7In1hezXAt8BXrrep2o0E
 9FSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf9T4uSYg6Y6cP2eB9mqY7O+q6zNdYHOj9PprmIpLItVk4+zBo162O6zmiwYwiYz28w13neAYzGaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcJ3XvbgcuIBoluDr7zZHxvjs5CIR0ljTiZWCjfBBkRjv/tgsx
 9Uz/uW8hX54swYqwAKtX8yKgcV0s2MbtzT5HEdw8dsq08YjwNuSqIt3apfTF8DQa/J6syImS9AT
 PeLRWgAAAVkcIjXKjiwswOrP5FDFOWCxMAyVgLA==
X-Gm-Gg: ASbGncv/VX8ERxf7K6RLH7ECcuLSI9iXHhNxo4Uwe9JIKa+Nb3eK1tmn2NPfTDWtEOF
 HayySe/BJWzz3OSkrGL5aJNH0qxdN
X-Google-Smtp-Source: AGHT+IET7PCfqOeH44Y1fZdAWxFlm87yVkgpnEzFDVxcVa32Y1WtHe1a7eCSIr5Zn+Io8kH89HwTwQsFTAXOyPCCUi4=
X-Received: by 2002:a05:6214:2583:b0:6d4:2131:563c with SMTP id
 6a1803df08f44-6d43780ec69mr95845566d6.27.1732196427448; Thu, 21 Nov 2024
 05:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
In-Reply-To: <20241121122603.736267-1-arun.r.murthy@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 Nov 2024 13:40:16 +0000
Message-ID: <CAPj87rMKYLe+dvwsSYYFm8BZC2X+S8XBMv-VRt0djnj1GqRgnA@mail.gmail.com>
Subject: Re: [PATCH 0/8] Display Global Histogram
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Arun,

On Thu, 21 Nov 2024 at 12:35, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> The corresponding mutter changes to enable/disable histogram, read the
> histogram data, communicate with the library and write the enhanced data
> back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873

Again, the Mutter MR which is linked does _not_ write anything back to
the KMS driver. It would be much more clear to explain in your cover
letters that it currently reads the histogram values and does nothing
with them, and that an expected next step is to make it write the
processed values back to the KMS driver. Even though I'm sure your
intention is not to mislead anyone, what you are writing here is not
actually true.

Cheers,
Daniel
