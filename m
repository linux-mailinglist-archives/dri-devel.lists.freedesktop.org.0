Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGyDCVdJgWnNFQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 02:03:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1ABD335C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 02:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872D410E4AF;
	Tue,  3 Feb 2026 01:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RO0TNqiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D1E10E4A7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 01:03:13 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-89476eaaf16so50543736d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 17:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770080593; x=1770685393; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4HDdB99E4CdIl4ZvDTOk2E5hND83PuSdUEsGJyDFfRE=;
 b=RO0TNqiYN2coyJmsj/bbeWUv8JQXglhLocCvql8CsaJJua+h6WjvnDJAjZZxr+7g6B
 z3v9kC0fY0cdUfp7Aw9DMQjYQpnxRjRtXl3CqFTylrRDhqgmmcM22vNcNUPdkmU4dI4h
 C1UFrxd2aYMvtgqc0ej31lJtUoa+t6VnAX+PD9pmBrXugs/9ujj4sQ/tUgpagOONMx81
 S0fV30VOOiVNwfwjNIbPKrPO2HDvzMJfjYR+AxDjkF2rPyBkOKzDwRWYi+Pku/cqm/mx
 DIrH/u5Bel47VXxuVs5njS2wXTi192rF3Og9sefdfxwiw/1fTPtEJQZcqrSYKcRnqMBu
 zW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770080593; x=1770685393;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HDdB99E4CdIl4ZvDTOk2E5hND83PuSdUEsGJyDFfRE=;
 b=UUeOuHK3Lz9CEJZvalyMlv35GYTCXRRWU9scYUDPZEq/tLuGn1Gvawx5Lz9XSx/aNZ
 uaTTvPNdUVjvRuAGXZsbVyQwfcfteJ6OWFz+wsbRYa07VivncUFpHFneWwj+Be/KDnTm
 GCcUgWtSoqEMbzt4uLIJl6tFX/EoNg/wZZwJGsbMN7P4hFgL6euGHL7Imqk0kfC7ZpsW
 /yN/RJfjSdFmlRxQsbYQoV5DVng8xWJugFfnJxc4whxiZNJMWozlCWQp1Lkz4Lku0eii
 aQuv4FeJWzvLrtOYwueY1uE8ZQ+h8lDAWqg5gus2G5TZFjE3EXDN5sGSZ6NsgIDl2/Lp
 bvxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW0Az+/oY75M+cyqIqRomzSEH0WpeietQ6LTtXloR+a+XFhVu6heA+rNcO4Lfsq0RF6MReY68hKDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPLLVe9pKP9h64KaZnZZWcKZRT5ivvgfJDyYmDrCpEDX8MclwU
 iILhkEUfKBk+rI8RRvPUBYOvfym1RCPGy7rF5GYesDTgjFWgI5kI5TpT
X-Gm-Gg: AZuq6aLDad9bKCqoQb984NKDQ44KPE3RkiRON5bR27mT/JV0htzCFhRZdlsKZgju287
 UawMcrihaG3fnLegar//uPlHNPbdH3cR8emNEC7ij9JAB4nQU06ackjm4dIFlANA7Xg2vetjqh2
 whbdIYHWVYrt2AT0yEutAGw02i6x4wrce7sDy7mboosVZ9NdBmlgbbhdjbVweJQ/HNqPY93Yy0l
 UmzY/iyHU2x5c5AmXW/Iqk5jKRB4RfyXI9KEPiA0OF+utA9CyZOutWCVh/8rO1NmY/ctKzPmzQV
 9ZSSesmVT1KWRlb2TMsi2mqXt2vcZGlFg5pJwHWzZoAxu4q35QPx9e5e+5ckEaW70+7mBkTSedt
 cb3WF4KC7xWPBBZAGtFglQMylf2JffkMW1qe6gDi7n9ACk76vE6IqjhvxXwyeDUBrSipLpdVuBF
 w+bdqBmeqOFmRra98pq9Q/thnsWRt2/5oIHFQXZmQomcdXNdpkiGDQc1hIGHHWtnX8UTsyTIWC2
 uOqCOyT6O41Ow==
X-Received: by 2002:a05:6214:e49:b0:894:48f7:9919 with SMTP id
 6a1803df08f44-894ea10065amr196085236d6.56.1770080592742; 
 Mon, 02 Feb 2026 17:03:12 -0800 (PST)
Received: from localhost
 (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d376e0d8sm123753126d6.53.2026.02.02.17.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 17:03:12 -0800 (PST)
Date: Mon, 2 Feb 2026 20:03:47 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm/gmu: Add SDM670 compatible
Message-ID: <aYFJcxOXWpuuC41I@rdacayan>
References: <20240806214452.16406-7-mailingradian@gmail.com>
 <20240806214452.16406-8-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806214452.16406-8-mailingradian@gmail.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@linaro.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,quicinc.com,linaro.org,poorly.run,somainline.org,kernel.org,vger.kernel.org,lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CC1ABD335C
X-Rspamd-Action: no action

On Tue, Aug 06, 2024 at 05:44:55PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has a GMU. Add its compatible.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Ping, the contents of this patch seem worth including in the bindings
but I haven't gotten a response to this patch.
