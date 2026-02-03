Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FCDKtlVgmntSQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 21:08:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A1DE5C7
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 21:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731CA10E1CB;
	Tue,  3 Feb 2026 20:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eOnabLxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956C310E1CB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770149331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1gBAXLqnj32wa3OhrXJ3CgCcecMTBEZxnARKaIYHLw=;
 b=eOnabLxeSnIp7pOYqhDcm3geNWJd9qrcFPDR5kw4l63JbjISXE2nhZNDbydzcfdV5EzPqk
 LyxHUpb/6QoPTNSFCFx85hqzojXJ2KLuyWI9eQHR3gH+TBte0phrnHq+YNexug1Z46N5Tf
 2uOkWlWo57NIkmH/HEzQLRdc+3m+w8A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-rYPxiYGcN8uRqPyOUiEB0g-1; Tue, 03 Feb 2026 15:08:50 -0500
X-MC-Unique: rYPxiYGcN8uRqPyOUiEB0g-1
X-Mimecast-MFC-AGG-ID: rYPxiYGcN8uRqPyOUiEB0g_1770149329
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8ca06e38994so821822785a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 12:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770149329; x=1770754129;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K1gBAXLqnj32wa3OhrXJ3CgCcecMTBEZxnARKaIYHLw=;
 b=Oaw4/v5Vl0Khhf8YqblmYAUr45xMxEpWfdul7quIYOzzIMeikMsZOc51cKW4kZOOXy
 /SxFLv228gFzqX/HCzgn9uydEWCbqOrK2RPG/ARsC4CibUMOORbPOjnd1R7gUQp14vL0
 Gn9eqPoiiHiU1gelc+qOTW7UJj4v1hvtjU4Bk3/neExW+KvRq8tevvrbsP9gdBmo7xjL
 X7n4+nlfI/G0+BnbJlXF7pveIM0Ege5AUjrWEyJKOmRxAbVy9ZQXGGbPv2+JkWaoRsAy
 5GFG2nY7gbVQ970PPqyR/PXCNHDgPjQyqLPkr8dg5HDDJqnSA08Nyr4qZZwjyAJ4Te+a
 ED7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrePP/Nga3klAvs3kRTHDB3mVEzFN/PCdkoxq12DF2fmRS7N6spxdpBo1kFIjYBzu6u2IcMbmHlwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6jMvtfxuXFASX9t1Y9pddQGBZwkQ/IyMhL4VAE54Irb7EfYyN
 bGPH33/0jziWdJ99yy90LVW/SnPXo2VOG18E80Lo1FRcMLoBi3YBB+KUkPmucqLkVip/JL88rgn
 Tcf7YoNM8UtkSdbmUJ5TUdedeA5S9Fd/yQq6+OLd+ZeZdpul1pUv9Gdp38WcLfQFKr+hTfg==
X-Gm-Gg: AZuq6aI8mBduPkpH2X8eiZ1hIA8feEi1QthLa+dsF9+HaN2o1z3F4eMF87t4K7b2xij
 krcJkaxQA60VggAvcdrtsMiwYUfuOFBUxibR9+ojPr1/dtAQaqIZiBDk9h3J5krdfrT7PkwPsG1
 AZtTGlIxEpdiMeAKYWAo3tzK/mI2DSaroRRiRrP0yzbpO1t1XM1e8kKAbS5dLHAZbJPOXqr3HW2
 ChZDrOflKcCf3i4WQlF/YxYJ2nOQ5oqVeNAO2+pvt5srNZy/pufTMCoWhKtDtdzLSlfBv6wgnQw
 mO0Cin5X+9JjKEIfxI2zYyr07HvfCc+QOuSJCeQ7sYZicXMS1hhWj6d8fzYQBDKjXfUG87URutz
 IMNIWhg==
X-Received: by 2002:a05:620a:1a85:b0:8ca:2baa:770 with SMTP id
 af79cd13be357-8ca2f8457dfmr98284885a.21.1770149329537; 
 Tue, 03 Feb 2026 12:08:49 -0800 (PST)
X-Received: by 2002:a05:620a:1a85:b0:8ca:2baa:770 with SMTP id
 af79cd13be357-8ca2f8457dfmr98282485a.21.1770149329060; 
 Tue, 03 Feb 2026 12:08:49 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ca2fd41118sm38238085a.36.2026.02.03.12.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 12:08:48 -0800 (PST)
Message-ID: <b805ed6d234c0c154b8f824c4c900e1c41736f7b.camel@redhat.com>
Subject: Re: nouveau : fix r570 suspend/resume regression
From: lyude@redhat.com
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Date: Tue, 03 Feb 2026 15:08:47 -0500
In-Reply-To: <20260203052431.2219998-1-airlied@gmail.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z_hWc6OVaGUnudmeGBwcfczDLyNGUrEx470cfUR4eok_1770149329
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 079A1DE5C7
X-Rspamd-Action: no action

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>
Tested-by: Lyude Paul <lyude@redhat.com>

My power bill thanks you :)

On Tue, 2026-02-03 at 15:21 +1000, Dave Airlie wrote:
> Since R570 firmware got enabled, a number of GPUs have not being
> successfully suspend/resuming. Lyude showed it on RTX6000, which
> I reproduced and wasted a lot of time down various rabbit holes.
>=20
> There are two required fixes, the first one adds proper sequence
> numbers to the rpc messages, which fixes a bunch of NOCAT asserts.
>=20
> Then we have to pass the runtime vs non-runtime state down to the
> GSP fbsr code. This however requires replacing a bool with an enum
> which refactors quite a bunch of interfaces unfortunately, but it
> was the cleanest way to do it.
>=20
> The final patch hooks up the interface so normal suspend doesn't
> set the GCOFF flags.
>=20
> Dave.

