Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCy2CvT8eWm71QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:11:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C031A104A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FC210E2A7;
	Wed, 28 Jan 2026 12:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="JJFzPz2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7050F10E2A7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:11:28 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8c7199e7f79so14080285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 04:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769602287; cv=none;
 d=google.com; s=arc-20240605;
 b=ZS42zIAUzBa2eEsEchwNhnhrRJdSuzX5dwapfWWVutqAwTjn1xqN55pmD7+gkcx1cK
 BBNcDUI4YUzwbDo4Ge8bLzpcpQpaIyn1BeahHIM3jVryOB6KWWL6e86MmsvCJmL+GBnw
 FmYmYtOOr5i/RL8w/IgBrHOgyn0yJBgquTB9/aAsw8WlE5iSzI544qKveU75Amlhqkp+
 TfSDJ0zWgtyfeC4L+6Rtc3QsvH92f1yJopOpxo/cScLVRdd4mvw3sAlu9DOhVaM0dQ6O
 xhB4re6/H8gY1uy3Mjylvcfnbin8x+VnmhEVuTnUohwP0oLj+B4L0MY3yYck1X/Qpmdt
 kO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pVJ9C9b+S12G63hZW89sgiaIkw5ETgTQmJ9RILDQnsc=;
 fh=Pw9+kmOe+C1w5HfR0m1JVsb7jGuBgD3TjWXuIehYBGk=;
 b=giU03s905xhoP7NS3kgmttQP4mAYEraIc5KC1vtkBfBZMDckFazGCpxlih40W9JGNn
 yY1D1vn/HSmF8N1mFdV7kYZzrJPB/Mawo2UDHM2kAY7JQHnN7HLa8ik2TFWhOZHO5TZL
 bkrOngAJS+SNtUygQGPNUy4dJhVor+ZnchqgJX1AoAgTmMZiFl4REeX1aurygnAGke5u
 vEc1C/t7uQraokYbU/z34lVY37cOscntsDRZAytE4FtgYTWqzFY7DtYynIfz3FOaeHXO
 7QmF7UjZTFmu+5rHTIyi0RJtnQ2XGVrq/8TCrv954t/oMwVX+8GeG1b4zgx99quAH/Do
 USBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1769602287; x=1770207087;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pVJ9C9b+S12G63hZW89sgiaIkw5ETgTQmJ9RILDQnsc=;
 b=JJFzPz2/afOvSwWrG8jxU0Lw5aNf5oW1ZieZlb2T3DXldLMqHo4fkbyA8kXCXq/C33
 QbNd82yX8N+9dVNT8wzqwXI0zrvej/I3Pbc1E85tj5RgpteTSUKot58sQ1vvRULqx75X
 7p5jrEuh3LxwLK1cNl9oqF7Mx911kmYzteOAu2FU6ngT15kC+iYj4nSCfUAluleI1EN2
 EBmkgcO6sC2aCpwC3irJxC5oRtbsmLInCtuh0D1q5owyLVs6m6mWsSdrzSzEhSL4ft4A
 aDbEsOPK0Zq+UDiAs4zRSzAFT3v0Of94U4ZJYZm0Z5eyibAaSX+TU151aVGOTRaZo6AC
 +gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769602287; x=1770207087;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVJ9C9b+S12G63hZW89sgiaIkw5ETgTQmJ9RILDQnsc=;
 b=F2cVkjeyBWFjz3AJh2h+7mYBRxAUP6sPMz1dv+dizFwr4sJEMSAYcVbRggRtUJH6Lv
 VVofo7NmDGGc2YP27EZyEkUSzKoqNR398nEM7i9HkmrJdYTAKaeQZQV5t45vQGGmpj1v
 AHbWXN38z2Sve9POyreWU7vR3kgTYUPnGTjSoKTXMqCMwi8PYSH4NdJW0PhopC8zBDel
 E+Zb1V0J1TwwZdy0JBnHjP1YFI2kJUxFNQFlbea1+5kys35JEwFMB3P7PF3I5WMFJrzb
 5S9r9YHo2BqQRBOe9McfYDUhFH2Qd9O3nmI5KkeA6zdm4P2GaxmrR0B6DvNOLkyEdi8C
 Fw8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFK0OhJMpkqiYluOsvIwGIIxQvMK2k036qxEXyR8zpR1746197LkrbDMNtYOh7gUD4Ti7qt0o/fSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt4bQkth/JgMUD0bbI3EG7c/uHD8QrlMhC/KBfnzqWxWiJFO6w
 6Hdn/jTuoTQYR6PqnEqfyru3blvBivbM00oldM8H1LpKOPTu2g8Zz/SnjZX11+Xf/B3414H88W3
 xDAfgxm2kstoC8kEvYm0bnlqwtMDkRKt6qHi5r8aRMQ==
X-Gm-Gg: AZuq6aLrt57La4p0lssJipVOiNj3iW0dUk3g4r/X2s4+nL2dYWkAJIANxSLHlGlNlCw
 4DLO507zRg0LgLuIN5Vd82yIjxVRaW+qZR8c5R2QN7XncWJs4W5Ku7xSSY9G0WM2ZH/sbokqFpc
 SOm1m2a1gd+AdXqD/MNje9JPUTKZYfYcFqm2ac173Ti2x93puRtlO6DVfz5+/6pQQdwJZikO4R5
 xXIbse3mV3Ea+GkjUFMsDJBlpr0kIdRPboSd6hok0Z3AKzoTJFaPai0oJDH5lfhzjyo
X-Received: by 2002:a05:620a:390c:b0:8c6:afa6:2700 with SMTP id
 af79cd13be357-8c70b8fb2b5mr622466585a.47.1769602287501; Wed, 28 Jan 2026
 04:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20260125-dw-hdmi-qp-iframe-v1-0-e0f7649ecc4b@collabora.com>
 <20260125-dw-hdmi-qp-iframe-v1-1-e0f7649ecc4b@collabora.com>
In-Reply-To: <20260125-dw-hdmi-qp-iframe-v1-1-e0f7649ecc4b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 28 Jan 2026 12:11:16 +0000
X-Gm-Features: AZwV_Qg5AgsOlfsBhJASMeb9mEubViDEQy6iePoHReZvvpk2qWl6QqxVnDR7N64
Message-ID: <CAPj87rMx9eG7TiXgYd0OU9pJ2ndxbHTpR3KRNTg8qxEE918UCg@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/bridge: dw-hdmi-qp: Provide HDMI Vendor Specific
 InfoFrame
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[fooishbar.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6C031A104A
X-Rspamd-Action: no action

Hi Cristian,

On Sun, 25 Jan 2026 at 00:23, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> +       /* VSI packet body */
> +       for (i = 0; i < len - 3; i += 4)
> +               dw_hdmi_qp_write_pkt(hdmi, buffer + 3, i, min(len - i - 3, 4),
> +                                    PKT_VSI_CONTENTS1 + i);

Given that this for loop occurs in all the users (other than when len
< 4 where it's not required), why not move it into the
dw_hdmi_qp_write_pkt() helper itself, such that the calls for each
infoframe could be dw_hdmi_qp_write_pkt(hdmi, buffer + 3, len,
PKT_VSI_CONTENTS1 /* base reg, incremented by helper */)?

Cheers,
Daniel
