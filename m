Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBESF6yUrmnRGQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:36:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47CE2363F2
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294FE10E4B8;
	Mon,  9 Mar 2026 09:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="IdBAm2bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE36210E4BC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:36:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so20053185e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1773048999; x=1773653799; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a51Sey8VDQkf7osB3Kx2bymhC7fw4rtQCaVaDXNwQII=;
 b=IdBAm2bZV4OW4h0OoRxToq9vidLD3Jd8wzF9RgdsafVr+HhyKZBlcz/KLaZY80mvlm
 NSHmG8n3isn4Rm+XHJXELlrUM7M3Z3dUz7DW1kUGMyJeyfxWH8OJKiDFZNOV+ukds9EL
 ATZOD/Ck+ibDYmf5W1hnuRHH9NKTWpTxZO/G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773048999; x=1773653799;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a51Sey8VDQkf7osB3Kx2bymhC7fw4rtQCaVaDXNwQII=;
 b=aSwHZHASdmoJce/CINx2gnoG3ynPE9CCfBoL3Za/g7C87bfFYYYSgYYsCL7hglEEKF
 XEnzMpqXwALMB0d/yyBY5GBP3pIfUgu3q7RDql1P1H1mbiKxMXFdYDJPHfoR1EROZfCT
 hq49wFjkn+zn0/GrroTfJlJuENoZyK6DUd6lvG2uN/3pBSzivjRDH9O0mG0uX2ZF4Vyv
 Px34J2hUEcQl9gDmrHqr53oGOkpnWYcwV9jvhotxIAbN3JLZUXTOrN0tz3zEEp2c91VU
 adJhMYS1yy2T9bUI61ma+Cfax5krN+anfuHHVRBy15FSf7/zdPWGFiVC5JDKhuxVQGpw
 mOVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIPsFTi9py80UW1Da/KJm0zm8fx80q07COcNgbcLXoLGgKeg5l440R9j7SHbwhBNkL1wch3FAW5SU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgenM8pOZySuRezCZTYtH7GbXTzKIc51unR7ZfvKziOKZVHdVj
 Qf6RD1/Ft93bQZ5UcRazBc4hdG++zWrCxP3CGIggRba5yJMqbakuvuQu9/M1rZuDOVs=
X-Gm-Gg: ATEYQzxlB03dvxvyW1V2118YIybo+wc+BQYGxOCrEZVPexeFwakK1qOo5mba/HvoOaS
 zCsmWWhSTTau3YQRA8upYKeLO681H3szQmn8hHSkHCj67jGjk7IOA0aHWh9u+0N38ARCJe2Fzhy
 osj6yCI9qQ043S8xAx+r3SqQdneiNSz4xuunYnriX21ZAx24tpTQCg9N80rCo+m8t8aHgFcGEef
 i97OHFs1SS5R2iN4EUyBx3CAfPHvOsn9v8pAVGWbjS6Go5GWrLVejC8i4UXNc7OxBlxSsfzGDVj
 r5YpKp1n1u0HsC+lsv4sL4vPxj9jXtuGvBRkeiKyptpCdbkB+GW3vWC1IaO86CzQ2qOEXFc/z4X
 ts2xF++COzs8EyBx51shHXeavtXw8UzoNU7dVm9xOmLwtqHY3IF9nc0f+Nqw/kEw284qMLm2LdT
 Wk213f7d4RQWiniAs4btmifZfAE56bCH0thYk=
X-Received: by 2002:a05:600c:4752:b0:483:7783:537b with SMTP id
 5b1f17b1804b1-4852697a593mr181033875e9.24.1773048998726; 
 Mon, 09 Mar 2026 02:36:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9ccsm24331163f8f.19.2026.03.09.02.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 02:36:38 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:36:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/ttm: Don't spam the log on buffer object backing
 store allocation failure
Message-ID: <aa6UpF-PlTLlb8Qv@phenom.ffwll.local>
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
 <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
 <fe4d93d8-5c9c-460b-93e1-5d0d49a316ab@amd.com>
 <4e9ac4fe88f4b8aec161d4edb4b4f66e70554ec8.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e9ac4fe88f4b8aec161d4edb4b4f66e70554ec8.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.18.5+deb14-amd64 
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
X-Rspamd-Queue-Id: C47CE2363F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ffwll.ch:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thomas.hellstrom@linux.intel.com,m:christian.koenig@amd.com,m:intel-xe@lists.freedesktop.org,m:matthew.brost@intel.com,m:matthew.auld@intel.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ffwll.ch];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[simona.vetter@ffwll.ch,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simona.vetter@ffwll.ch,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ffwll.ch:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,ffwll.ch:dkim,ffwll.ch:email,ffwll.ch:url,phenom.ffwll.local:mid]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 10:39:10AM +0100, Thomas Hellström wrote:
> On Mon, 2026-03-02 at 10:02 +0100, Christian König wrote:
> > On 2/27/26 17:00, Thomas Hellström wrote:
> > > If the struct ttm_operation_ctx::gfp_retry_mayfail is true,
> > > buffer object backing store allocation failures are expected to
> > > silently fail with an error code to the caller. But currently an
> > > elaborate warning is printed to the system log.
> > > 
> > > Don't spam the log in this way.
> > 
> > That was intentionally removed or never added because Simona
> > absolutely didn't liked the gfp_retry_mayfail flag at that time.
> > 
> > In general I'm fine with this change since I think we have proved by
> > now that the flag is useful, but that probably need more wider
> > discussion.
> 
> Well for system memory it is a bit questionable to be honest, I think
> mostly because even if we return an error, the OOM killer might be
> invoked on an unrelated allocation immediately afterwards.
> 
> Still, even if the use of gfp_retry_mayfail can be discussed, I'm not
> sure why an error here needs to be printed when there are a number of
> other errors that are not printed or printed only on debug.

Yeah adding the NOWARN makes sense irrespective of the bigger question, so
on that:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

For the mayfail I have honestly no recollection anymore of that, but
making a guess I wasn't a fan because way back it was used to hack around
locking inversions between alloc and reclaim paths. Much more with
dev->struct_mutex drivers before moving to dma_resv for non-ttm drivers
too. And that's not great.

Plus GL userspace did not cope with alloc failures, so punting to the OOM
killer like for everything else made sense. And hence there was really no
use for this. But with vk and other low-level gpu apis that changed, we do
want to just pass ENOMEM to userspace now in many conditions.

I think best would be to add a patch to this series to document when
gfp_retry_mayfail can be used (userspace expects the kernel to pass alloc
failures up the stack) and must not be used (hacking around locking
inversions with reclaim) and then ship this. Might also be a good excuse
to switch the kerneldoc for struct ttm_operation_ctx over to the inline
style so we can be appropriately verbose.

But yeah, going through current users (on a Monday morning without coffee)
I think the flag has solid users by now and there's no fundamental
objections from me.

Cheers, Sima

> 
> Thanks,
> Thomas
> 
> 
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index c0d95559197c..8fa9e09f6ee5 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -726,7 +726,7 @@ static int __ttm_pool_alloc(struct ttm_pool
> > > *pool, struct ttm_tt *tt,
> > >  		gfp_flags |= __GFP_ZERO;
> > >  
> > >  	if (ctx->gfp_retry_mayfail)
> > > -		gfp_flags |= __GFP_RETRY_MAYFAIL;
> > > +		gfp_flags |= __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> > >  
> > >  	if (ttm_pool_uses_dma32(pool))
> > >  		gfp_flags |= GFP_DMA32;

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
