Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA2EBB8FA2
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 18:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860510E159;
	Sat,  4 Oct 2025 16:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="RHrGAWnR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0FC10E159
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1759594420; bh=o0VJNtk+fex4FcVQUZ6R8JHfG23W+4ZASJpfX5z5ENo=;
 h=Subject:From:To:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=RHrGAWnRXq/NRiYvC8V6s72t60vW9h3veT6YeTkEp5+/TZ6iTbJDRsHYgjK8Gl2Zc0A1n6z5fbJED+vYOFK1HknpMGFCXtQRdtQ1yw2/FSwMgTOm0Tc/gVUBVUT9efZUQX0P9YKkN9HnMKnbr2Ae9oK5ubyDEpC5KLNasOob1ZCjpWL8uVU++wY5knzqe4wtBI2s577tDZtYuUzxkMm0cP7y5Wq0lNwoc3viu4n8nlgnvY076xBuTfd7fxWoITrQ0RLkFbyxMluLoZxIbtidh8WRwcUcyjVUC1WRM0IguQZxHQFqDJ0nMzX5QVHBWW7eqk56WlVTD0/IkmiiBjDnZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1759594420; bh=zkLysBu+v8mp2DuBFBKb6eT9YlwjT7RMermcf0bI/WM=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=tF/mj/L4OZ0OY6DaMvEnyLsGiLNfw5aUFplHLOTw+8pdzgFFqV+YkgLNHO+uyoPx2BGWl9XHOluzxCl9aajVlJDQDZc0Q4IjiwqAC/n3oZ8ZRrjt+2qh9oE7g3VjIUhFk4taRmZ4EGJmO3nRWW0+1RGxrD/ez5OfA/oIQz3kFTwe3CFxflKZufXh/MpGKXqqqGzwEDqvXVRI6R2IChkdV3EH/80GkVXsHkxT3n0CVX3NykxwKiwJdpqx94piN4/BoyxGuRaT9WiUGigVNgXxHcPEXK3moYBIz1489A3GHdugbbaEYx4E6svmc3Ai/JUOaQzAP1aK6FAbdaaOy43bHQ==
X-YMail-OSG: lpPUJBIVM1nQQUWY5sRICzMbaPkmBT.eDn7mXkP4sKCbZBcLivbgzNhYotPZhMQ
 xPX2Xjt2hz6Kv1bog5uivRanOg19pLIvNQLLFqgfRKjLBSnn2VcvShVgnuxEY4u1tw0WKuHEIfsp
 DKegXfkh.6h03z5ggbmljb8bQM2_mlecFPjK2OmqrHDsgTWiqipCK8Z14QBRtAAbcyGYVIdLwL88
 rOh71GXA_e4ljWbGQAHpBGiHxwwG1xYyYPf.ebpXuRrHnsEHqqI9jki9Gji.MGilkM5BqVL9A6cQ
 UtYJ_NqDkflZ82rAH_ewVoJGLVY6D8VtBcmh6RarP8hPO0nlyMkbefEc_9gtYbVcOR7d.g6Yloi8
 5yqA4yayVfpiUqLrpJVM5enEmzPBJQQ_R1wjxxxeEjFCvs6nMm3Bogj8FtbiIQjH43Xn8V0tMSrF
 saR7Xu8yzRmWkzO0Q98NR8m2gCUn8FfDaUZodoGgpPKI8tbGreyrvzmcVY71N5eEKV5NAIJNDByS
 aMzZB8k2RJ_xjeUYzxzp9BEperfBdb3IA2cnX1q_5a1YZB02bBZkZe9EoLLzN1qB81zVHhKg2Kdf
 uT.9R_OgDxelIQoEHQ8xGBF9xEXf2t.z.a4ZMbdfTtWMWA6QTZCKkdCwdLgj2voZYIPTEqn93IX9
 EZZx_emoYKNjMjOu2tUSpk2tSdtTj4.zpeVWfvmIkHK3XS95X8W64b8c6m.JHC3_hAFPA91Tn88Q
 _cYtnV_WkmMaAAzBUUtriT8PU6SkycgdK_jLuCNyeA5bmH9pyq1bisZEmLCZVjTkygAs.qBP9LGX
 Uj.rQVItED5CABt6j.31JgAWW3Gm7v8A50htUHFh93jF79wqcBSrYBrlw6Y7hVTCjFlxrTHZiFJh
 oVq.Tw.8YajMp4Kz8m4Xp37XrZ1Vfha1asbItLi3whvHT4NMl.f98rWBFo1ImNQjpZ_mpckQkjTy
 GDBoHqoGmr_my0uaoZoWyGcf7ULWvOupHExvUhKEm9x8jyY15WkaCSLf1u8bnGaSqCW62qFPPIrx
 H70owC5tV5kED1gS0iQgFeA8h5y65bJvhUUzGGRmERlrxahOMT3xgAE2qqqoTHvVppw2SPsmVoqz
 9f_30tGBtWkhoRLM2yKBZDdpgy064skZjnvHtr7Ve0..iqpAD_yHbBnM27ZAkCNEV2yb9FbVHN0O
 21KWg7BLODatGkXd7wgXeKykJTlVVlM.4PngP8AXS9_GD8hFww8orDZADZ4LS3h8Gxr1osMltmkp
 SR_9L777L0dBR5DAKNwu3ANSccD1A48_q8WOmmQ2HYHERMuMfIpEBHKGQacxtN.XWe_eUt4iChza
 _Ymb7ghCdjMXm6Ve6w69JamG3UMV5c5jrGKKM4eB9os1mue2XzNbt.2QrxpDNgBWw0B_ye1TQLZ4
 P5zMREy.m0Dw_4zdDNg.w8QcdQv6_mUKU9BB2mvpAilt01FaWk.ThXFiTSKZwJEOet3SUg5ZGNUn
 b3eLVTGZUJV_BIVy6MCh.Qm1kH0CF_Qep_rIKHQ_84vrMY8564Fy_Jj97b6EOFNxaWE9hLEyAN3A
 Jjq92cfdP9yzlZBXRRjA73zzRHBKBWsAVZ3CG7XfSkhQ9xGhX6.k5JEF5PXO_C0zEE04.84O5zdz
 B9tp3Iy9psV37a.K6v9tibCcNzOfBJU89y9Mkat1fUHiqWHhzGUcK3EGosXK9BNE7ICiXscXSoZJ
 6AfxMnu62740fIh6lkOtuVmZyEJZ1rgh251UPuJLjVH6dwGKCLzyS4VtFIkFE4gsfJBc8GtHxffz
 qs6VQ7PhjMJyiLJJu2sOheg0LN0S2uO5exRoD_kNhwO7ujRcMaSPaEfBp4mW.pSbxum6Jv_5H9lW
 MOgChK6ut2h4yPoZl4n_zFPjN_VvIsEEgCzxhQE09c5N6s39z7KehEGMcppt9DOhvI.XO4ldgpRQ
 CMtMztj1Tc66pbCGLXMdeX5h6viqlHS2ZgNzs_l3cSNb1Yvh3X.omVbcWCc.pvJQAuUCDiAbWBmp
 1eFI5VtyFeTlJhpDqw0GQ1ESOBBZVmpsEVDbz9ag3B66DLdns2t3MR7Ly1WZBBeEU.dL_VuIKoLh
 7wBw0f.bt94jNCqkwS3b0tA_jCxy6wU7MYewWRMPBF5o7gnZA34G7.PpKG_2bbDxILCBkXGhn3Ur
 swMOU_1wo4jJGZxbeN53wgr2QF5iVnnHgzYSfPf0vUm32Uh9HLjiI5sctsrRZ6Z16xFyP5Ic8RZR
 oNrMKhROy6q9lKA_2ndWHVKI2Ahz6zyFqA.5A.jFzo5clcHQE
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 16c46f4e-def7-4a04-a537-da3d54d9ecbb
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Sat, 4 Oct 2025 16:13:40 +0000
Received: by hermes--production-ir2-ccdb4f9c8-rkdr7 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2ad1631f89b5f0cb7bb9af10e2f9f060; 
 Sat, 04 Oct 2025 16:13:36 +0000 (UTC)
Message-ID: <d957bb721c9039287833ca0a9e2cebd60943c5f8.camel@aol.com>
Subject: Re: [PATCH v2] drm/gud: Use kmalloc_array() instead of kmalloc()
From: Ruben Wauters <rubenru09@aol.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, 
 jfalempe@redhat.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, 	skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Date: Sat, 04 Oct 2025 17:13:33 +0100
In-Reply-To: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
References: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24485
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Tue, 2025-09-23 at 09:51 +0100, Mehdi Ben Hadj Khelifa wrote:
> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
> calculation inside kmalloc is dynamic 'width * height' to avoid
> overflow.
>=20
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>

Acked-by: Ruben Wauters <rubenru09@aol.com>

> ---
> Changelog:
>=20
> Changes since v1:
> - Use of width as element count and height as size of element to
> eliminate the mentionned calculation and overflow issues.
>=20
>  drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pip=
e.c
> index 8d548d08f127..8898dc9393fb 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struc=
t drm_format_info *format
>  	height =3D drm_rect_height(rect);
>  	len =3D drm_format_info_min_pitch(format, 0, width) * height;
> =20
> -	buf =3D kmalloc(width * height, GFP_KERNEL);
> +	buf =3D kmalloc_array(width, height, GFP_KERNEL);
>  	if (!buf)
>  		return 0;
> =20
