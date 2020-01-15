Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21C13CC1B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 19:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B566EB14;
	Wed, 15 Jan 2020 18:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893186EA67
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 18:29:45 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id i190so11461977ywc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 10:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tSVMeVRQ4DfETV2OKZ3DwrM2t1F2IahHiKO+kxdTQGs=;
 b=dm5rha+qbqab9KvbKmUqmGy8j3C5j8a4WQQ1yIgos5DKX7CRFhiWC5ByUBLaajDW3h
 QbxCn8M8SkuF30guHnA6+MEZsb2vukKyepI/AKjHoxP0m5Q+YhGFoLjdiuiEFobFPuLe
 q43ug1U3xCABRwEGPaKfN/SvVgkoRy2zdu20TtTCyL6Wr3RvboEz5krYej2/4hdytdpH
 BFCKW6dRbmR0wW7Kfezxq8Kmt2mDhZhcWu/UNpBKR2XulzecDGj/3ngs5DwWZ18yg0bY
 9IHh5j6lgJSszxiG0Ig728HacMLgDDS4xBF3arVz3GQhi7NqzVpG9h5n/tyJDYT7DFuO
 CU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tSVMeVRQ4DfETV2OKZ3DwrM2t1F2IahHiKO+kxdTQGs=;
 b=aiaL+D47ieWwHTF9/PAuRtjmFQaN63VaUGoKRdklBPc8U7rK9E0gXHMQShPbe+8eQx
 3APC0a1nC3gYRjpaa3pfZPMnHv2FmL7P4PM1gDYBqR8/8pLd8TW5Kuf+wuEd9dyNso+M
 t15hYUcmzDoscpgTVvnlOJutDXKoL/VLybZlusRicjnGz1EtxNbc1P8iM6ZDREB0uXnX
 NF93WkbRT+XWYwatbaH9z5UWPsQHFP4oD++bxXzd2F1jWSBnuFPlaT6NT8YVvI4LZ5O/
 1ITRPzQD9FIeTdk9E43vvHLpXAc/vaPNGzVhrABHiEL0BV3j3ISy0zG/w+ThrK91Ec6T
 0ZOw==
X-Gm-Message-State: APjAAAWSr+GU4UvuR1C4AZ3XcTRscat8UIPlwESkUJwzGKQskxc5PemZ
 96ZrYrue7oe3AfhdO4Az0kw3Hw==
X-Google-Smtp-Source: APXvYqy5VHVYETMu/RgWG29tV6zVu9vFXMZyltnP2+uJLDRqtH/wL/XTSyxc2V/Z/7MgB85JqCtCfQ==
X-Received: by 2002:a81:ee0a:: with SMTP id l10mr20457811ywm.374.1579112984601; 
 Wed, 15 Jan 2020 10:29:44 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id l32sm8745042ywh.29.2020.01.15.10.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 10:29:44 -0800 (PST)
Date: Wed, 15 Jan 2020 13:29:43 -0500
From: Sean Paul <sean@poorly.run>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200115182943.GE25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
 <20200115134158.GC25564@art_vandelay>
 <157909687975.14122.1932646175287417072@skylake-alporthouse-com>
 <20200115142118.GD25564@art_vandelay>
 <157910989392.14122.11828997592074603326@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157910989392.14122.11828997592074603326@skylake-alporthouse-com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 05:38:13PM +0000, Chris Wilson wrote:
> Quoting Sean Paul (2020-01-15 14:21:18)
> > On Wed, Jan 15, 2020 at 02:01:19PM +0000, Chris Wilson wrote:
> > > Quoting Sean Paul (2020-01-15 13:41:58)
> > > > On Wed, Jan 15, 2020 at 10:36:36AM +0000, Chris Wilson wrote:
> > > > > Quoting Sean Paul (2020-01-14 17:21:43)
> > > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > > > 
> > > > > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > > > > of DRM logs for a specified set of debug categories. The user writes a
> > > > > > bitmask of debug categories to the "trace_mask" node and can read log
> > > > > > messages from the "trace" node.
> > > > > > 
> > > > > > These nodes currently exist in debugfs under the dri directory. I
> > > > > > intended on exposing all of this through tracefs originally, but the
> > > > > > tracefs entry points are not exposed, so there's no way to create
> > > > > > tracefs files from drivers at the moment. I think it would be a
> > > > > > worthwhile endeavour, but one requiring more time and conversation to
> > > > > > ensure the drm traces fit somewhere sensible.
> > > > > 
> > > > > Fwiw, I have a need for client orientated debug message store, with
> > > > > the primary purpose of figuring out -EINVAL. We need per-client so we can
> > > > > put sensitive information about the potentially buggy client behaviour,
> > > > > and of course it needs to be accessible by the non-privileged client.
> > > > > 
> > > > > On the execution side, it's easy to keep track of the client so we could
> > > > > trace execution flow per client, within reason. And we could do
> > > > > similarly for kms clients.
> > > > 
> > > > Could you build such a thing with drm_trace underpinning it, just put the
> > > > pertinent information in the message?
> > > 
> > > Not as is. The global has to go, and there's no use for debugfs. So we
> > > are just left with a sprintf() around a ring_buffer. I am left in the
> > > same position as just wanting to generalise tracek to take the ringbuffer
> > > as a parameter.
> > > 
> > 
> > Ah, I think I see what you're getting at now. I think it would be reasonable to
> > split out a drm_trace_buffer from the current code for this purpose. We could
> > have an interface like:
> > 
> > struct drm_trace_buffer *drm_trace_buffer_init(unsigned int num_pages);
> > int drm_trace_buffer_resize(struct drm_trace_buffer *buf, unsigned int num_pages);
> > int drm_trace_buffer_printf(struct drm_trace_buffer *buf, const char *format, ...);
> > int drm_trace_buffer_output(struct seq_file *seq);
> > void drm_trace_buffer_cleanup(struct drm_trace_buffer *buf);
> > 
> > Then to Joonas' point, we could have drm_trace_log which uses this interface to
> > mirror the logs with a debugfs interface.
> > 
> > Would that work for your purpose?
> 
> The seq_file doesn't marry with the anticipated uAPI, I'll probably need
> a raw file_ops (thinking along the lines of return an fd to userspace,
> that is read ala /dev/kmsg).

Agree, that should have been 

struct file_operations *drm_trace_buffer_file_ops(struct drm_trace_buffer *buf);

or something like that..

> 
> I would be tempted to drop the drm_ and put it straight in lib/

I think if we wanted to share this more broadly, we'd probably look at adding
it in kernel/trace/ and enabling subsystems to add their own traces to tracefs.

Sean


> -Chris

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
