Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDsFGKOyg2k0tAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 21:57:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04817EC9C0
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 21:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F1510E378;
	Wed,  4 Feb 2026 20:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UWCPp2kI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E6410E378
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770238619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNUd9rPG1BceWdGBHYZ2EDlIZvEOeylw+slLK97uJB4=;
 b=UWCPp2kIFizgz63JRAilYw0WgBBEWnpCRjWxWDKYQ7TsDHDZ8BdlLXZAJ6fltVKX/unq3G
 2rgf/81N9Tf87LZrjytVzgw2bJzbOTPfeKhPpYPTfz2tbYUhuVUyOdg42pHRoOe5nLvqKO
 ZVdESm1NXkIwfLrbYPSowhV/bmWp5eA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-CTl9lmFiPdKvjy_Z-_s7JA-1; Wed, 04 Feb 2026 15:56:57 -0500
X-MC-Unique: CTl9lmFiPdKvjy_Z-_s7JA-1
X-Mimecast-MFC-AGG-ID: CTl9lmFiPdKvjy_Z-_s7JA_1770238616
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70fadd9a3so57813985a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 12:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770238616; x=1770843416;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxG8OYua1gClXTSBhwuZi6jzgFrYOt/LM5ChTM0bqUk=;
 b=nAMcxDHvZD0xecXM8G8tyVA5i1sZeO+Wv3uN9p4+KvPSaU79g/Z+bL8Bcz+ceXEmJY
 ct2O0BumOr7ehPdIo8EdOD8iLIZE4Fu7/7XIAM9RuPGkoXwPYhmWcU3FQNpgcKkaLq5b
 yn2LWwuzACA9aqZbVJru8b4hIWoDcil8bi2nPGcgSMIoBTsTpH500mkZSkklOXm9IJ2j
 QstuaeSiVreNW2taDPsxBvbKMu1C+b4A5N0ef7FTFS6R61Z5b+VxMhdT9bhDpT8WTTCr
 8B9M4BMnUAvnB4WYRMPgloLNI6Df/eLu+GK98lJ+9zOc+lPLoOt+ObNzihI5I391qRsl
 RD8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEvLRb1NWPntwPrJSO73lkSOmfT65B7uX4z0pgRO/MqsdSqk9xM6MGOPgQ3S7VRcWMKA5ihLz3KSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr7LIHoUC5Jqz31XR8MAxSo0gCd2Z8+CPixzSWa2oje7G41O45
 d5MWvCCFbc01B9IbeTkt25CstK+3qsmSVK6ENWYsGp86JnNAPe+SwT685D6uOXSpZfK615YaC++
 ExWxVUSFfpJ1UA2olXzD6nlggbhM/r8nmlR6XVAUQxvDzTvF41lZhW9h5bBQDNPxiC6O/sg==
X-Gm-Gg: AZuq6aIVbuJ1CR7/sC+JGHEqPwK12vgzzGDPkjNq3j9JfEfO+YZT+pRJP0CgPPs/rDA
 rPz1e6CITxjvGXgPEtk3ih7gtb2+KrRxy8js9cbvH/uxt7jYKKpumj8H2ND5QAi+Ep/7k7hNDpV
 ofTtqk3KToc/CzB3UoXTCyFCGlGHkhDbbyLdJGlqzVW3iwuQJwtqyTBSXRxP17U5SpJnucOrqof
 Fo8vG/b+e7JxnXNmkhZd9CXGdkhPJHNNTy/PNScGAOqZSadBsLyqDMI3KvyLHMKsz9mC7VF5jdH
 SsBC2Naf/tZxLeMfxYGe5OBeCwCS79n0dLZc2a3VR4a3BX+lUKDJ79N40yE5t/5bSQbFNQhqhgW
 6qpbxIw==
X-Received: by 2002:a05:620a:4483:b0:8ca:1107:1215 with SMTP id
 af79cd13be357-8ca2f80c345mr484847085a.9.1770238616257; 
 Wed, 04 Feb 2026 12:56:56 -0800 (PST)
X-Received: by 2002:a05:620a:4483:b0:8ca:1107:1215 with SMTP id
 af79cd13be357-8ca2f80c345mr484843885a.9.1770238615795; 
 Wed, 04 Feb 2026 12:56:55 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89521c00173sm27081576d6.12.2026.02.04.12.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 12:56:55 -0800 (PST)
Message-ID: <f4504b830225a8fdb7407572d92b65daf390ac8a.camel@redhat.com>
Subject: Re: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno
 Lossin	 <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Date: Wed, 04 Feb 2026 15:56:54 -0500
In-Reply-To: <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-3-lyude@redhat.com>
 <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2A303x4ytOaAB99eM09inpLvwotWcPBhewTdLIx3USo_1770238616
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:ojeda@kernel.org,m:simona@ffwll.ch,m:aliceryhl@google.com,m:shankari.ak0208@gmail.com,m:airlied@gmail.com,m:lossin@kernel.org,m:lina+kernel@asahilina.net,m:shankariak0208@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 04817EC9C0
X-Rspamd-Action: no action

On Wed, 2026-02-04 at 15:28 -0300, Daniel Almeida wrote:
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data_is_init: AtomicBool,
>=20
> What about this?
>=20
> =09/**
> =09 * @registered:
> =09 *
> =09 * Internally used by drm_dev_register() and
> drm_connector_register().
> =09 */
> =09bool registered;
>=20
> Can=E2=80=99t we use this in lieu of this flag you=E2=80=99ve added?

No we couldn't unfortunately. As I said before: a lot of KMS setup has
to happen prior to registration, and most of those callbacks
(atomic_check, atomic_commit, etc.) can both happen before registration
and after. And that's a lot more difficult to deal with if we don't
have access to the private driver data for any of those callbacks.

So - it really does truly need to be tracked separately.
>=20
> > +

