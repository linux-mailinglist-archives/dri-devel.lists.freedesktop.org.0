Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TdxUI8adp2n0igAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:49:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB081FA083
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4677510E931;
	Wed,  4 Mar 2026 02:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3r/wx9FS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D66C10E930
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 02:49:39 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2adef9d486bso57001085ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 18:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772592578; x=1773197378;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=;
 b=3r/wx9FSARarks8w7Znu5v8G/BsZ4L/2OmdEY/pO/TRpjb6kPzBdpOCbJSSUJzRzuQ
 4JBoCndAMo26C667UEqzb/4tEtZx+dlMJijUTHQ5MozepYqEQ/eWh3x8YO+Myc3BVyLz
 8/Fda90Btj6fxtp+rH5vUR9YWYabqxaZtCKIC1A8lwEAldBrACCgBkz3O7eVyWYYr6uz
 2OTQye2t0yho1SvKdcZk3/m2Bp9NMtzkJaqEDzIAlup+6PyCz4LdiFOyGbaRFW3nTTfe
 Dl82cjJyXbr9NPobi+YT9x7HHsOaPgRg2A2b0PQdHjbiuvgSJNLo2NYgBEPW0p7hecgt
 nMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772592578; x=1773197378;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wlfxAiLCYE9X+ss6Nds/jzCWOjzdQvgrRAY6r5Hx7j0=;
 b=FWS8uSqVsRZOx+dlnM8JJBW9x6qZLuPr2Fr2WvQtaYOBZQDNNeit0PvT+5wGQTNH/e
 mOTA4lo/NPXcPAU9CyP1LN1h6PMPHTeIMJfLFyQG70lQNFUGzeL0BAiaEOgoeo208u4E
 TnbSljvDyC4fwJNK75NUmh/XFcXRZBkiAXTXTTEFQp6D78BRmd54jpiDDJTzUeDI/s2a
 oFcXXWaEpJNrQYikBKo1thCvl14Vf6nTy/W0aWQeln/tFFQbib8evQcrKUfNaB0KqS6+
 CS0NCS12JZdx9KBpWVL8geZbcy9DRgPy3i8ZTF6kuHGK7m8qVn7Zwnw3GttgKpp515kL
 kodg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRJS7gXl3wRVre0ZlznblgKjkRtO2OvSgZm8s8/0r6RsajS+n55xHrW2WYWYEi7Vn5IaiRSFaFsVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAVJt1nitBeWiUwaxEwQnHMzPsbdd7gg13DjueZVpHTlGeS1rO
 iKpfTibngVHrKCokcC71Q7cKVjrE65iMDfm8dW0hEiPP8Vl9267CqOZgoKCobAOk+rknlL/8vkn
 IpNy+8g==
X-Received: from plzv9.prod.google.com ([2002:a17:902:b7c9:b0:2ae:6338:73ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2446:b0:2ae:483f:b239
 with SMTP id d9443c01a7336-2ae6aaf9469mr6114485ad.30.1772592577810; Tue, 03
 Mar 2026 18:49:37 -0800 (PST)
Date: Tue, 3 Mar 2026 18:49:36 -0800
In-Reply-To: <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Mime-Version: 1.0
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
 <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Message-ID: <aaedwFwXh9QXS3Ju@google.com>
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
From: Sean Christopherson <seanjc@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "Theodore Ts'o" <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Carlos Maiolino <cem@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Chao Yu <chao@kernel.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Dominique Martinet <asmadeus@codewreck.org>, 
 Dongsheng Yang <dongsheng.yang@linux.dev>, Eric Dumazet <edumazet@google.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, 
 Linus Walleij <linusw@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Brown <broonie@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>, 
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, 
 Zheng Gu <cengku@gmail.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-block@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dm-devel@lists.linux.dev, netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-nfs@vger.kernel.org, linux-crypto@vger.kernel.org, linux-mm@kvack.org, 
 linux-perf-users@vger.kernel.org, v9fs@lists.linux.dev, 
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
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
X-Rspamd-Queue-Id: 2BB081FA083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:kuba@kernel.org,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:davem@davemloft.net,m:mst@redhat.com,m:tytso@mit.edu,m:aou@eecs.berkeley.edu,m:alexanderduyck@fb.com,m:agordeev@linux.ibm.com,m:viro@zeniv.linux.org.uk,m:wintera@linux.ibm.com,m:adilger.kernel@dilger.ca,m:andrew+netdev@lunn.ch,m:anna@kernel.org,m:anton.yakovlev@opensynergy.com,m:acme@kernel.org,m:aswin@linux.ibm.com,m:bp@alien8.de,m:cem@kernel.org,m:catalin.marinas@arm.com,m:chao@kernel.org,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:imbrenda@linux.ibm.com,m:dave.hansen@linux.intel.com,m:airlied@gmail.com,m:asmadeus@codewreck.org,m:dongsheng.yang@linux.dev,m:edumazet@google.com,m:ericvh@kernel.org,m:hca@linux.ibm.com,m:herbert@gondor.apana.org.au,m:mingo@redhat.com,m:jaegeuk@kernel.org,m:jani.nikula@linux.intel.com,m:frankja@linux.ibm.com,m:perex@perex.cz,m:joonas.lahtinen@linux.intel.com,m:lucho@ionkov.net,m:linusw@kernel.org,m:maddy@linux.ibm.com,m:broonie@kernel.or
 g,m:mpe@ellerman.id.au,m:miklos@szeredi.hu,m:namhyung@kernel.org,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pbonzini@redhat.com,m:pjw@kernel.org,m:peterz@infradead.org,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:tiwai@suse.com,m:tglx@kernel.org,m:trondmy@kernel.org,m:tursulin@ursulin.net,m:gor@linux.ibm.com,m:will@kernel.org,m:yury.norov@gmail.com,m:cengku@gmail.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-block@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dm-devel@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-mm@kvack.org,m:linux-perf-users@vger.kernel.org,m:v9fs@lists.linux.dev,m:virtualiz
 ation@lists.linux.dev,m:linux-sound@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,linux-foundation.org,davemloft.net,redhat.com,mit.edu,eecs.berkeley.edu,fb.com,linux.ibm.com,zeniv.linux.org.uk,dilger.ca,lunn.ch,opensynergy.com,alien8.de,arm.com,linux.intel.com,gmail.com,codewreck.org,linux.dev,google.com,gondor.apana.org.au,perex.cz,ionkov.net,ellerman.id.au,szeredi.hu,dabbelt.com,infradead.org,intel.com,ffwll.ch,suse.com,ursulin.net,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.sourceforge.net,kvack.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[85];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026, Jens Axboe wrote:
> On 3/3/26 7:28 PM, Jakub Kicinski wrote:
> > On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
> >> The net/9p networking driver has a handy macro to calculate the
> >> amount of bytes from a given pointer to the end of page. Move it
> >> to core/mm, and apply tree-wide. No functional changes intended.
> >>
> >> This series was originally introduced as a single patch #07/12 in:
> >>
> >> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
> >>
> >> Split it for better granularity and submit separately.
> > 
> > I don't get what the motivation is here. Another helper developers
> > and readers of the code will need to know about just to replace 
> > obvious and easy to comprehend math.
> 
> I fully agree, I had the same thought reading this.

+1 from KVM-land.
