Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5685C38347
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 23:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4F310E7B4;
	Wed,  5 Nov 2025 22:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="hsbSO9Gq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CE610E7B5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 22:33:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b7260fc0f1aso69854966b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1762381988;
 x=1762986788; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Szr/I/23aXpFKXBJi1aHTQqCJ/stBoKYNXps0uuzFjg=;
 b=hsbSO9Gqx0mm0GWVJTXcWyIUc4OXwCCqjJ4yuN6b/N3pc6vhfkK4ty0PUO13thDnma
 Oe9DgMcVgIkFmdEPeDfcO5aw0ygUYC0kA5GfjDNQ9OqJIjqy6CKlyOg+wecdO0kNYgFx
 QbjMG3zSsLnc2KoSmw5LAJSkjDq7JVNmJ5on3kjLlC9jUzt5cYLkzAExKmcgs+lb9Od9
 R3CzACE13dFSb/AAjlbgq8/kVHOTlCfgJ4bLnlp5dH84NyMWb9r1gsEfVuydCK8RH48Q
 5hWk6Ef3IfUkO4uxzVhU65XJcO+Nu+GqEgItKVPUhyeey2a4aYd6rrOzScM9YM1eAakm
 39uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762381988; x=1762986788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Szr/I/23aXpFKXBJi1aHTQqCJ/stBoKYNXps0uuzFjg=;
 b=CxRG2kSJBJRxKBKoXMnUcUESkdMK8F09DIOTMEHhfHygAFLUq30knv6OazxSkKvSkN
 +d2aRmjcDv2ciw2oZcxxTAsjQKU5easWiFqE3pV0QuyKgF45tpi7uidDXnDMc6TZe6Zp
 hjgs6qqFCOiW3pCoIl0cNetJeOvWDeZp8GBYI6FWQFT1l2Xp3IyTZmE6oBdqqOhXcMIo
 XKmRfc7woUJ5GTz+oTd3DThpWoL8V75+jHfDLsve6pl9HN0R25gc4aWrY39+oO5YAqau
 dMPaURNFj+Z01dreNcHnQbbH2M+yNWSV/yrqa+vWwSG30pnidwWh6IkDcf6ZPfyT3mS6
 sjTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKKfDCnk679dJrPFpvWxUxIkf1rMmAhYItH0b5rLLTEB7biZkbeNTlYjQuGO/6R0iYLIsLz4gXuDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBxTE0M0t6IXQ4JCN82m6CYf5Mx5IHiitp6iMdJsa9UgutvJ3Q
 zIsxr8NgqAnQUfV7PxhlPjKjgDl+z1XINxdLeTmd0iyym9Nvlsks0vOFTegAtlKZS2OxeJo4hYu
 S5+thnh2MVwVw1yL8EkxSwpLbieCRLYUO7nXxVMfURQ==
X-Gm-Gg: ASbGncvA0T9OM8nuoZx6vhmC52YkI//xM9pdrOML0zxUA3m3XhIRupEPCn8mJzMX5zR
 klTj1kdkZDJpoAKDR82oj6bwWheKd4he4uinZcB5/Pikx3+FKE5TKtvux7AFj3pzY+A15qlhQon
 YDPyMRpCxEg7PK0vjOmk7BIaIxe9d+PFQbirCVv7W7e3qbuYybsuoakOkexodjs1+Gr7XwM+QBJ
 Skcp8ck6x9CyvS9KgR0Hjmb7+yMcB6UpjtRggPzckf2MbY5RvGZ5BMRMZQx
X-Google-Smtp-Source: AGHT+IECc9Tb6PQXUfyG8UVINPUv+8WuWF7S35bpfNhdSjAQ8wS3WKzirND4FdWE3HzVjloMGajR3KJsnvuwrExox2k=
X-Received: by 2002:a17:906:4fd1:b0:b6d:7859:61eb with SMTP id
 a640c23a62f3a-b72653ec85cmr441833366b.29.1762381987591; Wed, 05 Nov 2025
 14:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
 <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
 <209ea5680e5ca28b6d068ef8e0b58613c93bf525.camel@redhat.com>
In-Reply-To: <209ea5680e5ca28b6d068ef8e0b58613c93bf525.camel@redhat.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Wed, 5 Nov 2025 17:32:40 -0500
X-Gm-Features: AWmQ_blkOGBCCpLWGWm7AJHNww7fhuXYw2d5ogzt_C2ETFcndeIo2dccLJU1Ags
Message-ID: <CAAgWFh2Zy=9vt6x4e3P6G+_RV0Hu66jyJjpKWWx4WVg8EAV+Ng@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
To: Lyude Paul <lyude@redhat.com>
Cc: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
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

On Wed, Nov 5, 2025 at 4:01=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote:
>
> As long as you fix the parenthesis issue in the next respin of this serie=
s:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

There's already a v4 on the list that fixes the parenthesis.

Anyway, if I'm keeping track of things correctly this series is now
fully reviewed (v4 on the kernel side by Lyude and James, and on the
userspace side by me) which means I think we're ready to start
landing.
