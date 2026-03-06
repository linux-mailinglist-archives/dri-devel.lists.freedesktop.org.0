Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOGPKIKNqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:17:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC621CF42
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E5010E3B2;
	Fri,  6 Mar 2026 08:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="M2FQPb6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6555910E3B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:17:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a12fbbd9d2so1727354e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 00:17:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772785022; cv=none;
 d=google.com; s=arc-20240605;
 b=NkbnOdsjZ/CjY6SUGaIgcXQ9wn4rNLvhJYBDCHtKFAHbRT1bxJvLgS9WZiZXj4mI+z
 iyDJNUMAOKLPTbEVdgp3pCChBUd1obPu05ABtM4KJoHP77LvZzgROac87Otcxb65wKpR
 atgIva4F1OZk2gUdEQz78yPKgH2rd+a4HJ39M7t6Q1T+8Y9NK+GNMCiEhcjec632+fMM
 Oit+sMqTCM4Fh/Ex+81xDfuuUT1LI6y6xD+pjJXbFrNjVT31PQ0BBUFB0quWxfwYGSzO
 fnih7uPK1vllFF9DEGEAQ614ZW6MkLXCmmBhpNgTNcy9nEzjnZpcUfXUFczv1vCYsCN4
 3VnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tJWs/FbEIWevZkUvI5Q1ViEvsAR2C8mtBFok4ydC8DA=;
 fh=HNPDgqsgJw0XJ018fy0QuixJoag+VoEwnePvVryHCig=;
 b=lzmhK3c8ByLQKXG4Ud1/7hO0SUGgLjily2dODMEqjMtjHXrxzlG3RrK7GWjkhH1391
 7SkdbVMDZg3Cdj8kDeKBIoIp+Z9pq3bcugEawiWf9Ey0sSGmDDgE9u8Gca76CVlmVGoR
 +IYmmTar2Q/5mMOeWmL9MBI3E0SIbznYOt/EwGHSknWqUDuYgs12RRti/gBfmRDBi8T2
 Apq+krZzgukhndnRiIYlRNa9aztmQhpJkjW3+spAI7zj2WL7OCeJnHV51cULewrv0HBM
 h3S0tGACDxe88nT/UCw/gnLKLIgRCgPMlH4AisA5e+FCN81ncFF05EfSId3P261dvCD6
 9E2A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1772785022; x=1773389822; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJWs/FbEIWevZkUvI5Q1ViEvsAR2C8mtBFok4ydC8DA=;
 b=M2FQPb6RvnBmeEG+w01I0ToX4UF15iguQIewc93RAfzdzILrk0z/IPuKJmYSdtfkJi
 8V2zFw4kUi0dgWSYO+5ldNcpY/OGav7JjQ7iAtlNLJgkEbGoFCTo9yFMlfWkri5Y5j+k
 ToEGKy0zaEXKxpsaS7D2jP2RK4LJnX0tALx2ONGuFfuvsBXnKBysSyRZmTB4FB40xEjY
 dOsLKvDrzgiyCrDFc/5hYhqwOBzHGr/QuWcl1A4sPtO21ftVb9zOFyxuhuhKTFVH/qKE
 F6dhM1ZHbnAWqYXrM6NO+Jz4tPPSgO7IS/DrZ2g71XIoqONak+AA66QNgPC3DMlIPXET
 E/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772785022; x=1773389822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJWs/FbEIWevZkUvI5Q1ViEvsAR2C8mtBFok4ydC8DA=;
 b=Xpp1S1qWnyIUILEbi4foeNTlzPyKBzZgkyE2irnwGVGcfPQi8QvqLbaQ2zR9bv2YW4
 rvioXYOqUYD1BfO0EXBEOrjpOKC3tIAY7VSVYEd6CrJ3xblwuKpQ4CYpOGMtXvxzXwqv
 pniS1wxRSI9gR1oJNhT6x9lTZ8bHAzQkCHi1kiLg364LG5wV9mzW7x0D+BNHutL+SllY
 +zMoGdX/zc6VH/v9Tvv4jS1W4oqXLHzOLTtZRgONDIW7r4MWd/Znhyinej0PyM+iG4Xn
 FxXPHVJ48syTt0uoCRrSaeNqJUi2wDk38sCVBbt+YeTwkEPxjuCKgTvFqYmgRwdC9Wzl
 581w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnKe8XjRYT0IbwnUKutVt9cxS5N8B59KKAj7DED0MIED0QvbZ0wIfGoWwN1zn/s42axSd28H39NaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwALnr6OaJH+nQcX6h7UucUVzRLWkPwjT7tHjdoJ2A0uiPbrc39
 mfK1cX295GK3UINiW6TufqLZMK0ay1uB+bjgcDT3S447u0bupQNTTidHbBXNU5ya+agJ2EhzGd9
 b3PWynlduJgMz5lLIWQNHr7F4fNFhOkQxAHvZ9aJAIw==
X-Gm-Gg: ATEYQzxGMcGNbNkCnu75KFAcNRnbI+K79j9CI9jjtABbhY+Rafo2M+hLyKEpg0fOmfM
 4mi6rot6va2JgpTMUb76Ogt9mEEE1U+OsmngJkmu8EDzEjODwu/zb9G1Es9wP5BNZn4jtdhuSrl
 TML9INQr/V+aF5jjVWbSlDfx22sysTNLcvnXbUxw0Xc0nYcGiJrwjaWUKyjY/PmNzyae53Hk2wE
 TRDxu+hgyj6HqmGNyAYlebc0Wgwy/KIfROdUc8LVaDUe2Oa1qIupxuONH8mkn7LjUxa+/ksyGUl
 1+GnX9/ALnHxcP/mhhOYayzUK/RhsLGda2h9W6vu
X-Received: by 2002:a05:6512:3f08:b0:5a1:1d29:e749 with SMTP id
 2adb3069b0e04-5a13cab4c3fmr462212e87.12.1772785021656; Fri, 06 Mar 2026
 00:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20251104100032.61525-1-marco.crivellari@suse.com>
 <CAAofZF4bvBoecKaJv_sEEK54htXBv_dc23tJRrwhXrGb3O_D7A@mail.gmail.com>
 <aanRQseClNRRDZxq@intel.com> <aanSyqBzTygkzg80@intel.com>
In-Reply-To: <aanSyqBzTygkzg80@intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 6 Mar 2026 09:16:49 +0100
X-Gm-Features: AaiRm53AkZnEW28fqpnOqQb3GhR_VcT3imBeTJdcVHYvieupBOdB_AYauN-OleQ
Message-ID: <CAAofZF5EpWGh+2Ow2RMgvgmutnm+Gp4xO-rtxW16AcTjH9D8EA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
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
X-Rspamd-Queue-Id: 31BC621CF42
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
	FORGED_RECIPIENTS(0.00)[m:rodrigo.vivi@intel.com,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.karas@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ursulin.net,ffwll.ch,intel.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.com:dkim,intel.com:email]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 8:00=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote
> doh! please ignore me.
>
> The similar subject titles confused me.
>
> I just pushed this i915 series to drm-intel-next.
>
> Now, also queued for 7.1 along with the xe above.
>
> c15d0056fb74 drm/i915: add WQ_PERCPU to alloc_workqueue users
> 4fb289d352e3 drm/i915: replace use of system_wq with system_percpu_wq in =
the documentation
> 36ed3648a2f3 drm/i915: replace use of system_unbound_wq with system_dfl_w=
q

Hi,

Many thanks Rodrigo!



--=20

Marco Crivellari

L3 Support Engineer
