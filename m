Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1D9A3E4F0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 20:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE4910E9D2;
	Thu, 20 Feb 2025 19:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="De8aPL2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9E10E9D2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 19:20:17 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fbfe16cbf5so316919a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740079217; x=1740684017;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RpS2FnqN2TDBERxg5I5MCZqVN24rvf9DEtZLCeAzcmo=;
 b=De8aPL2YyzBsDMGAuwlI6cCozwv3WpgrbNnXGL1yoilq5IXlo/7cSl2796GMrn8Twl
 xbg634sys8UOJ35zyxogLFTdweETJ4BkdiBOqYvxdcc7TshQ96k+N+DvDfkCN/0jspGH
 zJw18QnJIG7r/yscLbDUF1Hw/ub14sw2DmZ28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740079217; x=1740684017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RpS2FnqN2TDBERxg5I5MCZqVN24rvf9DEtZLCeAzcmo=;
 b=E4aNjZUjEGZ3TBV4bs/oCEYxdzUR9Tc8VQynGEJ2cDjXvPwcM9Q17h6O/8R+rDP2RO
 AlWJ9B3iMHJDbh5jqSCqxDJfPXXh9n6MgiFD9Kiltgq/QlpGmhwybywaerpc9J4a3wxV
 kMwu5S8nWDQGSxQkXF/vf1tjg/psfGW9XiM98JsHAH8L5lMvkyKT4SLGmQ3rU1fvs7fc
 lA4cEbyNwMNDyCp7hM2QA+UdLqsYmnkYSyB86aUVcjgMf8PoOq/0mfnENNM8Ys/LWTtW
 axl814DsAJtWNCjAruy2jhhmFAyyVboQ8xZACbXbPL8nwYA3tr65Qj4i2g6eJQ4i3knN
 BkHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2h/YKUj7yVb19T0kyhwyYzwe9u0SRpNbsz2YyzMhNoymy3KVje7+8jAVcs1vz9+AlDmcPg3vsji4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT76Ly1/S9OdChvWoSqKVUYze8W9g93XiZR4crebSOzbZNpfVY
 Ixeclq1KPqUv3dT3JjxOoGgGum8Kq9Mqkhi/g70Wm266T6E0nqYTTWEo343eAKPyYkjw+QiuyoA
 =
X-Gm-Gg: ASbGncsnIachs23057/iVsTCKyUTsB8owexIitPN4PfplXGtblJTlcVbKpQHN2FY9cw
 foLf0d9lE4X3HSNl0QQD3Qy0whow8L4u4e9KE8zVoiNG7sNHXaVkUprZ0S5nS0nDNU9Aa2tul/d
 A5vIFriZm0vnaLwDLhO4gWQk1F6QFij1mfk7FJ3vmH7VXOfNLJKBGK11ZiWmVCixaOjmHwTOkNq
 pcD5PZa6gMMVdWAlWBaim8oiZBhksJWhpfl7wLpG7FFlozxaAyOtXEIH1yfRbROcnhzCqeMYX2M
 y6VQybiTJVJMfXY9wEgmp1nDI2gl/XJrjPG15tRtfKrKfkNvWG3Xe94=
X-Google-Smtp-Source: AGHT+IGmzGu3l8Zr+42vW9aq+Y+Tvm8JSLTf9asQ8bOPnf+2i1yKHjQdgT01/oF2labc2hQw1CAhWg==
X-Received: by 2002:a05:6a00:1947:b0:72a:a7a4:99ca with SMTP id
 d2e1a72fcca58-73426c8d113mr42681b3a.2.1740079216514; 
 Thu, 20 Feb 2025 11:20:16 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7327eb20b98sm8179585b3a.147.2025.02.20.11.20.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 11:20:15 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fa48404207so2738979a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:20:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRkz/iVbsQGiEUEeV0f8KL31zW6bZMBqCMajzOnIVqZ0n8AM0SiOnYrY6KrObb/Fg9iYkn+JEsHis=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3946:b0:2f4:434d:c7ed with SMTP id
 98e67ed59e1d1-2fce78c7fd8mr609023a91.16.1740079215301; Thu, 20 Feb 2025
 11:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20250220-virtio-shm-page-size-v3-0-874fff6f3979@redhat.com>
 <20250220-virtio-shm-page-size-v3-2-874fff6f3979@redhat.com>
In-Reply-To: <20250220-virtio-shm-page-size-v3-2-874fff6f3979@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Thu, 20 Feb 2025 11:19:47 -0800
X-Gmail-Original-Message-ID: <CABVzXA=_S2in+OzfwK6vGQR3VK3YhGRu4B+tp5oCZKHt0Qz=gw@mail.gmail.com>
X-Gm-Features: AWEUYZlJc2Ri_gGb-xTYNfHBI9nY3KXtKqjPGrNSl2kv5ni8-vqVm6Z_S9XKcC4
Message-ID: <CABVzXA=_S2in+OzfwK6vGQR3VK3YhGRu4B+tp5oCZKHt0Qz=gw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/4] virtio-pci: extend virtio_pci_cap with
 page_shift
To: Sergio Lopez <slp@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, fnkl.kernel@gmail.com, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, Feb 20, 2025 at 6:30=E2=80=AFAM Sergio Lopez <slp@redhat.com> wrote=
:
[...]
> @@ -829,6 +839,7 @@ static int virtio_pci_find_shm_cap(struct pci_dev *de=
v, u8 required_id,
>                 *bar =3D res_bar;
>                 *offset =3D res_offset;
>                 *len =3D res_length;
> +               *page_size =3D 1 << (page_shift + 12);

Maybe this should validate that page_shift is in range to avoid any
funny business from the device; since page_size is u32, this needs
page_shift + 12 < 32. (If it's out of range, I am not sure what this
should do; maybe just warn and set it to the default 4096?)

Also shifting into the sign bit is technically undefined (or
implementation-defined? I don't recall) behavior, so perhaps make the
constant unsigned, e.g. `1U << (page_shift + 12)`.

Other than that, looks reasonable to me:
Reviewed-by: Daniel Verkamp <dverkamp@chromium.org>

Thanks,
-- Daniel
