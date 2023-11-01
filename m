Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAF7DEE38
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 09:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EAF10E14D;
	Thu,  2 Nov 2023 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic301-3.consmr.mail.bf2.yahoo.com
 (sonic301-3.consmr.mail.bf2.yahoo.com [74.6.129.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF7110E7DA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 22:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1698876799; bh=A5fLCxlOX6Qi4IQINVJr7qJY+CysOC2/996hIGyqf5w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=q5q4cf055yScOcA+8Yt79SSIOiArFlMxShVudjld+MBaD8cl1JAiAwLeJqT0N4VLSkzgv7F6H8cugddAuMhOzkqeuAB1l5jMTQq+73So+W3Ot3m5n7BsKku7sbxaa8QnLPXESq4342mM57Rh8L+nKQLxwi3Lui0ttwyTtiUYtsKZKAtyeZQAg8FBxZ0huTBzVMaZhgiqt6voUh+WbFxFQAJMHu3tfwqnl9MMw/vMAY4tuZ+09QAoiPiJBcKdkezC1wvsXnyQHKYuxXQlzgGmp3AvHsJoni5u4mtu8jXRCHvA+/CpLRPBDK35DNYuCFHjf1RPUT0Ji2G+TuGkjyeN7g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1698876799; bh=QU0WWIIvgiC6BB/EpOGStLBX1RRXUAZ+1Arw1NF+Ko4=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=Qnlt3c0TI9Q3CMX69r5PdMZLr4wVCwrFUfq6J30BrChOpjKKPN0ejV5J3eSEpqMw6RkYtFSLEFoWnBEKPALD9SXzZpA7XybLdz7B49d7npqWZVRrAFeOMbRlumPxD1DeJ6kBB6Un/Dft+mmiTHmFb65OyZpPwMAGcy/sf+9ggEFEUWbj0jiBliA6Tne+W8RV1WgIYkUxZWZko+nf4J0IQHI+3NmNvfcyWybu30xrEM2V2YtqTo2OJShrfMl/adwurIyNyqD8jK0Qhxnjvb5sWa5NTVCMYwW6V3yRp9U5/cA43bz1VIOd9tKDO0zAQZhNWGtJtQbXABm8JdPqHftYPQ==
X-YMail-OSG: RIQdKrEVM1n8VdYqDaUGA2ev15I7pnu_kZbO81.nBnMN3k1fuT2TG63SGrYPYI6
 CgwvDd8kfhd6qVwNLiwGeNIE.09hDGipftl8Hg6bxmLBvmPu2RAIiUknn8wzqgeTkn6_FJwmEGsw
 w_Ss89obbHHDvB7sNQAfmNHQgC0mH2r.w_zbvLlMGUgJ7IJoSt05rDImXMuXtXwdMXbBfFpPNOej
 F_JP9CCZDjZsjixjE7uA52GX.YlusHt7iykpIRXdmerxZgc_FBiZ2fVzL_u9f77hyCTJXNiEXcYf
 gATRPIbMix._zaDj.oCX50MFIReXxzYFtyGBHz0ZZOToS3JTvCcQvThk.1wKqeRC08G1lFSBna.q
 i780UfqCwGamVIvhTY5q6u2wWAjvJI42I.X6cCeRhAdRL6MXYF6EbBoK5W.MdnUT196VDmXSPkuu
 Tan_Z9g9uyvO6fMspu_mqil0mSzGIMPqaSY46E0p3RpybMM9suD.zVRFPt1SyPBby_pFn4D5Y3g3
 GwRE5ElpPBPUnZlp8IIpTwuo5xCJVllcL1ChwVfJJ662sRLiL.48RzbwJhIz7Au_.PDkZvVz6Mir
 sCSwWYJSuoonVx7s9LUlUQKEAAWFltItXAoF0LOqRYgtYILkxq4R2LvPiiGKeJHY9Ta578uT5UvO
 xSSEmrFfHxzl_MmUujpySQe.0dtgDefN717oTER8muxrGqf_T0L34G5U.bUnV0HXd1PiEMyo7tlT
 5iA8c9Flqpkct4ClY2Lg4uvH4zOnzeawcIEh6flbGUaaorh4zKGo2TDET8ALtclxNDLfSdb6fPua
 aBnc6DZwdogsdkKy6fsr8zm.5DPDY4rkdrrXLot16oNt5g2BaNQUbIXXYuyKfIYhGh1XJY8N6dm.
 5lk6vrVsmKeBRdfoOfVsr1OAlLuBJESMdC5NlrAZ9UGpwoXJsgv8lrz3nRW7z_iA4OA.9pHJhEQz
 XZXv1nIVGLoiCPD1.LoEcbJWtzcGr8_c9hT16E6Boq8Jjy1Keuw2s.C0EHh8EpswoWbSS7IlDV8w
 xskYlMWbzSCeTzyPpi6OMwsfdGKwWE8oFtzCa1w2H98KpCTFaZ3SPD_V0lZ2_KiBNyHIejicoDFw
 cT.dBdpgvfQZvbi46o2201L7s6fassNI1cI1rHrbwqEUkIPU8XaHbfomqM5htguTPq3kYnVyoUCn
 3BpuuoZ2e9VYELSPgo3dyFWorBv0o37B2xkgsad9MbsBBJJEX_EU2o3WnmlOhTI9WO2h1uBkzFZo
 8tEMsGJJLEkJtA9Jzyyp3s4VAEbTDKSyzH9GDsWi1vALJWgoQ4tx8lIx_5ajnBWOSRtBjXMts5mm
 i6Vjs.sGPyscRtHZ42xcQXMh7QvLYmF3y0j4YmDBSgIN8Bbz9fJPceGI1vszHMRVvwhkgkMBvLz8
 sd8La3AySRewDxc_3wIjS8YU1e57RdeZe6YDgqnc0UNYVevAk8Uh0hIyfBsTDIzGyGRcpaBT6ZQn
 _WZz2mFd48UNZOEogt_NLscRzrwDHJVPr9QrhhGpkF8rdJtV9jYzzshPkP.VpyNV.Fuo7nQMV1tm
 Ei_It6pwbQWd3Car3nkLHfgeQ_AlFT3mQogWKaS1PS0Su.OSmOwEAovPSr9TrO88JobfqAUBQjni
 MKOqWyYj5gSTHj8rDiY2W.wf5RvT8DB38H4IhuNyszT9ZBfZOKba28gyjBYpwyN6ORC.G7p0ntwY
 JHRQ63U5suh4nwIoHaxalzWLwesrfwqJ1c3qyAIXY.ypZ76DROS4Drbs6H2sQ1b2ExXV_rtejPnY
 KYxOIEt2Ym1QN.zyRfj7Vm9bEntqyOJF9Hu._Nzp5OAvrPvbzddHu8vRkjqyztpB8UtOalZZ6DRN
 GTKzDUnFOwIy6noTvXwPonhvn_LG_aRebOpXJprleh_1F.OcscLlrQAD4eabqZ4TKkxZCAzQA.Xq
 jrI31iLjSLQWeaT9sHUHPHcDGKLizHGgVDqLrEM7lQ5i7pdyobKkJ_y0ZSXbPp0_a5u0XBX3D4Y_
 hy4lbgnwJ44q3tTKhH9kAMSMKPPnyMuqe.PxXMIAahmNE9dLaZiQS3JWjAypbFpNopl1mPqeg6WK
 NwDfv8fQSpOxASUNBgoETbtxF1W6XJpbLYQI5Uwa_KsRYgbu0h8Whga5gqeDrbnFRuH6JJZw6MKb
 N1aiuE24ZK4KhHNf07f0NUYwEukLjuT5aUDTJ5ZqhQTW0pjVIxyvZlFKCcRBjmvcgsp8jj2Qvf8J
 tdToHzHGnGC_5OTVXJtrwiAOfRg8auNiimA--
X-Sonic-MF: <ltuikov@yahoo.com>
X-Sonic-ID: 5ee4e905-5b30-4d94-86f3-50d9057dcbf1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.bf2.yahoo.com with HTTP; Wed, 1 Nov 2023 22:13:19 +0000
Received: by hermes--production-gq1-59b5df67b6-pfhm9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d085e257e01069cc0ecdd6c4f569a5f2; 
 Wed, 01 Nov 2023 22:13:12 +0000 (UTC)
Message-ID: <7f3e714a-de92-45b6-a4d8-f2bd732f0a8e@yahoo.com>
Date: Wed, 1 Nov 2023 18:13:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH v8 3/5] drm/sched: Split free_job into own work item
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231031032439.1558703-1-matthew.brost@intel.com>
 <20231031032439.1558703-4-matthew.brost@intel.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov@yahoo.com>
Autocrypt: addr=ltuikov@yahoo.com; keydata=
 xjMEY1iY3RYJKwYBBAHaRw8BAQdAztvSbBwaB/vdNl5pesHRoPAtz6q7FubAC/+uHrdz+pHN
 IEx1YmVuIFR1aWtvdiA8bHR1aWtvdkB5YWhvby5jb20+wpkEExYKAEEWIQSKgo9XOusXzVHh
 zclSGjP3JwwE5gUCY1iY3QIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAK
 CRBSGjP3JwwE5gQIAQCQlrDeoaSkXdLAIPrSEzXuO0sV82BoGYQm0jpoyo/4gwD+I7wHs4Te
 oc8nwRrPY1I8ZF1+oQFiFmjMTBX3YHUP4gjOOARjWJjdEgorBgEEAZdVAQUBAQdAnGkg+lur
 +b3MG9dFgsjFpkkHiRxv8ZaPGHplcpbWPl8DAQgHwn4EGBYKACYWIQSKgo9XOusXzVHhzclS
 GjP3JwwE5gUCY1iY3QIbDAUJCWYBgAAKCRBSGjP3JwwE5vAOAQCR916F7aH5bYphUAzEbjG5
 /RyCzUvf86AyV+Qjnd6K7gD+MW5eAIC6B0W6AgorciEWygcmKAqgn2YfI09vnHB1CwY=
In-Reply-To: <20231031032439.1558703-4-matthew.brost@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D8vymITujq100UNLWMlPvvyr"
X-Mailer: WebService/1.1.21890
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Thu, 02 Nov 2023 08:35:03 +0000
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov89@gmail.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, mcanal@igalia.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, lina@asahilina.net,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------D8vymITujq100UNLWMlPvvyr
Content-Type: multipart/mixed; boundary="------------LIOGTSxFsqfaU31x0s06VnDW";
 protected-headers="v1"
From: Luben Tuikov <ltuikov@yahoo.com>
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: dakr@redhat.com, mcanal@igalia.com, frank.binns@imgtec.com,
 donald.robson@imgtec.com, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, thomas.hellstrom@linux.intel.com,
 faith.ekstrand@collabora.com, boris.brezillon@collabora.com,
 airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com,
 robdclark@chromium.org, lina@asahilina.net, ltuikov89@gmail.com
Message-ID: <7f3e714a-de92-45b6-a4d8-f2bd732f0a8e@yahoo.com>
Subject: Re: [PATCH v8 3/5] drm/sched: Split free_job into own work item
References: <20231031032439.1558703-1-matthew.brost@intel.com>
 <20231031032439.1558703-4-matthew.brost@intel.com>
In-Reply-To: <20231031032439.1558703-4-matthew.brost@intel.com>

--------------LIOGTSxFsqfaU31x0s06VnDW
Content-Type: multipart/mixed; boundary="------------nrOzQmOHQWEHrTSbhSBRi3vv"

--------------nrOzQmOHQWEHrTSbhSBRi3vv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-10-30 23:24, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicate=
d
> work item for each. This aligns with the design and intended use of wor=
k
> queues.
>=20
> v2:
>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>      timestamp in free_job() work item (Danilo)
> v3:
>   - Drop forward dec of drm_sched_select_entity (Boris)
>   - Return in drm_sched_run_job_work if entity NULL (Boris)
> v4:
>   - Replace dequeue with peek and invert logic (Luben)
>   - Wrap to 100 lines (Luben)
>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
> v5:
>   - Drop peek argument, blindly reinit idle (Luben)
>   - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_don=
e (Luben)
>   - Update work_run_job & work_free_job kernel doc (Luben)
> v6:
>   - Do not move drm_sched_select_entity in file (Luben)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 146 +++++++++++++++++--------=

>  include/drm/gpu_scheduler.h            |   4 +-
>  2 files changed, 101 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index d1ae05bded15..3b1b2f8eafe8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -265,6 +265,32 @@ static void drm_sched_run_job_queue(struct drm_gpu=
_scheduler *sched)
>  		queue_work(sched->submit_wq, &sched->work_run_job);
>  }
> =20
> +/**
> + * drm_sched_free_job_queue - enqueue free-job work
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler =
*sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job =3D list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -284,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_job=
 *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	drm_sched_run_job_queue(sched);
> +	drm_sched_free_job_queue(sched);
>  }
> =20
>  /**
> @@ -943,8 +969,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler=
 *sched)
>  						typeof(*next), list);
> =20
>  		if (next) {
> -			next->s_fence->scheduled.timestamp =3D
> -				dma_fence_timestamp(&job->s_fence->finished);
> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +				     &next->s_fence->scheduled.flags))
> +				next->s_fence->scheduled.timestamp =3D
> +					dma_fence_timestamp(&job->s_fence->finished);
>  			/* start TO timer for next job */
>  			drm_sched_start_timeout(sched);
>  		}
> @@ -994,7 +1022,40 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sc=
hed_list,
>  EXPORT_SYMBOL(drm_sched_pick_best);
> =20
>  /**
> - * drm_sched_run_job_work - main scheduler thread
> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler =
*sched)
> +{
> +	if (drm_sched_select_entity(sched))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_work - worker to call free_job
> + *
> + * @w: free job work
> + */
> +static void drm_sched_free_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> +	struct drm_sched_job *cleanup_job;
> +
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
> +
> +	cleanup_job =3D drm_sched_get_cleanup_job(sched);
> +	if (cleanup_job) {
> +		sched->ops->free_job(cleanup_job);
> +
> +		drm_sched_free_job_queue_if_done(sched);
> +		drm_sched_run_job_queue_if_ready(sched);
> +	}
> +}
> +
> +/**
> + * drm_sched_run_job_work - worker to call run_job
>   *
>   * @w: run job work
>   */
> @@ -1003,65 +1064,51 @@ static void drm_sched_run_job_work(struct work_=
struct *w)
>  	struct drm_gpu_scheduler *sched =3D
>  		container_of(w, struct drm_gpu_scheduler, work_run_job);
>  	struct drm_sched_entity *entity;
> -	struct drm_sched_job *cleanup_job;
> +	struct dma_fence *fence;
> +	struct drm_sched_fence *s_fence;
> +	struct drm_sched_job *sched_job;
>  	int r;
> =20
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
> =20
> -	cleanup_job =3D drm_sched_get_cleanup_job(sched);
>  	entity =3D drm_sched_select_entity(sched);
> +	if (!entity)
> +		return;
> =20
> -	if (!entity && !cleanup_job)
> +	sched_job =3D drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
> +		complete_all(&entity->entity_idle);
>  		return;	/* No more work */
> +	}
> =20
> -	if (cleanup_job)
> -		sched->ops->free_job(cleanup_job);
> -
> -	if (entity) {
> -		struct dma_fence *fence;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -
> -		sched_job =3D drm_sched_entity_pop_job(entity);
> -		if (!sched_job) {
> -			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> -		}
> -
> -		s_fence =3D sched_job->s_fence;
> -
> -		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
> +	s_fence =3D sched_job->s_fence;
> =20
> -		trace_drm_run_job(sched_job, entity);
> -		fence =3D sched->ops->run_job(sched_job);
> -		complete_all(&entity->entity_idle);
> -		drm_sched_fence_scheduled(s_fence, fence);
> +	atomic_inc(&sched->hw_rq_count);
> +	drm_sched_job_begin(sched_job);
> =20
> -		if (!IS_ERR_OR_NULL(fence)) {
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> +	trace_drm_run_job(sched_job, entity);
> +	fence =3D sched->ops->run_job(sched_job);
> +	complete_all(&entity->entity_idle);
> +	drm_sched_fence_scheduled(s_fence, fence);
> =20
> -			r =3D dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r =3D=3D -ENOENT)
> -				drm_sched_job_done(sched_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else {
> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -					   PTR_ERR(fence) : 0);
> -		}
> +	if (!IS_ERR_OR_NULL(fence)) {
> +		/* Drop for original kref_init of the fence */
> +		dma_fence_put(fence);
> =20
> -		wake_up(&sched->job_scheduled);
> +		r =3D dma_fence_add_callback(fence, &sched_job->cb,
> +					   drm_sched_job_done_cb);
> +		if (r =3D=3D -ENOENT)
> +			drm_sched_job_done(sched_job, fence->error);
> +		else if (r)
> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +	} else {
> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +				   PTR_ERR(fence) : 0);
>  	}
> =20
> -again:
> -	drm_sched_run_job_queue(sched);
> +	wake_up(&sched->job_scheduled);
> +	drm_sched_run_job_queue_if_ready(sched);
>  }
> =20
>  /**
> @@ -1145,6 +1192,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>  	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
>  	sched->pause_submit =3D false;
> @@ -1274,6 +1322,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_schedul=
er *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, true);
>  	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_stop);
> =20
> @@ -1286,5 +1335,6 @@ void drm_sched_wqueue_start(struct drm_gpu_schedu=
ler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
>  	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e0e7c4eb57d9..677ba96759ab 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -479,9 +479,10 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_run_job
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_jo=
b
>   * @timeout_wq: workqueue used to queue @work_tdr
>   * @work_run_job: work which calls run_job op of each scheduler.
> + * @work_free_job: work which calls free_job op of each scheduler.
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout afte=
r the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queu=
e.
> @@ -511,6 +512,7 @@ struct drm_gpu_scheduler {
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
>  	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>  	struct delayed_work		work_tdr;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;

--------------nrOzQmOHQWEHrTSbhSBRi3vv
Content-Type: application/pgp-keys; name="OpenPGP_0x521A33F7270C04E6.asc"
Content-Disposition: attachment; filename="OpenPGP_0x521A33F7270C04E6.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEY1iY3RYJKwYBBAHaRw8BAQdAztvSbBwaB/vdNl5pesHRoPAtz6q7FubAC/+u
Hrdz+pHNIEx1YmVuIFR1aWtvdiA8bHR1aWtvdkB5YWhvby5jb20+wpkEExYKAEEW
IQSKgo9XOusXzVHhzclSGjP3JwwE5gUCY1iY3QIbAwUJCWYBgAULCQgHAgIiAgYV
CgkICwIEFgIDAQIeBwIXgAAKCRBSGjP3JwwE5gQIAQCQlrDeoaSkXdLAIPrSEzXu
O0sV82BoGYQm0jpoyo/4gwD+I7wHs4Teoc8nwRrPY1I8ZF1+oQFiFmjMTBX3YHUP
4gjOOARjWJjdEgorBgEEAZdVAQUBAQdAnGkg+lur+b3MG9dFgsjFpkkHiRxv8ZaP
GHplcpbWPl8DAQgHwn4EGBYKACYWIQSKgo9XOusXzVHhzclSGjP3JwwE5gUCY1iY
3QIbDAUJCWYBgAAKCRBSGjP3JwwE5vAOAQCR916F7aH5bYphUAzEbjG5/RyCzUvf
86AyV+Qjnd6K7gD+MW5eAIC6B0W6AgorciEWygcmKAqgn2YfI09vnHB1CwY=3D
=3DUstf
-----END PGP PUBLIC KEY BLOCK-----

--------------nrOzQmOHQWEHrTSbhSBRi3vv--

--------------LIOGTSxFsqfaU31x0s06VnDW--

--------------D8vymITujq100UNLWMlPvvyr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSKgo9XOusXzVHhzclSGjP3JwwE5gUCZULNcAUDAAAAAAAKCRBSGjP3JwwE5oi6
AP9e7n3vPYESmsqXEasWLyuQsWkA5rRsJHKpOtp19lEsDgEA8gm/MbriGKA6w6ZwLwKOQzMI20gq
1kFKeTyYImnkxgU=
=EDID
-----END PGP SIGNATURE-----

--------------D8vymITujq100UNLWMlPvvyr--
