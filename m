Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF9GOH5rgGkd8AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:16:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163CCA01F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC4F10E27B;
	Mon,  2 Feb 2026 09:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="eGsy4AuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582CA10E3C3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 09:16:42 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59dcd9b89ecso4765487e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 01:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770023800; cv=none;
 d=google.com; s=arc-20240605;
 b=j2N4I7kNwAUzpCDY3YY7LGEz9wHE6dURaf/2LPvAfrl44xmjXE5UJdsslpQGwMY/QY
 EeVbWyoqc78AYhVqS/huFnYMPDNzyxIeiBM00FYGGKy4syPH0VVrxexq+v8J5Vhnxf49
 VQdmFRbvzWWQb5KwsiBPwBRhpZp0CARB7mQ2PxkBFqQ2F7PhmbaRLwSxzQt+0NdTzGU5
 Ep7u52x+i0ykQaEvqFyfPIFydYQ83oc8YNdOcOV0AyGddyKGPv2uGziMF6K7I3SoSgWg
 35NZQAZnOIJe7uiqkg9QCcO8Q4TmHh15IfxsdUSKSBZku2NvzjgPX3VNOiV7XEwYkar0
 9vRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=R/NRB1DGTkm4ptQyWhhpF1o6WtxIIheLLpHt5b/iWMQ=;
 fh=X/TfsIvs21+QKOgbdHdH5bjktUT4pEG9kDVGH8rI0zg=;
 b=dkN7P6C/EcJK0Lhzr9KEZWRu+tTARL2DED0Qz8oP9/kNrZB6z/Cl7Xw1Tn1MEH9WIr
 YBM/FvWtggMEdjn1YJ02oRwzehii7/Q6CfR79gBhSA9Ij0xb5Qnctp3jSwE5FUdzBeFe
 YwmruckuJok92tBKMTcOAPdwTmCpiCfmdV9lxzsp3OFgryr18G0FC/S7F0MSzWm+hnYS
 xuaQ2acEYnhgs99l7KRYx9xFSAzGBTlpGQshwlN6QDFx8f/SZwtwEbKY4a6msbqBGJDy
 6cP7HM+cIhcFyeuUVvwa4vzS7bHNzcplhYXFA0CLTE53Y0ix2LxF2y7TIShjXvrbUhuZ
 mS3w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770023800; x=1770628600; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/NRB1DGTkm4ptQyWhhpF1o6WtxIIheLLpHt5b/iWMQ=;
 b=eGsy4AuHypeeSZADFijjCdlG6exP/0lqSw0+E+yN4kSbWcNnN26N27NrZCKLWflJ3p
 IvVxPT969Xjyk3X7f9Xs2ADP4L8D4hD/BnkSSEsIc19uEzT9hZvOMn5Po10aC2YEodB5
 3IMFcBq++ONHcWpSq/F687TuGZPe8zUZqBAB4Jnb27fTZoq4CLYrCEGLgqQbK9+A+pCY
 a7HPubBeyYYCzOjIS0v4p27jbFpljZU9ynnCMirlkgKSsGf03Dhrn+6cnLRPpkYuoE54
 dYTPXAtF75P/GcP/3lUdF2U6w/DCCw+h/4VL5WivyZADR2WVprkiCvflce1GMJtEOdI0
 fGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770023800; x=1770628600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/NRB1DGTkm4ptQyWhhpF1o6WtxIIheLLpHt5b/iWMQ=;
 b=Pv9w0HmhYLTpF5DnFQEVXmpvoum+Wp3Jf1geyIRqKAoOm7sk1vjIVUfsdtMMWxOZzH
 hkAYo/NsRheOhpo4B432L9RM27/DtSnUl/f3Tue5gT4W6UgrLRylmZNbx3cg6JuFU+Nq
 D9aXJ28Zrst/LkMm08mH+HO143AcGzB5XDQlS9YIeebVAA/1w2hVanasHYcsnKX3+YwB
 0J1jz6TX9EwnGIMy6XMuaUgXjtmBGMpmtu1rjDVWBAqENgAbULTzzVQBwndJo4A3agMr
 IwqBl7BTOG2sJis+z42GSu1CMe76aOnQbUPQuYIufcd+KCg0pCslvtlu+gIsR5eUmQms
 fGTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKzCXqSzb4Wl4g8nCl+4h221cSybwr5pAAzPPMDriBbcXcNVVb+Euz8JljW5icb7sEimj344w+Iow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYFLUAGA/qHz86Es+HM8Jr4eCHuCSMEUrvwoAA+qwOqoezBAQA
 GigPL4Fi+Yb6hfEGMq8VPHw81PDpOHzhasauZ8kZQ0Q/MUGLz2wl7P2/FB+u7xOhYzN6pLcRcuS
 0YNR/NC7ogh6YAFmWD5zOadCDa0o1IADOtvIt/jwsdA==
X-Gm-Gg: AZuq6aL6Rk8sf20eJ+BlkyZjxB0/UieO9B8rwI42Elouxn2RWbkqRhbfJHb4ViN4pMa
 tHCj3+rmWdyf90HLv0jl+TLOnhS1Oq5K5xmfp2C+kf+K9fhSmSTDgrnG0TXo+RRpzoyW3ErBVLp
 G+KVHIcepOpFG5xTayF25OAjvam+RupCqIV1qEVLSnLPCYiI4fo2xxEffzzr80CpAwXl4foOuCg
 ZyoFaQaxVnTIgkaseiKDFNY+tgtu6gyaZEBEganESleBOmVr6mErtttMsqcf5RyZ8rjNz0OxkYR
 TIwe6dCGjZVng3KNQ+UHnKiedG1P
X-Received: by 2002:ac2:4988:0:b0:59b:b2f0:d2e0 with SMTP id
 2adb3069b0e04-59e0d8a7ef0mr4247440e87.13.1770023800494; Mon, 02 Feb 2026
 01:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20260124145401.44992-1-marco.crivellari@suse.com>
 <20260124145401.44992-2-marco.crivellari@suse.com>
 <aX0qzAHieOEAyD5w@intel.com>
In-Reply-To: <aX0qzAHieOEAyD5w@intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 2 Feb 2026 10:16:29 +0100
X-Gm-Features: AZwV_QhqmhMVE8BCRe1whVS_Y_pBx9ytwTjV5QVHI6x2n9sqYo1PSqVumqHFup8
Message-ID: <CAAofZF6ZA8pnfCnFzAu3FxPxe_p3R5ZHao=kij-qwrT6feQ2bw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,mail.gmail.com:mid,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5163CCA01F
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:04=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.c=
om> wrote:
> [...]
>
> Thanks for improving the message.
>
> Could you please rebase on top of latest drm-tip. It is not applying as i=
s.
>
> Thanks,
> Rodrigo.

Hi,

Sure, I will rebase and resend.

Thanks!


--=20

Marco Crivellari

L3 Support Engineer
