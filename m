Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHs/KDPAqWnNDQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 18:41:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE21A216623
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 18:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2A010EC47;
	Thu,  5 Mar 2026 17:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="L7iAmZcb";
	dkim=pass (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="vNv6Wiw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 552 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 17:41:02 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEFB10EC47
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 17:41:02 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4fRc675zgDz49Q6d
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 19:31:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1772731903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
 b=L7iAmZcbwljAcJqpPicnyt/qoIxzrZftDpzdRdsGHRo5G0gsuK7djwm7AIOCSzt4p/iUgX
 hQB/7dpGZDP845q3fQcae5ANXe2DROB+Df1QbzvIvqbZAjOkhP5OT3ufh9uA1s24e0SkBd
 6ORYjtofFnVSJio51DlqWhR7Mm/alD4EHe8ZZRqKezRrkgSOOlrcKy/nUC1jnCc3vCTcyE
 Y8LcE1TtHWB/SB2zQyFvYQp51EPE4RPaS0APHsMRc2W0us74VKTzbro3/A/fVTQ89jBcZ+
 6wc5oVtWYhIR9N83GrW2Qk7p/GvwHUHtbP8QVpR+H4MHaD0zFf7KevV66pO9JQ==
Received: from hillosipuli.retiisi.eu
 (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi
 [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4fRc626652zyVM;
 Thu, 05 Mar 2026 19:31:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1772731900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
 b=vNv6Wiw4Xvfi089Fq9+E6JNNhi2Y3WR1Jzfwss0xjhX/7G2yJZZYQHoZz9YgAgFIOayfET
 lNoOP5MnaphYFWQVqURtju+aF1rSq7Pr64avVr2C/id7Mw9Cf/rJCyEX/ibXggi5vRM6yq
 uZex9HmZB9dXwtCHOSDz6UpugIwZm4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1772731900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIdcmWFjidJR6r6yijbOg5atPdCeq+LdXxOD6ElKnbQ=;
 b=GkNFEbEgaSmMs7tpq9OaKpiNvpUEkhiAShomlplPZ9KgCQoUfqsJergpyp+3V2Rt1rIlx6
 o1BtqZHo+miimEoMzUbXqJ77um/IcWBWhXf1aef5gLySzMAG7o4ihICa+tWtwaRaN6O+DL
 D7u+6eJbesIl20NAFz/mkv4j2yBUQx4=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1772731900;
 b=Qpjs3xn3xCz6V2Mh2vyntKIo+H83uUw7anamRayaNabMsetmEyZPDGwaloVk7828MPwgux
 kwsOEzJLotnKGG/L6qRItFrqBFyZwucxeQPzK+MLPEq4xE06GAq4IpE0EKQ1nYIZ7d5yfz
 R5BwA2a9kpFeYpfBUsnff7wbQ50XMGA=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60946634C50;
 Thu, 05 Mar 2026 19:31:34 +0200 (EET)
Date: Thu, 5 Mar 2026 19:31:34 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 00/12] media: stm32: dcmi: stability & performance
 enhancements
Message-ID: <aam99usPtkwo9GbJ@valkosipuli.retiisi.eu>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
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
X-Rspamd-Queue-Id: EE21A216623
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[iki.fi:s=meesny:i=1];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu,iki.fi:s=meesny];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@iki.fi,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:hugues.fruchet@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,gmail.com,linaro.org,amd.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.freedesktop.org,lists.linaro.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[iki.fi:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valkosipuli.retiisi.eu:mid,st.com:email,iki.fi:dkim]
X-Rspamd-Action: no action

Hi Alain,

On Tue, Jan 06, 2026 at 12:34:28PM +0100, Alain Volmat wrote:
> This series improve stability of the capture by fixing the
> handling of the overrun which was leading to captured
> frame corruption.
> Locking within the driver is also simplified and the way
> DMA is handled is reworked allowing to avoid having a
> specific handling for the JPEG data.
> 
> Performances of capture can now be increased via the usage
> of a DMA->MDMA chaining which allows for capture of higher
> resolution / framerate.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

I've picked the 10 first patches to my tree, I presume the rest are merged
via another tree?

Please cc me on the next time. Thanks.

-- 
Kind regards,

Sakari Ailus
