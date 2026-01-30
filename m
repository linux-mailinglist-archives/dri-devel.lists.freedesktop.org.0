Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IASC2OMfGnyNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:48:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D9B9834
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2509B10E99B;
	Fri, 30 Jan 2026 10:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UzeRJfBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC99010E99B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 10:47:58 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-8947ddce09fso15860406d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769770078; cv=none;
 d=google.com; s=arc-20240605;
 b=WfrJATTaWAV26JVg9QPqCiboQVLe5EBnCOLsQx+xtpFZAdHmkLA308786uCMmcR3N1
 p+DFE0j5HAmls4MfEibjYGNkh1vIBd1vIa/Z/oC/lCKu2cBhVy5nR9zQdPP/fABljQjg
 5I9JCESxZ0e91ek/OMFoWdMYw8RtrV/Na0KFvOJpjyUa5f9sBudI2UHRAG1aQBLEgbdT
 vd+QOjE5ZDehwiM0NvmovyxI9KQDX+F5Cq9Ude1T/jqSxA/ivrzyoMg9KRhhvFCOiaTj
 s0lVeYo5aRfCjuE/5uvMOhl+OhkCPva0t4GF8b4Fr7C4xW30nd2HJuulxdADfmHV9WNb
 CI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BU1TLiyM4pSOOCbNwWx+ktn77BIiSxV11z6iEfmhsbA=;
 fh=LYpSJpw3anLEa1OhLTX2+9KWwCIAyD9B3K9wgrr37sQ=;
 b=X0vGxXllr/8TdNMukN1X9tJ2IEcct7ZFF9La8fksiF8d/fLSmAXTBDMz002m9fH1od
 JXlTYr1jn+dnbIAkqFHpDAY7s7JVFMhGcVGZ1gGnSD/C/J09fSq93VIAAqTqu4IQoBG/
 8YB296o8D9VXPetZbcqW1AoBPOFo2k+HD45vevLahTdnMlmUEnopnioAJLbF/k54AuoE
 gVu3sb6WW32vaqvZZEZ8y4pg9zGEVxDerhp1Rx+bn5hTqU7thd2earFg8XpilLseWBRO
 MTUjERX6FRkfCW1DVnfFdMVJV1+4Ab2JTKeWs/T2eX+S7ySiMglQlNKb6hfajxxnnJKa
 kU7Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769770078; x=1770374878; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BU1TLiyM4pSOOCbNwWx+ktn77BIiSxV11z6iEfmhsbA=;
 b=UzeRJfBD7Zb17j2tj2nJEL5E5a3S7qsQYQnsici8IdKyRtPWnAQjG5BXwINQ+QHb31
 SCocXAetlK/P94l/H4XC1OF+EmjMlEp/oxZ+zcSvp56gpicEMJOylJhOxi546vtIqxg4
 O/HZfe0g2u6fWVpPf9UDG5PRayZrArK3gnZBQarSG4F5RpROyyxoi6cYd5nAJ4qF/Pvr
 /oXu4YadEzL88LNYJTcis2gUE1eoWOg43tJ9pQlB8Zs9jgeoij45wVS77uJ8e+45uPDX
 aotUpuKlFYAPcJgiU7Ai3wjPfk1uECVArY+vlM5pZw4/gWQGT6Cm7n8Oo6oFIIOlIY7y
 i7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769770078; x=1770374878;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BU1TLiyM4pSOOCbNwWx+ktn77BIiSxV11z6iEfmhsbA=;
 b=k+gMkmFCCwUmP2zbNRX25M5KtV1InQ4qCXSOkyclEwChnFKnm3eMMGXVtZlSBCVSRM
 1KcFIUd2f8dbCNn1LHNhxID6g8HOO70xnsjVBsjzt9eSq1LkEfwb54RzG4VGbbpx61EN
 vY62o5bj00wzpCBLV5ZSSVG+hWGDeKCgibAUL0jZBGq73EALu0n+sDL8qG1reV99FVUx
 t5ad2s7+ZTBCsTNP/yS72sdzjPnOke6GVpLf0psOBP+GPQYaUBy4nNp+5o++4Ni+quWp
 yRMsvIOTNhjzhJm+BVDUWQB2WINnP0QiCcQMHfmkeODNeO4z9aDNs40zif12e7H5BWk0
 64Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzveZvHFRk+OLJ3pqNBrDDw3k+Jmo59MxiaVb5IxQsydEodyXko91sEK4WxpiuTBwT11co4oZdrN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeammJY4wDh9ND14uNGvPTxjJKDJyTpsyet3HTCDkUGrO5hUZ+
 Ww0H0NVyj2G9shqD0i6RHFwzN7EZ4I3Ynz6tqY9DB00u7EVRvVCx4+eB5ptbBaNC4vkKVRj8mfe
 Ag8q7rAyo9Y+iCUKe1612+z6IPZh0Ol/kpQ==
X-Gm-Gg: AZuq6aIpu2tuasJAJa2mFP9wajd6rodc+8vcZqob/9Kl1WWZCg090/nWDg7BgaGJyiG
 gf4RAB8cptq+yL0ZgMixmMP3a5s9DTqxYzJ/g66r3VgeucMVlsvuCJ6yNLkmZGn3GamSfn4GkXZ
 vddXTdj+Jvtva2xv3cB1QmS2rmDpZvMGS8+fl08ZhRuEvUMsv43DM0LwpanarTgoLNM2sm9FfUU
 PY+tBTJo6+jppqkXooAxnX7vns8lleIcbinL17X7RndJLz4LCWLGvjjvOzBVKpLe3TNang52rEu
 AjabL5gpoarf3GZVQSBgzgqjvh6lJ5HQwf/lE8DmV4802awJu2tJmOo=
X-Received: by 2002:a05:6214:20ea:b0:88a:277d:10c with SMTP id
 6a1803df08f44-894e9f8874dmr32317756d6.26.1769770077681; Fri, 30 Jan 2026
 02:47:57 -0800 (PST)
MIME-Version: 1.0
References: <87ldhf1prw.fsf@jogness.linutronix.de>
 <87h5s34d36.fsf@jogness.linutronix.de>
In-Reply-To: <87h5s34d36.fsf@jogness.linutronix.de>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 30 Jan 2026 20:47:46 +1000
X-Gm-Features: AZwV_QimU45fHN7_4cEw9UXdD7YCfSc3kfEPiFQwR4lIsamoUkrGrJvX3Dgzpzc
Message-ID: <CAPM=9tyzBxS69GtwzfaudZBM9SsuZ+ENGJJbT_mXG2qxFkaK4A@mail.gmail.com>
Subject: Re: nouveau regression with 6.19.0-rc7
To: John Ogness <john.ogness@linutronix.de>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@chromium.org>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:john.ogness@linutronix.de,m:lyude@redhat.com,m:dakr@kernel.org,m:hamohammed.sa@gmail.com,m:seanpaul@chromium.org,m:simona@ffwll.ch,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:hamohammedsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,chromium.org,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7C6D9B9834
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 at 20:19, John Ogness <john.ogness@linutronix.de> wrote:
>
> On 2026-01-30, John Ogness <john.ogness@linutronix.de> wrote:
> > On my workstation I have been using 6.19.0-rc4 with no problems. This
> > morning I switched to 6.19.0-rc7 and now my graphics explodes when the
> > nouveau module is loaded.
>
> Reverting commit 604826acb3f5 ("drm/nouveau/disp: Set
> drm_mode_config_funcs.atomic_(check|commit)") allows the nouveau driver
> to load and work again.
>
> Even though nouveau "technically supports atomic modesetting", it seems
> more callbacks need to be implemented than just atomic_(check|commit).
>
> Should I submit a patch with the revert? Or is there a quick fix to
> allow drm_drv_uses_atomic_modeset() to return true and properly support
> atomic modesetting?

Please submit the revert patch at this point and we can work out the
proper fix later.

Dave.

>
> John Ogness
