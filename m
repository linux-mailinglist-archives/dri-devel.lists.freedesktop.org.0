Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOWDE2t3mGlrJAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:02:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC938168999
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3510E7C3;
	Fri, 20 Feb 2026 15:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vKcvHjty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D573D10E366
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:54 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-8946421dd8fso3013056d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 07:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771599714; cv=none;
 d=google.com; s=arc-20240605;
 b=VMyS8GMZ9Jjw012MjUHx43cbIhDBNl15xFwhKiHAIvBH9LBNHPORz7dWOppulR67kC
 mRxPKAZp4oDm1mVGKUaWcl8WPvTRoqWuMYKy/1thabRwSr9iFLih1uEGjWHsQaU2sLwq
 8cG+sqKRPKzSUBQE/i9NqqWrn91DYR1pWAegcVzsURnfJ8mjeHlXBuYQ+39rnnEu61mL
 GWozDhX4iF+tyA11q6tZbvAk4rVoWHGeomCKVYaHyRceqwSFFIqzQR0tiOeKiYrgumTB
 18zNWFx4LX1Zj9mZ6fGGbm1lJ9K0G1ushRxRNswqednCEpzk+dhIb3iJQLb7MU2J+5Ln
 iE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7QV0wNyNitS1bEzSo7v3NGasKmhVTaJLvMDhSaOJsf4=;
 fh=mRmWq3Zytq68AapIkrbVgfaIu6x8wo0YvJ3Jw9AFJIQ=;
 b=iiisZ6Ka9PT4V5qL1GwwVApGUyvQGI6tUDtIN/5Ax9p/t/79HSRsOjFo1ZbHsLOw0E
 bYZEk2itTDPX1o+F/+qguX1G+j+Y+IrinE1bFaIEbu1dUTgRJf6k6swCDtx1uRwoWmz5
 dwlOQ/G5l7zAAsp2RXgKjArlcssYnLj/gVLSKhGzzhnVIFy3nEOacBnFo0YnUwZ4Moim
 SAYqB/ytv30ECHSXPpheaXxFU1s7xKIlIZPhSZ9XjKomWgpKiNqujt4p1SRy2y4RD5Ve
 zTeVX8tCVasCr1D29B9BHHwMYemASieEHiqhUaYILu2YYr8jPKwxl9cEQeHFEsz/sab6
 1tag==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771599714; x=1772204514; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7QV0wNyNitS1bEzSo7v3NGasKmhVTaJLvMDhSaOJsf4=;
 b=vKcvHjty7N2CXc6UcNNR0DSy9h9ks1rTl9h/qeRORDp2DPzWSfqavuJ5+VB6BivFA/
 IIqNT51jEjPkd03B+H682PnZLOWseoyIYhDERH5+ULKaFIwVq/HEiMjGFtuuAONktLN+
 fUKNW2PC0M8vZiRAAVgXwe4fK/228n6M0A3jwDKBPUOWU7+bVjjyXj0wE4A2K3Y/v26h
 q57+BBhV+GOEHa9OpMm9/Yt9Z11RN/1Bt8FX9NfmV2pobA9IQxHecoMU51fe3EmkIShO
 MV5uohlJErY15DEAYxe+4ji1QY7UOR19Hc8BWK5fodmTv/D4YsgZt7F4ipJVBx2nsuYE
 LZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771599714; x=1772204514;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QV0wNyNitS1bEzSo7v3NGasKmhVTaJLvMDhSaOJsf4=;
 b=Sf5YGh20eXP30lS+FF9HpMKnzjSCOJbW4FVlNk5qtbAiD6Sw1n4DFub/+R55M2+JFp
 2SSQsmAGd2nIg/Vwl2YTIkZ9bZgyJPXp9fNEDcjloC3KEG+Vcvel8tGNlh0zEYgYriQy
 ona8U8M+ZoaipI1LoL/VCb6cPmR6KbNWBXI8SQVTHUChWRWg/L+tfMqvFo+tzlGDafuC
 LKTlJdv+7Q/StpFfWrxuYHWqK0RXaK9Pv1Q3GHYTW7iBzazrD9hXZBqoil0kLBko/iQ+
 Lrmv98j29f9kvI/Nz7ibBw0gSA22TcCOaTxL38RM0LyUQ6znuxSC7jHFgoBhXlY9mIxg
 HQsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1mH9vD0vrTE3XsjJUGhdQGMcLA1XZ18PvyTs6CifkceY6mjjUdRK0ed1h+ls1dVYEaV4aOTel4SA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWej7UEAI/lzF3uxKEpV4ptm73CI6v61J8+kmSEbBGbT879DVG
 Ls8u8kDKPEMaDDgBRxqIFaCrRtSD6CbonVK/+gdVADCP2rD+c0rUCA63K4sDFOOPimtuqIlTqJF
 BSaEXDg6e+aHJHjM4Vxh6ushc55bJnaoTfq31qcQBuQ==
X-Gm-Gg: AZuq6aLVvOLCT8MPrKw4N1pAO885XNYhzrb/N5MR5ZPbB5JwkQVp0hVH4XbpsNSXIpN
 g+on79e0AKiq3eivITusPDQ2uUIRi/GgOWWcD3s5bHkrszX4Q3h2fb9Y2iVthtT59yFOXhk0Urf
 EWgKABXORs5itlnRlwLD0jwiOmmhC0TzCO0h965iylNAswdNmAdaphXtmtqLNa3mYB+VvnSl7bY
 SbuDD/O4IkZslgaK8ZaT7FimHlGH7Iu1QIvEOlhhhufyiG47owRdUAuo44VG4QGlggIe/ACCKvD
 lWRVd6hlj06W+gPq
X-Received: by 2002:a05:6214:4f04:b0:896:fd66:a084 with SMTP id
 6a1803df08f44-89979e1ebe5mr1554296d6.8.1771599712394; Fri, 20 Feb 2026
 07:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
 <20260218-ethos-fixes-v1-1-be3fa3ea9a30@kernel.org>
In-Reply-To: <20260218-ethos-fixes-v1-1-be3fa3ea9a30@kernel.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Fri, 20 Feb 2026 16:01:41 +0100
X-Gm-Features: AaiRm53yRPugHKgNWFtb5wBtDqPZhwsddssu4VSTJIzhUJnsACG0L80vWC-fQ8s
Message-ID: <CADYN=9L6Vsxs6HLK6A_3h6t8bR_DCFPH8gXYASc6ewtRWh5b7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] accel: ethosu: Fix job submit error clean-up refcount
 underflows
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RSPAMD_URIBL_FAIL(0.00)[linaro.org:query timed out];
	FORGED_SENDER(0.00)[anders.roxell@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anders.roxell@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DC938168999
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 at 23:22, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> If the job submit fails before adding the job to the scheduler queue
> such as when the GEM buffer bounds checks fail, then doing a
> ethosu_job_put() results in a pm_runtime_put_autosuspend() without the
> corresponding pm_runtime_resume_and_get(). The dma_fence_put()'s are
> also unnecessary, but seem to be harmless.
>
> Split the ethosu_job_cleanup() function into 2 parts for the before
> and after the job is queued.
>
> Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-and-Tested-by: Anders Roxell <anders.roxell@linaro.org>

> ---
>  drivers/accel/ethosu/ethosu_job.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
> index 26e7a2f64d71..70a144803b09 100644
> --- a/drivers/accel/ethosu/ethosu_job.c
> +++ b/drivers/accel/ethosu/ethosu_job.c
> @@ -143,23 +143,29 @@ static int ethosu_job_push(struct ethosu_job *job)
>         return ret;
>  }
>
> +static void ethosu_job_err_cleanup(struct ethosu_job *job)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < job->region_cnt; i++)
> +               drm_gem_object_put(job->region_bo[i]);
> +
> +       drm_gem_object_put(job->cmd_bo);
> +
> +       kfree(job);
> +}
> +
>  static void ethosu_job_cleanup(struct kref *ref)
>  {
>         struct ethosu_job *job = container_of(ref, struct ethosu_job,
>                                                 refcount);
> -       unsigned int i;
>
>         pm_runtime_put_autosuspend(job->dev->base.dev);
>
>         dma_fence_put(job->done_fence);
>         dma_fence_put(job->inference_done_fence);
>
> -       for (i = 0; i < job->region_cnt; i++)
> -               drm_gem_object_put(job->region_bo[i]);
> -
> -       drm_gem_object_put(job->cmd_bo);
> -
> -       kfree(job);
> +       ethosu_job_err_cleanup(job);
>  }
>
>  static void ethosu_job_put(struct ethosu_job *job)
> @@ -454,12 +460,16 @@ static int ethosu_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
>                 }
>         }
>         ret = ethosu_job_push(ejob);
> +       if (!ret) {
> +               ethosu_job_put(ejob);
> +               return 0;
> +       }
>
>  out_cleanup_job:
>         if (ret)
>                 drm_sched_job_cleanup(&ejob->base);
>  out_put_job:
> -       ethosu_job_put(ejob);
> +       ethosu_job_err_cleanup(ejob);
>
>         return ret;
>  }
>
> --
> 2.51.0
>
