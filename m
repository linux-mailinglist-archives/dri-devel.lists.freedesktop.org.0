Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOXZEkHPgGlBBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:22:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E5CEE38
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F3410E528;
	Mon,  2 Feb 2026 16:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="gPHjHiIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D18610E528
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:22:21 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-59ddb31ddcaso5214233e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770049339; cv=none;
 d=google.com; s=arc-20240605;
 b=inP+m4OwsHHIXi37jMBUWtQmTemoAM8S9uksGlwcTXJo9y4K7yCjth2eNHrp8Xr3xe
 HBF8aOYOV3xdtjAtiv4e8nxhq34oXLZQjHT3rwMGI6DRmX/BajgFCtXWjxXH5FH3phlV
 /sSoy/NbBWxJan+UlwtgriTHLrkNPsY7sn1681e6jzA/lMIuxLrpxsBIg4bOE0BdOugl
 YRza5S+Ur+ryzPAapYlVRiCB8rKqZQ4zhlH1k8G18Mbvirz82wXB7smwLE4jIx6OvlUD
 NpQ/YVL3lcU+KeJvEFeujNQkKwS6ItzipJDetoE5wERhi79yYx31SyJTi0phFP8B5YuO
 cWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EvKMZQSzANH9VG7Ox9sMro+/aB3jrJdWyZcwwgIdCBE=;
 fh=MVjfLLmHx218jXzwOo9ytT22nI8VaS2g59UcmfOhiAk=;
 b=cuPx3W4KKDSuDOz8enOLjzkx5MyXGgdJ2x/9XHBbKnPqOOxKU6BpUAg1shOpL9LziZ
 q3tT/lAtCNNvrAgKVEmp5jLEO7fThCR+48ROGbE5nMKy+4vf3ZdZMSXpcavPNZd2KZ7b
 m6bIWWcTiKD2tVXuRkrM3k//N1AifUHjltMLwPLgt08hTfpPv80zuHmU13Gfy6VMrmox
 NlqPToMq8z9MJFb2MUFgGQB0rO/BzAfUh+hNpx/+0dIJvafkTohCWTN3ZCstVZ6JslDw
 j/+RXjJSpbaP2g2U60bMU5Rnh1vTVibh2iY3JH+m3yXC+rc0kK25JhlT8OkY2dinAnqc
 LHqw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770049339; x=1770654139; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvKMZQSzANH9VG7Ox9sMro+/aB3jrJdWyZcwwgIdCBE=;
 b=gPHjHiIMvnxyOEp24MefS/j3xgdZ4DlY9l5e3rjoPPyoXTqxY5vHcUqC2XImv1xWCM
 cKoJPhGC1FrQF5ipgbQf4P4IvFETHQCYJjLr2dSS1JJnDvm0wYyBwplr41et4lPUF4iq
 XvRCdedFQcRP3z8JI9g42Sk83nNs1pVBTwEJjNuK1vWLJHndJfJ1bU7MZdzZnQ+2BfBL
 PEHDziqUuGOqE0yeydGH+ekz7Qi8xVd4Y8EwJLpGqmBPAdr7qLQoJ0CAWvjbo5uujINR
 q4mQrXOF7vV15JDnQAisK1e/xERAQO8yP4rPSDvYjHmk5OJQtfJl2gcoNxOoFi28sekY
 yLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770049339; x=1770654139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EvKMZQSzANH9VG7Ox9sMro+/aB3jrJdWyZcwwgIdCBE=;
 b=GhYKjc5WLsQmi1zbfZn844if8zUiFDb5iEoMfrUCJDGQ9GIfAvtTxZR8DC+shYxezM
 8bKQp8DiKsIP5pAKBgDnhBtZitucpSRVEXF7UTt6cfDEaz02aK3dhJJesXMnu3eNtptQ
 O1oIA9IWVlml180mPVwuXJRQ0H3Q3q3XyEyLgEGyC1ckBffjd/flQAgX2tq7U7Y33OZK
 uodz17ZHEfXwl9YN2BrZEP0vAA5aK+sq7pP2VazCzplnp/cMg/HqzrseDbGJ818YkvYy
 c9qtBiqAsSIUO1yLQiJxJ5rDhk4RnTW46RxJYbW4gp4Uy7JC2iZQVM1Vv5tnVJC1ndSW
 Uw6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2sjOtpZtdNX6lrsqyiOuZ2997AkvfrkpmXzDh+BuI6iyn46+9OrrjgH0itIF1Ozrxbeo5z4HRsx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/fapMZQ12KFVYSiAtYJcXSB7NMm59t8XKi1L8Sr/sR02VEWJZ
 nRuQ7VmIh4dZPfc+7VJsPKiqQkd8KKvF9awUj6kFg+RE0s7KCY6+z7cyjSPEnubgeUr9xjjnCPA
 p+a+JsvxXYyRe1QRN3TEn/titgjiHXiwwTJLGQz9LZg==
X-Gm-Gg: AZuq6aKYHghhwaP9TZW2z7eSWg97N8KAOcTB8koeLo6fT2qMsCn+RIluVpLS9BwdKNk
 NYbzP7My74PAbP/QCn3sW4RCEl5SNzdt08mzeHQxPRgzIcSgiYGezzBzxG9C5yVGtGVNVQQ2et+
 x54HgmGTLtKy9/FYEW2CHmL2bbsu+HPVDxTnu+rCwkeQ04weBvsJvLlwvvh6gzvgaShv9eIFpFL
 UkrZVBMXaLtZs0ov78wlweUGUeBt3wiTUj2NYFzK9ap4e1EscNQWkV7jcfzCDI1VW+pP7XVdnWv
 LOQEEeE6I8KCifwUzdj9oJj5Y7az
X-Received: by 2002:a05:6512:239a:b0:59d:eb47:1b2e with SMTP id
 2adb3069b0e04-59e1641c39fmr4424338e87.24.1770049339183; Mon, 02 Feb 2026
 08:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20260202103756.62138-1-marco.crivellari@suse.com>
 <aYDO53pNfjvVhoT6@intel.com>
In-Reply-To: <aYDO53pNfjvVhoT6@intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 2 Feb 2026 17:22:05 +0100
X-Gm-Features: AZwV_Qjz2bQSXfX3oBsAjRMbKj_GDFnkkW4GMzaILKlqnWOozFR4ghSl_lmHt2E
Message-ID: <CAAofZF4oC+9ohHupkvmkR-967QEpSVdQoD5yHfLPcKzF4TnnXw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
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
	FORGED_RECIPIENTS(0.00)[m:rodrigo.vivi@intel.com,m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:thomas.hellstrom@linux.intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,mail.gmail.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 9C4E5CEE38
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 5:21=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
> [...]
> series is
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> I just resent it for CI and will push to drm-xe-next as soon as I get
> the greenlight from CI.
>

Many thanks Rodrigo!

--=20

Marco Crivellari

L3 Support Engineer
