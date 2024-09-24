Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47843984F36
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2C810E905;
	Tue, 24 Sep 2024 23:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TRHdvqKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E282410E905
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KnkPkShAJnJABVLM8tVZtzLNR3Lj0DvaOqN+FYM6Vbo=; b=TRHdvqKYXB+j4l2H3rK0qWQ5gD
 p/se91807EjW7EMQGJs8IvFjOgBOxjylo1cSlHQMrlp6oOK/S+gDnA6ZszMyApgfmkLvjPmmh/JU0
 YGDU84P24tOqk10Eoy3AfjLij9n6uBs/B5qblVR5sQmJsi9FtUZZE/Hpdjpl+nDUSg3SVN8dgtrEr
 CB7mmb0195k4AAzlSJn8EuY64FF0hgqVrVDWadWIrPuqMa6aJFmQilyKZ5+d+K5V3XEj6ilxmJVZN
 RyzvB4bFQowHRdO7snqIO4S252Tk0Kv2AVCA6OaWLgzgYi8qRgrzTjPZezlqByCimgZoCWTcRk7Yg
 Bu4xkyFQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1stFRE-000eye-II; Wed, 25 Sep 2024 01:59:24 +0200
Message-ID: <70f98efb-728d-4a20-9b6d-04f0aff41cac@igalia.com>
Date: Tue, 24 Sep 2024 20:59:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Suppress context imbalance sparse warning
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240912-vkms-warnings-v1-1-59f3e13ea8e5@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240912-vkms-warnings-v1-1-59f3e13ea8e5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Louis,

On 9/12/24 12:25, Louis Chauvet wrote:
> The functions `vkms_crtc_atomic_begin` and `vkms_crtc_atomic_flush` are
> responsible for locking and unlocking a mutex, respectively. Add the
> `__acquires` and `__releases` annotations to these functions to prevent
> the associated sparse warning about context imbalance.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

When I was applying this patch, I got the following warning:

137f51649b04 (HEAD -> drm-misc-next) drm/vkms: Suppress context 
imbalance sparse warning
-:4: WARNING:EMAIL_SUBJECT: A patch subject line should describe the 
change not the tool that found it
#4:
Subject: [PATCH] drm/vkms: Suppress context imbalance sparse warning

total: 0 errors, 1 warnings, 0 checks, 14 lines checked

Therefore, before pushing the patch, I changed the commit title to
"drm/vkms: Suppress context imbalance detected by sparse warning". Hope
you don't mind.

Applied to misc/kernel.git (drm-misc-next).

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_crtc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 40b4d084e3ceef9e1e24b7338efdd9253afee8d6..2ad164b518fb93f5b6b86948116ff7ed97770b60 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -232,6 +232,7 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>   
>   static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>   				   struct drm_atomic_state *state)
> +	__acquires(&vkms_output->lock)
>   {
>   	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
>   
> @@ -243,6 +244,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>   
>   static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>   				   struct drm_atomic_state *state)
> +	__releases(&vkms_output->lock)
>   {
>   	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
>   
> 
> ---
> base-commit: d2194256049910d286cd6c308c2689df521d8842
> change-id: 20240912-vkms-warnings-e0e331bc5e6d
> 
> Best regards,
