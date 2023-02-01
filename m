Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B767D702
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 21:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7D310E2DD;
	Thu, 26 Jan 2023 20:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECA810E294;
 Thu, 26 Jan 2023 17:07:43 +0000 (UTC)
Received: from mercury (dyndsl-037-138-191-219.ewe-ip-backbone.de
 [37.138.191.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7FC3E6602E7D;
 Thu, 26 Jan 2023 17:07:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674752861;
 bh=TJwB9xWefUtenAJhobcnuA3/dr44yh/1qZH05naV3dA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HIAeawkSMl4wLK9atphFO2PYIuQtn0mXWrQTGJkp27Vvwen4RmNJXIKy0KOcMN2qu
 MGji/BoqRh//5quIKkg+7Jg9a4rlT6zYnOxKnHRve8IRt32uZ0O2J9C6ByA7KSG9ni
 ooI+f+xDzdj/4Xv/XqAW1ZMOqMbxlnaE69Ns4AaVsCb09DHvVD+xjXrJ7HkcJ65ZDs
 0FKkR9qOOchTbFQKw+Lbe8GJsd/K96q/WWSPWtyPUY4G0yRJ/G34tsJUBI/vL5q95x
 a6dIJ/I/0Glk/75yhzfiBv6PLPN/HUTuWOcS4vpdAGRdicde5HTb77Vj3shLRE2rZN
 snAuQFm3yL5CQ==
Received: by mercury (Postfix, from userid 1000)
 id 8DAD710609C7; Thu, 26 Jan 2023 18:07:39 +0100 (CET)
Date: Thu, 26 Jan 2023 18:07:39 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 3/6] mm: replace vma->vm_flags direct modifications
 with modifier calls
Message-ID: <20230126170739.mlka2jivn3mfstyf@mercury.elektranox.org>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-4-surenb@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qcyccrleajamxo75"
Content-Disposition: inline
In-Reply-To: <20230125083851.27759-4-surenb@google.com>
X-Mailman-Approved-At: Thu, 26 Jan 2023 20:58:31 +0000
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, leewalsh@google.com,
 dri-devel@lists.freedesktop.org, perex@perex.cz, jglisse@google.com,
 arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org,
 qianweili@huawei.com, linux-samsung-soc@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com,
 linux-acpi@vger.kernel.org, rientjes@google.com,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org, minchan@google.com,
 robert.jarzmik@free.fr, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com,
 viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com,
 tglx@linutronix.de, ldufour@linux.ibm.com, linux-sgx@vger.kernel.org,
 martin.petersen@oracle.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
 linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com,
 andrii@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-graphics-maintainer@vmware.com,
 kernel-team@android.com, jayalk@intworks.biz, soheil@google.com,
 selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, shakeelb@google.com,
 haojian.zhuang@gmail.com, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net,
 muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com,
 tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com,
 jasowang@redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com,
 linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org,
 dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org,
 gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de,
 mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org,
 hughlynch@google.com, tfiga@chromium.org, linux-xfs@vger.kernel.org,
 zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org,
 bigeasy@linutronix.de, alexandre.torgue@foss.st.com, dhowells@redhat.com,
 linux-mm@kvack.org, ray.huang@amd.com, adilger.kernel@dilger.ca,
 kuba@kernel.org, sparclinux@vger.kernel.org, anton.ivanov@cambridgegreys.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at,
 x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com,
 intel-gfx@lists.freedesktop.org, paulmck@kernel.org, jannh@google.com,
 chao@kernel.org, liam.howlett@oracle.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz,
 dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com,
 lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qcyccrleajamxo75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 25, 2023 at 12:38:48AM -0800, Suren Baghdasaryan wrote:
> Replace direct modifications to vma->vm_flags with calls to modifier
> functions to be able to track flag changes and to keep vma locking
> correctness.
>=20
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
> [...]
>  drivers/hsi/clients/cmt_speech.c                   |  2 +-
>  120 files changed, 188 insertions(+), 199 deletions(-)
> [...]
> diff --git a/drivers/hsi/clients/cmt_speech.c b/drivers/hsi/clients/cmt_s=
peech.c
> index 8069f795c864..952a31e742a1 100644
> --- a/drivers/hsi/clients/cmt_speech.c
> +++ b/drivers/hsi/clients/cmt_speech.c
> @@ -1264,7 +1264,7 @@ static int cs_char_mmap(struct file *file, struct v=
m_area_struct *vma)
>  	if (vma_pages(vma) !=3D 1)
>  		return -EINVAL;
> =20
> -	vma->vm_flags |=3D VM_IO | VM_DONTDUMP | VM_DONTEXPAND;
> +	set_vm_flags(vma, VM_IO | VM_DONTDUMP | VM_DONTEXPAND);
>  	vma->vm_ops =3D &cs_char_vm_ops;
>  	vma->vm_private_data =3D file->private_data;
> =20

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--qcyccrleajamxo75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmPSs1EACgkQ2O7X88g7
+pquLBAAkw9lw9lxNRCI6jvqLy98JsUBgSQigNB6Eh8JVWsySHMm1OszFCcvTpoc
vinC/VPMOa6JwEw5e9naXRF2UJahO+Cx+e5MYIKos3QyIUPfi0YM7Cv96h6+c4l/
NdcxLS8+9ElitTuA47UVgPSeZwzdZ1kU5VUV1X2fx+6aGA+dBfWVBgWDqU6AB0Sa
ehU4betso5Ypl26YEmLPHmY+8Xx2jXNwwBEgsHgO2/YjRn9YPDeMAqb4lWs99h0d
nUV1VqwTClRrExtNDvidHryknmyCIBpYt38gn0i9+uIf9mFoBmUDN+/zAdRguGBT
r1CQAwvRvHmEyGJ4dp1nijyt/PWxDBlCWytlmzXrK/rkeH8sQCRdCr9L83/d5DM0
iU98ehmbH9kx8rD4y0L91xmsnegNYNKSfAvz3EP4KYFOHjTw2SOCYoazPu3z62bN
d3HL+08LeZpm1XwVPydZqBd5UpBK8NaQYCJ3BjsLUefsSJE+SWzsnoYFnbUrL1X9
1XfU6LGtVvjCPUsjk7oqh5PjtRGQsdtUhSZJLwNzTeh4I0nSzL1pj8vRFZ7UTcV4
RmFYsjBbKhja2fC13eM4tKzfx53harnHVNuUPw2aoLKshpkQaOTUqWBnRXtbJZkb
dSRKObxfPlHVI+awnfN6owpXF86Owew2+XJcXILOPxaBk8PI/Ns=
=/0TB
-----END PGP SIGNATURE-----

--qcyccrleajamxo75--
