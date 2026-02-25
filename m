Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D/HAPuMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761921AD598
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B225A10EA02;
	Thu, 26 Feb 2026 18:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V2EyOfrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B3C10E865
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 20:03:29 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2bd9a485bd6so48640eec.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:03:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049809; cv=none;
 d=google.com; s=arc-20240605;
 b=P2R9p3pXkjV5nUZiDzKxQau1OZiAKOG01ZQJ1bsLlIAmeRbv+95uAMBdcd36Hqo0+r
 qwwRNXY+hP8chDcZaDT8GhQqN5/rGz8ljropnQ1CP8lK9oOsLLCab8Oz/noPiO/+CPkS
 m7Ist4YYk4Y5f2uq7zJ9//uBxwquE9aGVATsux5dp2E/jrpLJZ4NcaSnBFHBZ8EIxb9p
 ATn5BZk5C2E7MITizl8K2AZ7Cw6mgGGZgTfh59luwJsZSqZbiM0+fJB5pwequjLtRYdk
 SaxVXR9MBi5dmiydWH9X+2RqdsJzmV4uoNr70O65M/bdXnDJ560kX1z0vOjUsNxW8Tu5
 Q/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4kIyGmBg5HXoWLsRB0pfFO9jGQNi7KILjq28N7CKS3w=;
 fh=/hssPQfHZaHULgMXjWFezL442yeCVn0V8lpEP2crCnk=;
 b=aIh67NOpEzwAlxkL9vDnMekM7JNDo8Q9bH6GpZiZp6FOwqvBOXvmEhHdW1oSBD+txo
 h4DQHKO41+CCwR/fKOVfZTqpUD3yrb5THusT6vP79nKqJafE4dBjryaotmHbhX+FAj7c
 rICCJQfpl9exWhIcSGkX72dppPbjZ0oDFzMNBHZ86kBR5y8vCB+Xs2+BZ4VNZnryBv5a
 oGo9vZIHmLikED6SOQVPk48N0uUCyjE1SdNITeqox9aM/ZZ4j1VjfqBXP2cM72uQTf5L
 OGcjeZ/fuS+8IPBnhRq0un9GV/iGX3Zo1BuSYv/K7m+opBuI2o1tsnFKHcJU45AoC3E8
 l4Ig==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772049809; x=1772654609; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4kIyGmBg5HXoWLsRB0pfFO9jGQNi7KILjq28N7CKS3w=;
 b=V2EyOfrGLBONEGGZHcgwkHkppsHIlvYtXbF2aStiW7W+nfML9yJkxkkSC6wTkJ1ttX
 rFkQRPPKR7QZBKnKhddBHi9qQYkRvsbDZqd57wXsE40mIKyINeo8qqLnLBNKhSCBM8YC
 oP3gknu5jJuS8/RDNj/ne0SL0ORuYe8hfeaKVAenkzTu6FNXClVxCOCXID+3JF9RdVF3
 LjfjUJeqCONlD3btTl1F9TNobZsrbVC+uzY5//SbaBJT2rK+k2oU+m2HvlvO+GO0MVh7
 O1e22shPI4AtyLfSeYOQ9TttTm8bu/ptIkRJd2+C9OLgYaYrDq8ERgrii6raghWNi0d+
 hFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772049809; x=1772654609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kIyGmBg5HXoWLsRB0pfFO9jGQNi7KILjq28N7CKS3w=;
 b=D3UuDbieHkvdcu1Ca2rAXprM+VBVsjXJwhPmrBUgU13Z7gJeLlu1n85xA4M012tdDF
 BJWE5GgaLi/cpZsOW4UaEvHgJcxa2+mLmoSrWkIb2pIEjSMtG0k7NOnBHVIUkl895gLH
 GdgDDajZhc0J6k2NogSzeJiQUGgwXthe5AMuCabWQ8XIZ5OVnq4eiy5VhnOK9W2zEC8N
 5hV+d7xjUaDJp5KaG1tTa1vdf8sm69rD/lA0GVzO4EYxyNUjRL0m1i61HKHmDfL0mQz0
 k1k8sPsICQUufBPW2luMBo7c8CNGt1f0gJBfNbGU5yfqPxkqbjyG4eSfSwV6KFQBailh
 YGwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8GcrinQgTHwHMw1webs/6jP8oWpNI0MEd2SUpPp1cMZYBe5CyE5gbiyjjggHGvI587emiJkfMGFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvYu5G4iC3KqpPPjzX7iEw7ILXzW1nHVWTwy6WDNCJh0NJlmG9
 8L+HYAB+si3WTlOQB/TcY38FMmQIEUsNR2YsjryrOCAlKtDUE8QUmmGSKoCpTl4pbC8ZpV0DSih
 9dNEYLF/JixWaPGFmAYlFNQs6NQ/jzb8=
X-Gm-Gg: ATEYQzxXfemsVzI+JneFBSEx3ihqQz9Y16PLoDeW3PVbtksvEb/lLIpLyQv4F7rxxQa
 njOGrjHKGzL2//lN9P49RWzVEfWSu3PtJoMJGIW9AsAIOnVT74KSvQzTcoVpU6F/opSqZPK5Ikc
 tOQImOp4hJ5+hvfAZ1gcakIUKSEsJP+A+KIO6IbPcEuaPBTz6oNN77OKmtKTJTLmvXc8nqo9Jkj
 iAy2vggEDh3QoFBBlQSc4aa+LH6ceeYZXX2tcO5Yx3m/P1gmuJY0/5KU6WS70Vb3Ocz7pKjhggl
 wUoJt4w=
X-Received: by 2002:a05:7301:1297:b0:2ba:a661:8512 with SMTP id
 5a478bee46e88-2bd7bb55164mr6154017eec.17.1772049808589; Wed, 25 Feb 2026
 12:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
 <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
 <CAHuF_Zq=Rpg0HoRJv-BSREEhT8tYH4r+BCbZ7obrG36vSmwMQA@mail.gmail.com>
 <54abd390-113a-4c99-b024-2029c4d68099@kernel.org>
In-Reply-To: <54abd390-113a-4c99-b024-2029c4d68099@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 22:03:16 +0200
X-Gm-Features: AaiRm50pGQkXh7eSkSuu6niLp3TuwxMtUDhrOf8ElhHJQnJMvsWEsPN00BEN06E
Message-ID: <CAHuF_ZoEAT+91trLabyo8rc8afXW=Wd0Q9yxu_v53nXoRFJMTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 761921AD598
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 at 17:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/02/2026 16:29, Yedaya Katsman wrote:
> >>> +  vddio-supply: true
> >>> +  ldo-supply: true
> >>
> >> LDO is the name of the type of regulator. Why is it called as name of
> >> the supply?
> > Can you explain more what you mean? Do you mean to change the name of
> > the property? It seems that all the regulator properties are named
> > foo-supply.
>
> I just have doubts that the device has supplied called LDO, considering
> what LDO means.
OK. I don't really have a way to verify if it's true, all I have is
the downstream dts
which calls it LDO [0]

[0] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/d3766fc8cda2d96de2850faa9ce58e5a37ea9f9c/arch/arm64/boot/dts/qcom/trinket-sde-display.dtsi#L24-L36

> >
> >> Isn't this binding exactly the same as s6e3ha8, s6e8aa5x01, sofef00 or
> >> any others?
> > Yeah they follow the same pattern. Is there something missing in this
> > one? I will add descriptions to foo-supply properties
>
> No, was rather thinking that this should be combined into other binding,
> assuming the actual pins and supplies are the same.
Got it. I don't see any bindings that have the exact same set of supply
regulators, at least according to their names.
I guess I could add the regulators for this one to one of them and make the
not-common regulators non-required, but I don't know if that's what you had
in mind.
> Best regards,
> Krzysztof

Thanks,
Yedaya
