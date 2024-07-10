Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7592D7A0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A864D10E85B;
	Wed, 10 Jul 2024 17:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FoeqODJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB58010E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GbV28KFhD87brtVDFw+BhhKlIQA7jI5QsmKqMA8AJfo=; b=FoeqODJbHUQGTWYx6/x2j7u30z
 RceWgUJY4KoyVVqQB4a6ZFWtb5U+WySYMHfxT5V2zbGn1x7I9fjtXg8b6n4lpTcmnDhF3U4at4Y9/
 +JnanqrRpPyVLWi0fEXNL063g4TNV4qDqSUKA55Qw5mcwnI4HVjj92VvrbEU05WNBhWvqMnyg37Af
 9/sZhZuDcFuDEW6u+SW9bormTEFIWYNQ001ch+5iDdRje2PdUBCd4lr4Q2Nsw1jQ8xRBCRsop/Adj
 GGJPzQI5aQzBwWD6zuHMK35UUuhPW7CZ13q9DOwW/TnkYrJn9vApcjYos8qWaVe1w+k1BuPeUZ4Er
 B1NrvwcA==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRbKF-00DLw2-UA; Wed, 10 Jul 2024 19:41:56 +0200
Message-ID: <d679ffde-d51c-4257-9927-f9fa2cf1ff0e@igalia.com>
Date: Wed, 10 Jul 2024 14:41:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/v3d: Align data types of internal and uapi
 counts
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-11-tursulin@igalia.com>
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
In-Reply-To: <20240710134130.17292-11-tursulin@igalia.com>
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

On 7/10/24 10:41, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> In the timestamp and performance extensions userspace type for counts is
> u32 so lets use unsigned in the kernel too.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_submit.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 8dae3ab5f936..34ecd844f16a 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -452,6 +452,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   {
>   	u32 __user *offsets, *syncs;
>   	struct drm_v3d_timestamp_query timestamp;
> +	unsigned int i;
>   	int err;
>   
>   	if (!job) {
> @@ -481,7 +482,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   	offsets = u64_to_user_ptr(timestamp.offsets);
>   	syncs = u64_to_user_ptr(timestamp.syncs);
>   
> -	for (int i = 0; i < timestamp.count; i++) {
> +	for (i = 0; i < timestamp.count; i++) {

Can't we just replace this line for
	for (u32 i = 0; i < timestamp.count; i++) {
or
	for (unsigned int i = 0; i < timestamp.count; i++) {
?

Well, anyway, just a minor nit, this is:

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

>   		u32 offset, sync;
>   
>   		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
> @@ -518,6 +519,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   {
>   	u32 __user *syncs;
>   	struct drm_v3d_reset_timestamp_query reset;
> +	unsigned int i;
>   	int err;
>   
>   	if (!job) {
> @@ -543,7 +545,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   
>   	syncs = u64_to_user_ptr(reset.syncs);
>   
> -	for (int i = 0; i < reset.count; i++) {
> +	for (i = 0; i < reset.count; i++) {
>   		u32 sync;
>   
>   		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
> @@ -576,7 +578,8 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   {
>   	u32 __user *offsets, *syncs;
>   	struct drm_v3d_copy_timestamp_query copy;
> -	int i, err;
> +	unsigned int i;
> +	int err;
>   
>   	if (!job) {
>   		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
