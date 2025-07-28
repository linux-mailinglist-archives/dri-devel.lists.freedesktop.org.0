Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145A6B148EA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 09:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E414E10E5D5;
	Tue, 29 Jul 2025 07:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kowalczyk-ws.20230601.gappssmtp.com header.i=@kowalczyk-ws.20230601.gappssmtp.com header.b="t5rj+hrs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427A110E1C7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 21:59:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-60789b450ceso9097440a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kowalczyk-ws.20230601.gappssmtp.com; s=20230601; t=1753739974; x=1754344774;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFQq9BS1AZDnONWjFjq6WhnDJjmdicQEDZuU+ciJV44=;
 b=t5rj+hrsUMnPvnauR9O3fMeOhGrrqyD4NyHCqTO+W4r8P8n7ioeUXDcQcjNpgMs7Qd
 MM62nJggfcTHCYTVol7odo1c9/TIp7GHgPbuLhJaVI68qhe3PCB6P3fZq0/mMVSQJlKe
 DfRGTXSOLBz0mGxS3HW3Sdnsv+T2HdweyMvRM+Rb7siGEPmq164wovO34Uip+OgfsCU5
 LEn+BGv2mO4zz5O3XfZON6IxQ4gQkOAj5yKOV4ZUdxnY0vAvZvbWXrW0qhPxfj+lQw3b
 V86RgdeCPFwKiOs39yi2DGLGvc1OhTLdVbaogTVlnLVY0GQNPCK2TQRyPvtzDdUCRL3B
 8mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753739975; x=1754344775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZFQq9BS1AZDnONWjFjq6WhnDJjmdicQEDZuU+ciJV44=;
 b=JciqVzm6jnChNTZFpJlO0m3vpBXJeR+loAl/VuVn0G6erYiW/4fUlA1tMeKYmo/xCE
 XnqozigDn182P4XBiiyAf7o5OSGBHYjzUjX+Hc+D/ogvLjGJpGk9Qv+oleWY+YPdpDIM
 8O9a1avzSJn5H8xPa3PQrzCttCKSGyUOQgSZ+3aG4JB7g7P2G21oxWqX53u7FlyPwfWH
 u39jtx0XuwzcPdG3GFXH7cRQbHXpi8MKz4Jd6BHNkIKA46F73rrTehennBlVXdziHDWv
 flAcmWlChEUyOUWv/yVEZ/mShbjHgUL+28WkXCHdAgdj/cjAI0fIvLtkdMqm9Y+DOhEC
 oosw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy7El0mUNQ1OS4iEeE9q7PIL0n5VcNloCRLB1eV9Ol5fX8Cd0OL0V5enLwltOMh1dmQdcnEGTe2zc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlW/JtByyws4r9eXm57Qwrf7uAb2T0lKMDsTKumsH5gIN8/SqG
 VjSwVn005lEDF+CC/RENmPz60m9pxEpXv8W9NK3FLm5c68kLMYAfcKqcQ+tgRNhCQ09DrL6KACZ
 jkV1P0S78hPv4aBhHRmN8Qa7PhKkWsVp0NnpbB6CH
X-Gm-Gg: ASbGnctDJOQJY/NMQznqn1DPvjwBgP5BlpMgUxnEciKI41+ltBCQy1T4xfY0LDwXL9u
 IG+UwASxY8ViG6Bpx9k7GyGoRhdQEewzqSUayNVHxO2NPzaJ2/iPx3ejZPzIar+Wx7kD0Sbl38g
 m5+Jtz89LRy5PeanuXAILFff19ZHaOhTFBcYg0s8pjNLXNVQUOagvxMtTyVwthi0cRq1dGVDIC4
 9zi
X-Google-Smtp-Source: AGHT+IEceYjA6cxsSRdCMNyewOG3XPoHrKBCUR9gGBeKUYS35hxGkLKlNk7w2IS6opzkPla6j9Fi8GgCrh0dEXg1zB0=
X-Received: by 2002:a05:6402:4602:20b0:615:539b:7adc with SMTP id
 4fb4d7f45d1cf-615539b93d1mr2691395a12.27.1753739974395; Mon, 28 Jul 2025
 14:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
 <20250728144424.208d58d5a95057ee7081ccd8@linux-foundation.org>
In-Reply-To: <20250728144424.208d58d5a95057ee7081ccd8@linux-foundation.org>
From: Patryk Kowalczyk <patryk@kowalczyk.ws>
Date: Mon, 28 Jul 2025 23:59:22 +0200
X-Gm-Features: Ac12FXwwsiS4JI_-ICJdYNU4HPVvMiegzl4Qe4w16nBmZCl8pKBLj0t9-vRLQHg
Message-ID: <CAJCW39+AS5poKu3A4Y88pH2y6CWbE0WnGZfe3kL99W3sJZjreA@mail.gmail.com>
Subject: Re: [PATCH] mm: shmem: fix the shmem large folio allocation for the
 i915 driver
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, hughd@google.com, 
 ville.syrjala@linux.intel.com, david@redhat.com, willy@infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, 
 christian.koenig@amd.com, ray.huang@amd.com, matthew.auld@intel.com, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: multipart/alternative; boundary="00000000000033d963063b0468cf"
X-Mailman-Approved-At: Tue, 29 Jul 2025 07:08:13 +0000
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

--00000000000033d963063b0468cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
In my tests, the performance drop ranges from a few percent up to 13% in
Unigine Superposition
under heavy memory usage on the CPU Core Ultra 155H with the Xe 128 EU GPU.
Other users have reported performance impact up to 30% on certain workloads=
.
Please find more  in the regressions reports:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14645
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13845

I believe the change should be backported to all active kernel branches
after version 6.12.

best regards,
Patryk


pon., 28 lip 2025 o 23:44 Andrew Morton <akpm@linux-foundation.org>
napisa=C5=82(a):

> On Mon, 28 Jul 2025 16:03:53 +0800 Baolin Wang <
> baolin.wang@linux.alibaba.com> wrote:
>
> > After commit acd7ccb284b8 ("mm: shmem: add large folio support for
> tmpfs"),
> > we extend the 'huge=3D' option to allow any sized large folios for tmpf=
s,
> > which means tmpfs will allow getting a highest order hint based on the
> size
> > of write() and fallocate() paths, and then will try each allowable larg=
e
> order.
> >
> > However, when the i915 driver allocates shmem memory, it doesn't provid=
e
> hint
> > information about the size of the large folio to be allocated, resultin=
g
> in
> > the inability to allocate PMD-sized shmem, which in turn affects GPU
> performance.
> >
> > To fix this issue, add the 'end' information for shmem_read_folio_gfp()
> to help
> > allocate PMD-sized large folios. Additionally, use the maximum
> allocation chunk
> > (via mapping_max_folio_size()) to determine the size of the large folio=
s
> to
> > allocate in the i915 driver.
>
> What is the magnitude of the performance change?
>
> > Fixes: acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs")
> > Reported-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
> > Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Tested-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
>
> This isn't a regression fix, is it?  acd7ccb284b8 adds a new feature
> and we have now found a flaw in it.
>
> Still, we could bend the rules a little bit and backport this, depends
> on how significant the runtime effect is.
>

--00000000000033d963063b0468cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,=C2=A0</div><div>In my tests, the performance drop=
 ranges from a few percent up to 13% in Unigine Superposition</div><div>und=
er heavy memory usage on the CPU Core Ultra 155H with the Xe 128 EU GPU.=C2=
=A0</div><div>Other users have reported performance impact up to 30% on cer=
tain workloads.</div><div>Please find more=C2=A0 in the regressions reports=
:</div><div><a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14645">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14645</a=
></div><div><a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13845">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13845</a=
><br><br></div><div>I believe the change should be backported to all active=
 kernel branches after version 6.12.</div><div><br></div><div>best regards,=
</div><div>Patryk</div><div><br></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">pon., 28 lip 2025 o 2=
3:44=C2=A0Andrew Morton &lt;<a href=3D"mailto:akpm@linux-foundation.org">ak=
pm@linux-foundation.org</a>&gt; napisa=C5=82(a):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, 28 Jul 2025 16:03:53 +0800 Baolin =
Wang &lt;<a href=3D"mailto:baolin.wang@linux.alibaba.com" target=3D"_blank"=
>baolin.wang@linux.alibaba.com</a>&gt; wrote:<br>
<br>
&gt; After commit acd7ccb284b8 (&quot;mm: shmem: add large folio support fo=
r tmpfs&quot;),<br>
&gt; we extend the &#39;huge=3D&#39; option to allow any sized large folios=
 for tmpfs,<br>
&gt; which means tmpfs will allow getting a highest order hint based on the=
 size<br>
&gt; of write() and fallocate() paths, and then will try each allowable lar=
ge order.<br>
&gt; <br>
&gt; However, when the i915 driver allocates shmem memory, it doesn&#39;t p=
rovide hint<br>
&gt; information about the size of the large folio to be allocated, resulti=
ng in<br>
&gt; the inability to allocate PMD-sized shmem, which in turn affects GPU p=
erformance.<br>
&gt; <br>
&gt; To fix this issue, add the &#39;end&#39; information for shmem_read_fo=
lio_gfp()=C2=A0 to help<br>
&gt; allocate PMD-sized large folios. Additionally, use the maximum allocat=
ion chunk<br>
&gt; (via mapping_max_folio_size()) to determine the size of the large foli=
os to<br>
&gt; allocate in the i915 driver.<br>
<br>
What is the magnitude of the performance change?<br>
<br>
&gt; Fixes: acd7ccb284b8 (&quot;mm: shmem: add large folio support for tmpf=
s&quot;)<br>
&gt; Reported-by: Patryk Kowalczyk &lt;<a href=3D"mailto:patryk@kowalczyk.w=
s" target=3D"_blank">patryk@kowalczyk.ws</a>&gt;<br>
&gt; Reported-by: Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrja=
la@linux.intel.com" target=3D"_blank">ville.syrjala@linux.intel.com</a>&gt;=
<br>
&gt; Tested-by: Patryk Kowalczyk &lt;<a href=3D"mailto:patryk@kowalczyk.ws"=
 target=3D"_blank">patryk@kowalczyk.ws</a>&gt;<br>
<br>
This isn&#39;t a regression fix, is it?=C2=A0 acd7ccb284b8 adds a new featu=
re<br>
and we have now found a flaw in it.<br>
<br>
Still, we could bend the rules a little bit and backport this, depends<br>
on how significant the runtime effect is.<br>
</blockquote></div></div>

--00000000000033d963063b0468cf--
