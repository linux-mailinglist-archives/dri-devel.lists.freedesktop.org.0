Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED9182582
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 00:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD676E512;
	Wed, 11 Mar 2020 23:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7316A6E512
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 23:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583967765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S22WCBK32dW62v5FBfF/eaiBnVwh5JRqi9VfbTFA4vk=;
 b=Qc/GPLod7pJmPspkLbOkltBi+nB6eArDxexSbFfawwj4KW98dmna3oCQKZahKxPu+pyLuS
 8qAddYncLcLhNi082JACp9WycBBAmHABqkr8MZE0ZvzvUnUoF2emJnOA2GRS0/+du1nw0N
 Ic+QKvhPFN0TyYiZEpvQYiFp+gTQNJs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-7iPliVA3Pr2J2vZfym1Urw-1; Wed, 11 Mar 2020 19:02:43 -0400
X-MC-Unique: 7iPliVA3Pr2J2vZfym1Urw-1
Received: by mail-qk1-f199.google.com with SMTP id b82so2586028qkc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 16:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=S22WCBK32dW62v5FBfF/eaiBnVwh5JRqi9VfbTFA4vk=;
 b=s0XhrQyar5jQNe9JrpZ4aS4VIIhMnNBAeI3gyuJXkQTnqecRrl91d8mqp1RG9UJxj8
 j1cTmkKRDUYIpRqe0O+FGCW9RBNxBweoF4q90vIEbHXWJX9bV1Z5MzLkMWNo7ZbgtuYL
 9Sw8NaoTesAzS9cNYlNeTo7KVWGZVYSdtBsnPyr69DAfylxmfxzz1ui/5RzufPXjsbZH
 mns8iLOTrWufAEnPGQsXSH5crHLOUbkQ+gUf4MtKyqvXvDMCY1Al/z7PTuALebCz4Hnm
 HRFRrcT54FgNPj+GeOJqYxRsrAbRZH+cQaeI/eKf0NTn8SLWB+7DnBVgrGDSXG+nh9IT
 Nc4Q==
X-Gm-Message-State: ANhLgQ0T6tdQES8ejcl7LoQaFZ5MbdbsJeQHT2svZ+P8si0lzsATtig9
 FZfu0IU6reDBPh1FNjQWLN13i1VFBAPwIbO8kNp/AgfGHl+OPemfG1nUPrl0vgXDpgKerVrGmSR
 I6YolNg6i1wXxUD6NaQSw/T7VOMhD
X-Received: by 2002:a0c:fb06:: with SMTP id c6mr5062590qvp.122.1583967762536; 
 Wed, 11 Mar 2020 16:02:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvS/go2gmlbv8VHFqdnlZeBdO239g7k/V8qddp+HdRMjPSgdahO9YGEzt44xW+XIjVC7ERSmQ==
X-Received: by 2002:a0c:fb06:: with SMTP id c6mr5062573qvp.122.1583967762308; 
 Wed, 11 Mar 2020 16:02:42 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
 by smtp.gmail.com with ESMTPSA id x51sm5490005qtj.82.2020.03.11.16.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 16:02:41 -0700 (PDT)
Message-ID: <59bce0ac12d70810880f77d276571dc5d686a9f8.camel@redhat.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
From: Adam Jackson <ajax@redhat.com>
To: Jason Ekstrand <jason@jlekstrand.net>, ML mesa-dev
 <mesa-dev@lists.freedesktop.org>, Discussion of the development of and with
 GStreamer <gstreamer-devel@lists.freedesktop.org>, "wayland-devel @ lists .
 freedesktop . org" <wayland-devel@lists.freedesktop.org>, xorg-devel
 <xorg-devel@lists.x.org>,  Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Bas
 Nieuwenhuizen <bas@basnieuwenhuizen.nl>,  Daniel Stone
 <daniel@fooishbar.org>
Date: Wed, 11 Mar 2020 19:02:37 -0400
In-Reply-To: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-03-11 at 12:31 -0500, Jason Ekstrand wrote:

>  - X11: With present, it has these "explicit" fence objects but
> they're always a shmfence which lets the X server and client do a
> userspace CPU-side hand-off without going over the socket (and
> round-tripping through the kernel).  However, the only thing that
> fence does is order the OpenGL API calls in the client and server and
> the real synchronization is still implicit.

I'm pretty sure "the only thing that fence does" is an implementation
detail. PresentPixmap blocks until the wait-fence signals, but when and
how it signals are properties of the fence itself. You could have drm
give the client back a fence fd, pass that to xserver to create a fence
object, and name that in the PresentPixmap request, and then drm can do
whatever it wants to signal the fence.

> From my perspective, as a Vulkan driver developer, I have to deal with
> the fact that Vulkan is an explicit sync API but Wayland and X11
> aren't.

I'm quite sure we can give you an explicit-sync X11 API. I think you
may already have one.

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
