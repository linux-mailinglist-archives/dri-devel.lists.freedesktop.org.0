Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD792D7A8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D7510E156;
	Wed, 10 Jul 2024 17:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="j6TrAY0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF2610E156
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nBaCweBf3Xq24uRZOCV/3idX514GH4oKa/l5ONWCh6M=; b=j6TrAY0tGRvi6s1hoGpqleHTV1
 K1s/DgctLpfkpqVkUh1DxGNdHY+aS1Gs3088maYvO9ayEhFySXN3HsCjE/c6q4WVAXT6elG7kCrvj
 DFEMelqTqfetRm8Pgq3nKRS5Xi+lPx0L5/WQylopn6Xg7oH0A6y82HwCiW7DCaNWV/OaUMqsDzwp6
 vhAuFQUMvYjHVvBfBoRaIl0x844+cShfy72yEPQ4u09jS23nJswnu06+/UqC+d7bZOiR9pwW6e0ff
 kZcKG8/dhf1pxGHPPWc0MBWaxBbJfZu3TanrUjkvJ6E5YIqZxqnzg641eM8b+rLfbO6NoNbuqDpV7
 AXrbibEw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRbLw-00DLxN-5f; Wed, 10 Jul 2024 19:43:40 +0200
Message-ID: <93222a05-06e0-4dc7-b000-341f113d6e61@igalia.com>
Date: Wed, 10 Jul 2024 14:43:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/v3d: Add some local variables in
 queries/extensions
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-12-tursulin@igalia.com>
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
In-Reply-To: <20240710134130.17292-12-tursulin@igalia.com>
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
> Add some local variables to make the code a bit less verbose, with the
> main benefit being pulling some lines to under 80 columns wide.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I'd prefer `query_info`, but anyway:

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_submit.c | 79 +++++++++++++++++---------------
>   1 file changed, 42 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 34ecd844f16a..b0c2a8e9cb06 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -452,6 +452,7 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   {
>   	u32 __user *offsets, *syncs;
>   	struct drm_v3d_timestamp_query timestamp;
> +	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
>   	unsigned int i;
>   	int err;
>   
> @@ -473,10 +474,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   
>   	job->job_type = V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY;
>   
> -	job->timestamp_query.queries = kvmalloc_array(timestamp.count,
> -						      sizeof(struct v3d_timestamp_query),
> -						      GFP_KERNEL);
> -	if (!job->timestamp_query.queries)
> +	qinfo->queries = kvmalloc_array(timestamp.count,
> +					sizeof(struct v3d_timestamp_query),
> +					GFP_KERNEL);
> +	if (!qinfo->queries)
>   		return -ENOMEM;
>   
>   	offsets = u64_to_user_ptr(timestamp.offsets);
> @@ -490,20 +491,20 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   			goto error;
>   		}
>   
> -		job->timestamp_query.queries[i].offset = offset;
> +		qinfo->queries[i].offset = offset;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
>   			err = -EFAULT;
>   			goto error;
>   		}
>   
> -		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> -		if (!job->timestamp_query.queries[i].syncobj) {
> +		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!qinfo->queries[i].syncobj) {
>   			err = -ENOENT;
>   			goto error;
>   		}
>   	}
> -	job->timestamp_query.count = timestamp.count;
> +	qinfo->count = timestamp.count;
>   
>   	return 0;
>   
> @@ -519,6 +520,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   {
>   	u32 __user *syncs;
>   	struct drm_v3d_reset_timestamp_query reset;
> +	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
>   	unsigned int i;
>   	int err;
>   
> @@ -537,10 +539,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   
>   	job->job_type = V3D_CPU_JOB_TYPE_RESET_TIMESTAMP_QUERY;
>   
> -	job->timestamp_query.queries = kvmalloc_array(reset.count,
> -						      sizeof(struct v3d_timestamp_query),
> -						      GFP_KERNEL);
> -	if (!job->timestamp_query.queries)
> +	qinfo->queries = kvmalloc_array(reset.count,
> +					sizeof(struct v3d_timestamp_query),
> +					GFP_KERNEL);
> +	if (!qinfo->queries)
>   		return -ENOMEM;
>   
>   	syncs = u64_to_user_ptr(reset.syncs);
> @@ -548,20 +550,20 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   	for (i = 0; i < reset.count; i++) {
>   		u32 sync;
>   
> -		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
> +		qinfo->queries[i].offset = reset.offset + 8 * i;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
>   			err = -EFAULT;
>   			goto error;
>   		}
>   
> -		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> -		if (!job->timestamp_query.queries[i].syncobj) {
> +		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!qinfo->queries[i].syncobj) {
>   			err = -ENOENT;
>   			goto error;
>   		}
>   	}
> -	job->timestamp_query.count = reset.count;
> +	qinfo->count = reset.count;
>   
>   	return 0;
>   
> @@ -578,6 +580,7 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   {
>   	u32 __user *offsets, *syncs;
>   	struct drm_v3d_copy_timestamp_query copy;
> +	struct v3d_timestamp_query_info *qinfo = &job->timestamp_query;
>   	unsigned int i;
>   	int err;
>   
> @@ -599,10 +602,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   
>   	job->job_type = V3D_CPU_JOB_TYPE_COPY_TIMESTAMP_QUERY;
>   
> -	job->timestamp_query.queries = kvmalloc_array(copy.count,
> -						      sizeof(struct v3d_timestamp_query),
> -						      GFP_KERNEL);
> -	if (!job->timestamp_query.queries)
> +	qinfo->queries = kvmalloc_array(copy.count,
> +					sizeof(struct v3d_timestamp_query),
> +					GFP_KERNEL);
> +	if (!qinfo->queries)
>   		return -ENOMEM;
>   
>   	offsets = u64_to_user_ptr(copy.offsets);
> @@ -616,20 +619,20 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   			goto error;
>   		}
>   
> -		job->timestamp_query.queries[i].offset = offset;
> +		qinfo->queries[i].offset = offset;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
>   			err = -EFAULT;
>   			goto error;
>   		}
>   
> -		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> -		if (!job->timestamp_query.queries[i].syncobj) {
> +		qinfo->queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!qinfo->queries[i].syncobj) {
>   			err = -ENOENT;
>   			goto error;
>   		}
>   	}
> -	job->timestamp_query.count = copy.count;
> +	qinfo->count = copy.count;
>   
>   	job->copy.do_64bit = copy.do_64bit;
>   	job->copy.do_partial = copy.do_partial;
> @@ -712,6 +715,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   				     struct drm_v3d_extension __user *ext,
>   				     struct v3d_cpu_job *job)
>   {
> +	struct v3d_performance_query_info *qinfo = &job->performance_query;
>   	struct drm_v3d_reset_performance_query reset;
>   	int err;
>   
> @@ -730,10 +734,10 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   
>   	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
>   
> -	job->performance_query.queries = kvmalloc_array(reset.count,
> -							sizeof(struct v3d_performance_query),
> -							GFP_KERNEL);
> -	if (!job->performance_query.queries)
> +	qinfo->queries = kvmalloc_array(reset.count,
> +					sizeof(struct v3d_performance_query),
> +					GFP_KERNEL);
> +	if (!qinfo->queries)
>   		return -ENOMEM;
>   
>   	err = copy_query_info(qinfo, reset.count, reset.nperfmons,
> @@ -743,8 +747,8 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   	if (err)
>   		return err;
>   
> -	job->performance_query.count = reset.count;
> -	job->performance_query.nperfmons = reset.nperfmons;
> +	qinfo->count = reset.count;
> +	qinfo->nperfmons = reset.nperfmons;
>   
>   	return 0;
>   }
> @@ -754,6 +758,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   					  struct drm_v3d_extension __user *ext,
>   					  struct v3d_cpu_job *job)
>   {
> +	struct v3d_performance_query_info *qinfo = &job->performance_query;
>   	struct drm_v3d_copy_performance_query copy;
>   	int err;
>   
> @@ -775,10 +780,10 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   
>   	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
>   
> -	job->performance_query.queries = kvmalloc_array(copy.count,
> -							sizeof(struct v3d_performance_query),
> -							GFP_KERNEL);
> -	if (!job->performance_query.queries)
> +	qinfo->queries = kvmalloc_array(copy.count,
> +					sizeof(struct v3d_performance_query),
> +					GFP_KERNEL);
> +	if (!qinfo->queries)
>   		return -ENOMEM;
>   
>   	err = copy_query_info(qinfo, copy.count, copy.nperfmons,
> @@ -788,9 +793,9 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	if (err)
>   		return err;
>   
> -	job->performance_query.count = copy.count;
> -	job->performance_query.nperfmons = copy.nperfmons;
> -	job->performance_query.ncounters = copy.ncounters;
> +	qinfo->count = copy.count;
> +	qinfo->nperfmons = copy.nperfmons;
> +	qinfo->ncounters = copy.ncounters;
>   
>   	job->copy.do_64bit = copy.do_64bit;
>   	job->copy.do_partial = copy.do_partial;
