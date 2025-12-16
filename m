Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC90CC3E09
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CAF10E96B;
	Tue, 16 Dec 2025 15:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HMVts3dS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C54410E96B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:20:21 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a07fb1527cso8476345ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765898421; x=1766503221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Um9j1NvhAvuOmXHqodLfor6UadH2pWBjGMeLJlrrYrA=;
 b=HMVts3dS1M893d9Z/BeHOhud5Ys1yDbzRZW951o5/gZyiy8P6Ark+BzNNYf1sxY35E
 hyao3e/ZKg0kyl8xrfpQ/kecDTpPSIy8L/Tx2hTykpJ6oGF4lQbWh68kaSkFv5jbG1YM
 upR+nWDexhV6PwZik0xTXbag70ogNCD9iK3W/4ZJn1i9KA2oWHOS7kpe+osvp/ogYsLj
 lBonRh3YWTX7a6bty+mC/qytjxec9X95AvnQxBAiUfTCCV0dhpgn5/+NK4vfxmj4IN35
 t2tMUQyL7LtJlJdgTbxIRdnnwr4d1U7ToKpmXeCd6/9+cNucCaQZ/hfVkUiXMwfs1HxV
 /pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765898421; x=1766503221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Um9j1NvhAvuOmXHqodLfor6UadH2pWBjGMeLJlrrYrA=;
 b=ZcbqlFMjrxYtqKW0DL4yNgm6aU0htjEmjwX8KqQIWTkrB9wWRO+IZIgrUwe8B/6A2q
 lNNw1/diIkPBRjJHfRrwKeX+aY5B1kqjK1rYK32vd5QnPx1H1KbTYyw2duCCzeftNYoO
 mf+1JBpyCKDP+97QOmt7ts+XDQeit0W/KeId0vvF9SFxyjANtgyleKKhXkJH/9b1nw1M
 qwf2T300Brm1JkMdJ9D2KSYz4+2MRGKH0QzSxvrVGkdL9jHasiBYSq6gxUosa0V6MEbB
 vCuj0zG2gKRt14yk5T1xd++mWMiE+ELEW3paa8j47J1uzUFfbSGXfmvRRAQnOo0AOpyT
 lMqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLBBMshuMEkiROaDEVMJfY9O8MgOyp33g7LNquGLZproG9QvZOE1Z+D+YQ885MSIeikDkGzAplYhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx97FvTKFcer8QDNV7MD5oxTdb5UcQkjXpD6c/eZh0qfADNicUE
 KfxYT06pOeCHRN8661c0+Lzms3d3Ebxe8KPt5WxtqlIJDC2SY/KAGuEP64TQxIwihw1m54rgTk0
 bsFWTlnIdVtWyWBgjn2og7GhSZmEoMN4=
X-Gm-Gg: AY/fxX5fOUXEFBOppigcYpv6svqLxPR0RIp6SMK3CTcoSczHepMXlsvM3arlHxIX6IU
 jHZ4erdnOV2blsNct/tdPCEMErbpZ4FJzw3DxFGL7gsf+vsP+LVTIfyB+fYc8IHTsapN2xIztQn
 Np9yr60Y/kIsSyhurwqyM3XeWQIrBxNaWIY3US34f0L+SUgic8U06vtTNUQuRKibJM0JNWFiQRw
 Rrq2LsDb+vwmgewUF1WPCrgezrBn1Ii0stEbXepGYLnua8YiOSSszaidLdvzdQ91a7n4Mijswbr
 0uB7W3s=
X-Google-Smtp-Source: AGHT+IGYJpLwVd3WmfTCVN6vD/x/9T3gUFCIaNjQX2AnDfzywCiHaDROcEgCyN90fYOeDZvtNwbDXrs4JcvDTNG1WwM=
X-Received: by 2002:a05:7022:3a0d:b0:11e:3e9:3ea4 with SMTP id
 a92af1059eb24-11f34c52cc5mr5906109c88.6.1765898419103; Tue, 16 Dec 2025
 07:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20251215113903.46555-1-bagasdotme@gmail.com>
 <20251215113903.46555-11-bagasdotme@gmail.com>
In-Reply-To: <20251215113903.46555-11-bagasdotme@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:20:06 -0500
X-Gm-Features: AQt7F2ra4W4DJMCA0k4t80_q2saRqZRxc2HY97wTRTVoyOkAEkAv1EtqbtLiuMo
Message-ID: <CADnq5_P04522xETHty9hn5JO=mNbKSg3Pa68=u8cZ+JgNLt1Jg@mail.gmail.com>
Subject: Re: [PATCH 10/14] drm/amdgpu: Describe @AMD_IP_BLOCK_TYPE_RAS in
 amd_ip_block_type enum
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>, 
 linaro-mm-sig@lists.linaro.org, kasan-dev@googlegroups.com, 
 Linux Virtualization <virtualization@lists.linux.dev>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>, 
 Linux Networking <netdev@vger.kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, 
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>, 
 Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>, 
 David Hildenbrand <david@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>, 
 "Nysal Jan K.A." <nysal@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Alexey Skidanov <alexey.skidanov@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>, 
 Harry Yoo <harry.yoo@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>,
 NeilBrown <neil@brown.name>, 
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
 Ivan Lipski <ivan.lipski@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Lyude Paul <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>, 
 Shaomin Deng <dengshaomin@cdjrlc.com>, Charles Han <hanchunchao@inspur.com>, 
 Jilin Yuan <yuanjilin@cdjrlc.com>, Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
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

On Mon, Dec 15, 2025 at 6:48=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Sphinx reports kernel-doc warning:
>
> WARNING: ./drivers/gpu/drm/amd/include/amd_shared.h:113 Enum value 'AMD_I=
P_BLOCK_TYPE_RAS' not described in enum 'amd_ip_block_type'
>
> Describe the value to fix it.
>
> Fixes: 7169e706c82d7b ("drm/amdgpu: Add ras module ip block to amdgpu dis=
covery")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 17945094a13834..d8ed3799649172 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -89,6 +89,7 @@ enum amd_apu_flags {
>  * @AMD_IP_BLOCK_TYPE_VPE: Video Processing Engine
>  * @AMD_IP_BLOCK_TYPE_UMSCH_MM: User Mode Scheduler for Multimedia
>  * @AMD_IP_BLOCK_TYPE_ISP: Image Signal Processor
> +* @AMD_IP_BLOCK_TYPE_RAS: RAS

Reliability, Availability, Serviceability.  I've fixed this up locally
and applied the patch.

Thanks,

Alex

>  * @AMD_IP_BLOCK_TYPE_NUM: Total number of IP block types
>  */
>  enum amd_ip_block_type {
> --
> An old man doll... just what I always wanted! - Clara
>
