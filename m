Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AiXxFGUmg2kxigMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:58:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA789E4D2A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630BF10E5D1;
	Wed,  4 Feb 2026 10:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="d6qYuOdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A0710E5D2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 10:58:41 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-59dcdf60427so7874235e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 02:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770202719; cv=none;
 d=google.com; s=arc-20240605;
 b=h/2M99IQS88vg7t/9PX8sWgndydZTwcbjQfJohcbkm0CpLc86DQB3xLOXPu4TSu2Oj
 H9QrZ0TZv1k5h9sXlLbY+8DLmvnOdUv0qFzBA8dvqwjUKt5t7V8ulDFVgQWzYUjE+mc6
 gsHFdix+amIp37J8b6ySQYiy1Mu/j+1rGpUb7w6agcFR/BR6Zs8aeq/7X6rl1QiKfCR1
 tSdT6lwvP+PyctAbXhjxGuXS1Z6CiK2u0njbMkh+8Ue0f31orIn8xcPMdbY6/z0hA1f7
 aIZ3YXqG+27Z08K1gXQ4aOr2nykRyWL88LrRmBpkVR+37TbESJjQETv3dY5KhzP5L0la
 b7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sszrtjm4Wstb9oVfL81UxFkyH4cgSL/Qp4A1V8DvLKM=;
 fh=byG/evrTFI73eSro7qEDP5vhAIEmLIxW/V8S/5DgLYU=;
 b=XNwARZjWSlpqiI6+eCnv2KWwZmfr4qlHA6X8Du0rU4cVBlsnshDdsEJY0BiOwXqL0t
 /itmnS81p0yJcjE1Z8Y26THCu++C5orKR/5GaY8wV/pxdoU8NCpes6z6MNbJFvJWMOlP
 IGVqrFVz284EVfrEmfEvKPQLknJlfQw86YfoPqI+drF44lOzuzCX75pfeWgTTn2fJ7yF
 K465YBYMam1TKeomdd1LSG2Ht8wraDNWW4r7oRoEdivkFxt0xBDamEb3njApDUEkFqam
 dWSaKHhiWGF0wHy0hhi7yruT6Z/LldAVUdKXLk4DLsB3Lcc1aPmQEMVnDfJOUNqV8FoS
 YOrg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770202719; x=1770807519; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sszrtjm4Wstb9oVfL81UxFkyH4cgSL/Qp4A1V8DvLKM=;
 b=d6qYuOdhPtBTM8ZijMrrCAeP8dYrGmMnVzYDhe2Vz5xwGaKnrJVqMncfJdRxYxtGbO
 18GDb52B/wyFlxfjQNhTtVdd2Hg9CK0/ibIkVqV/x8g//tWDgRESBVFd40567NY9ap9i
 KIeAzCfemvCt2d/MqIbwso5EQhoW5HIoFRGG64vJvzR0DI0Hlgrr+HuwcVYg7lSi3JN7
 YdY4wE+50M+IdyqF619d3FAMjfjGC3jksnlY+uEC10/dIeB3FRtJLOKMhrQiUJED2AMo
 R4BfEBrZFDSjFUj+78DcjB+6HWI7IabQHtz0ZFdHs/FEqlruTo5rnnX1fVrWdQngoy0X
 uDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770202719; x=1770807519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sszrtjm4Wstb9oVfL81UxFkyH4cgSL/Qp4A1V8DvLKM=;
 b=w5jbQjMaOa5jMEZtjkc5Ag+j5kGQFwN/P6h2cbFl4szr3DSDub5ZpfrFDbobh7YD8m
 Zk+V14sqrEzlyu3NSIP8eTMz1pPfu1gG8cheYbV50SvF92W0EcF/ouv0EYr0CkesXW77
 EqxZYQXO5YRvOmp3SvCEgTK+l+Q8em2QwlSPV4f0rBi2RKiX2uoSIEt7rSOKs+rgdUAs
 dqVdztwAJC81xmTpg2KKOONoeySE1RMvVx1lq+lPtfWdc50ivepBEJYNNBMkLpyerJRA
 lMhOwvUioT6B5RKQdc4L+bkSNM3zBHF0ffAny9iuWgacoK0MdOT6zVn8aB88JMuoqjqi
 jfmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu4ABRJrJ82k3CH56zoSILsIWHbynoLs8rDJJPeQ22mEs1JofzNW9E/uc3Na9dgIy+NFjK+bjHAbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8xNnhcLasq4EZosYH2LOMASv8iBL2E5J+PxBe5QOFYKy+LHAO
 dARpmnY3ewxlXIttKqGiwOtdW3hikFZBt6+9YpiczVasijZLWlRVxj5jS7bPARFYBWJnTxUj98C
 a+hAihbrC82gAl/qI7HbsxgLyos1xF5jZOh9o7QKB8A==
X-Gm-Gg: AZuq6aKzDU9y8eHNDrw84mxweHXD22+Ty0ET8RThvzUuHrzd7xyhju7WoGpQ33xY0mS
 hbSC42/G5VCRK2u+CMqsR47Foc1OwbbolUMD1JgFd0ugFOiEjwwcbBFqjx14DEKoVsuj6Vu1kgA
 Oz2+OmGc1axLHM12kW6oIVbsHVO/07r6hOzmvxaI/57IC42lRqvI/1Pp98fWnQGkjdr+qRnlx+T
 aqpsr4TGk98VZE6UqFrQALxShiVPjfEqJvuYYncHSMeJpOYd3A1RsegIJNK6ULmzL0lI8Rpb0jw
 waPeEpqknbeqUNtVHJAOpwP0M/ql
X-Received: by 2002:a05:6512:3ba7:b0:598:853e:72f9 with SMTP id
 2adb3069b0e04-59e38c3ad69mr1140326e87.51.1770202719455; Wed, 04 Feb 2026
 02:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20251030162043.292468-1-marco.crivellari@suse.com>
 <CAAofZF5J06=i=WQGR9CajDctBWzdku+qMF0oDaJJtqPxWGhzZQ@mail.gmail.com>
In-Reply-To: <CAAofZF5J06=i=WQGR9CajDctBWzdku+qMF0oDaJJtqPxWGhzZQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 11:58:28 +0100
X-Gm-Features: AZwV_QhpriQnVxszgM7nmrr0N0dOpPrmR3FSlyxMCoPaAVjnGI8VSfA7JEqmHpc
Message-ID: <CAAofZF4bu1iE3HuCkzvzRp5QmV0H_+hsbYeR9UWWUjjxWbf=mw@mail.gmail.com>
Subject: Re: [PATCH 0/3] replace system_unbound_wq and system_wq with the new
 wqs
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.com:email,suse.com:dkim]
X-Rspamd-Queue-Id: AA789E4D2A
X-Rspamd-Action: no action

On Tue, Dec 2, 2025 at 2:21=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> On Thu, Oct 30, 2025 at 5:20=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> > Marco Crivellari (3):
> >   drm/atomic-helper: replace use of system_unbound_wq with system_dfl_w=
q
> >   drm/probe-helper: replace use of system_wq with system_percpu_wq
> >   drm/self_refresh: replace use of system_wq with system_percpu_wq
> >
> >  drivers/gpu/drm/drm_atomic_helper.c       | 6 +++---
> >  drivers/gpu/drm/drm_probe_helper.c        | 2 +-
> >  drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
> >  3 files changed, 5 insertions(+), 5 deletions(-)
>
> Gentle ping.

Hi,

Gentle ping.

Thanks.

--=20

Marco Crivellari

L3 Support Engineer
