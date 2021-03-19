Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC32341BA4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 12:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858EB6E9F3;
	Fri, 19 Mar 2021 11:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D626E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 11:39:50 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id e33so3487386pgm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6touTvWtKFiW8FAA9I+lUxn/libxVWo4D2ycjd25CNU=;
 b=JysePC4oS+r9hVAnL5SOOkUpYnTLbOFQQ89XBI4a3okMNXDpjjRNgKnhI8n1mFVCuY
 CYHmq0/MmYe7MH5etoA4lUm1pNAWWBtsSd/Jo+y85dzqOp37tRYZtng7n3cXDkovId2l
 s4S7yzUEuR2VMrcRvMJJNp1r1vjvfcSmAY7lpSVvoN2q2U13aGtE2z2jMjRV3FUQKH8C
 oItkVR7wpMOYsTSyMqtYOcYgug9B674bCr+97emKzvLeYYPIKKMhmRIPi+JndlIjIBPe
 1SLFuybx6CVuNrHGMw5iE39jH3jq24GE5Ivy2rZh6GpmGtLx9cUzEdJmhfFtwZG2S7zn
 DUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6touTvWtKFiW8FAA9I+lUxn/libxVWo4D2ycjd25CNU=;
 b=X4iOzWvj7JnMmPgFjnl/kUPDrpkJZXSMc9CDq19eYiHI8AXFljFK6uaOpTlwLO53K5
 NJ0gpZGViUU5qKraIBtsj4lL/VmlJd2svwCa2yj6i8ekx/nbpkoCZL14yzA+P7s0ijwe
 JjjHmVLk4DXFsmYjFvx9E6nQ+k7wvW+PkoymYU7R6S8hi3k+e80AE05Gc3jJwVl8eLfj
 VlaINuqgON4EcGnID8gT5AK9BkPsZ5AXD9WljdHwH4phxom8a9+aJZ8iaiSNura3Bcx/
 /IezwVIxxNO4TX83mw7RbUFLvFbiUS7pofPiZFpuaz22QwoD4z56RTGN4FXh39IAfydX
 VaJw==
X-Gm-Message-State: AOAM532eAgsAjLgcNrG0vl7Q4AjtBkSUvSJIPF4yTCNcijx1ZKw+9SAT
 /t8l7WPS/ALTQssxUPwi7XaPdMQBGA86j79J7jdR7Q==
X-Google-Smtp-Source: ABdhPJyeCqjCUphOyfVJedr3z+m21c12HGU9r+h+y+1wFK9EpIFLFL0pv6Yl7m8YnEM3dvGLTDyQu9pkjTUfd9ZHA8k=
X-Received: by 2002:aa7:980a:0:b029:20c:5402:5de9 with SMTP id
 e10-20020aa7980a0000b029020c54025de9mr8791358pfl.18.1616153990103; Fri, 19
 Mar 2021 04:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-29-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-29-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 12:39:38 +0100
Message-ID: <CAG3jFyveBSyS7k9D44m5e=8+HSvVsVhkXOokxyFOcRYDvHmWSw@mail.gmail.com>
Subject: Re: [PATCH 28/30] drm/dp: Convert drm_dp_helper.c to using
 drm_err/drm_dbg_*()
To: Lyude Paul <lyude@redhat.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch.

On Fri, 19 Feb 2021 at 23:03, Lyude Paul <lyude@redhat.com> wrote:
>
> Now that we've added a back-pointer to drm_device to drm_dp_aux, made
> drm_dp_aux available to any functions in drm_dp_helper.c which need to
> print to the kernel log, and ensured all of our logging uses a consistent
> format, let's do the final step of the conversion and actually move
> everything over to using drm_err() and drm_dbg_*().
>
> This was done by using the following cocci script:
>
>   @@
>   expression list expr;
>   @@
>
>   (
>   - DRM_DEBUG_KMS(expr);
>   + drm_dbg_kms(aux->drm_dev, expr);
>   |
>   - DRM_DEBUG_DP(expr);
>   + drm_dbg_dp(aux->drm_dev, expr);
>   |
>   - DRM_DEBUG_ATOMIC(expr);
>   + drm_dbg_atomic(aux->drm_dev, expr);
>   |
>   - DRM_DEBUG_KMS_RATELIMITED(expr);
>   + drm_dbg_kms_ratelimited(aux->drm_dev, expr);
>   |
>   - DRM_ERROR(expr);
>   + drm_err(aux->drm_dev, expr);
>   )
>
> Followed by correcting the resulting line-wrapping in the results by hand.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 122 ++++++++++++++++----------------
>  1 file changed, 60 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index b5e2671baf22..0a787ddf39fd 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -139,8 +139,8 @@ void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>                                          DP_TRAINING_AUX_RD_MASK;
>
>         if (rd_interval > 4)
> -               DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
> -                             aux->name, rd_interval);
> +               drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
> +                           aux->name, rd_interval);
>
>         if (rd_interval == 0 || dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
>                 rd_interval = 100;
> @@ -155,8 +155,8 @@ static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
>                                                  unsigned long rd_interval)
>  {
>         if (rd_interval > 4)
> -               DRM_DEBUG_KMS("%s: AUX interval %lu, out of range (max 4)\n",
> -                             aux->name, rd_interval);
> +               drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
> +                           aux->name, rd_interval);
>
>         if (rd_interval == 0)
>                 rd_interval = 400;
> @@ -220,11 +220,12 @@ drm_dp_dump_access(const struct drm_dp_aux *aux,
>         const char *arrow = request == DP_AUX_NATIVE_READ ? "->" : "<-";
>
>         if (ret > 0)
> -               DRM_DEBUG_DP("%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
> -                            aux->name, offset, arrow, ret, min(ret, 20), buffer);
> +               drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d) %*ph\n",
> +                          aux->name, offset, arrow, ret, min(ret, 20),
> +                          buffer);

checkpatch --strict is unhappy with this chunk

ERROR: code indent should use tabs where possible
#75: FILE: drivers/gpu/drm/drm_dp_helper.c:224:
+^I^I           aux->name, offset, arrow, ret, min(ret, 20),$

ERROR: code indent should use tabs where possible
#76: FILE: drivers/gpu/drm/drm_dp_helper.c:225:


>         else
> -               DRM_DEBUG_DP("%s: 0x%05x AUX %s (ret=%3d)\n",
> -                            aux->name, offset, arrow, ret);
> +               drm_dbg_dp(aux->drm_dev, "%s: 0x%05x AUX %s (ret=%3d)\n",
> +                          aux->name, offset, arrow, ret);

checkpatch --strict is unhappy with this chunk

ERROR: code indent should use tabs where possible
#81: FILE: drivers/gpu/drm/drm_dp_helper.c:228:
+^I^I           aux->name, offset, arrow, ret);$


>  }
>
>  /**
> @@ -287,8 +288,8 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
>                         err = ret;
>         }
>
> -       DRM_DEBUG_KMS("%s: Too many retries, giving up. First error: %d\n",
> -                     aux->name, err);
> +       drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up. First error: %d\n",
> +                   aux->name, err);
>         ret = err;
>
>  unlock:
> @@ -524,44 +525,44 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
>
>         if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
>                              &auto_test_req, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
> -                         aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
> +               drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
> +                       aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
>                 return false;
>         }
>         auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
>
>         if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
> -                         aux->name, DP_TEST_REQUEST);
> +               drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
> +                       aux->name, DP_TEST_REQUEST);
>                 return false;
>         }
>         link_edid_read &= DP_TEST_LINK_EDID_READ;
>
>         if (!auto_test_req || !link_edid_read) {
> -               DRM_DEBUG_KMS("%s: Source DUT does not support TEST_EDID_READ\n",
> -                             aux->name);
> +               drm_dbg_kms(aux->drm_dev, "%s: Source DUT does not support TEST_EDID_READ\n",
> +                           aux->name);
>                 return false;
>         }
>
>         if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
>                               &auto_test_req, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> -                         aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
> +               drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
> +                       aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
>                 return false;
>         }
>
>         /* send back checksum for the last edid extension block data */
>         if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM,
>                               &real_edid_checksum, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> -                         aux->name, DP_TEST_EDID_CHECKSUM);
> +               drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
> +                       aux->name, DP_TEST_EDID_CHECKSUM);
>                 return false;
>         }
>
>         test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
>         if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
> -               DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> -                         aux->name, DP_TEST_RESPONSE);
> +               drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
> +                       aux->name, DP_TEST_RESPONSE);
>                 return false;
>         }
>
> @@ -604,17 +605,16 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>                 return -EIO;
>
>         if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> -               DRM_DEBUG_KMS("%s: Extended DPCD rev less than base DPCD rev (%d > %d)\n",
> -                             aux->name, dpcd[DP_DPCD_REV],
> -                             dpcd_ext[DP_DPCD_REV]);
> +               drm_dbg_kms(aux->drm_dev,
> +                           "%s: Extended DPCD rev less than base DPCD rev (%d > %d)\n",
> +                           aux->name, dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV]);
>                 return 0;
>         }
>
>         if (!memcmp(dpcd, dpcd_ext, sizeof(dpcd_ext)))
>                 return 0;
>
> -       DRM_DEBUG_KMS("%s: Base DPCD: %*ph\n",
> -                     aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> +       drm_dbg_kms(aux->drm_dev, "%s: Base DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
>
>         memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
>
> @@ -649,8 +649,7 @@ int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
>         if (ret < 0)
>                 return ret;
>
> -       DRM_DEBUG_KMS("%s: DPCD: %*ph\n",
> -                     aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> +       drm_dbg_kms(aux->drm_dev, "%s: DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
>
>         return ret;
>  }
> @@ -694,8 +693,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
>         if (ret != len)
>                 return -EIO;
>
> -       DRM_DEBUG_KMS("%s: DPCD DFP: %*ph\n",
> -                     aux->name, len, downstream_ports);
> +       drm_dbg_kms(aux->drm_dev, "%s: DPCD DFP: %*ph\n", aux->name, len, downstream_ports);
>
>         return 0;
>  }
> @@ -1412,11 +1410,11 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                          * Avoid spamming the kernel log with timeout errors.
>                          */
>                         if (ret == -ETIMEDOUT)
> -                               DRM_DEBUG_KMS_RATELIMITED("%s: transaction timed out\n",
> -                                                         aux->name);
> +                               drm_dbg_kms_ratelimited(aux->drm_dev, "%s: transaction timed out\n",
> +                                                       aux->name);
>                         else
> -                               DRM_DEBUG_KMS("%s: transaction failed: %d\n",
> -                                             aux->name, ret);
> +                               drm_dbg_kms(aux->drm_dev, "%s: transaction failed: %d\n",
> +                                           aux->name, ret);
>                         return ret;
>                 }
>
> @@ -1430,12 +1428,12 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         break;
>
>                 case DP_AUX_NATIVE_REPLY_NACK:
> -                       DRM_DEBUG_KMS("%s: native nack (result=%d, size=%zu)\n",
> -                                     aux->name, ret, msg->size);
> +                       drm_dbg_kms(aux->drm_dev, "%s: native nack (result=%d, size=%zu)\n",
> +                                   aux->name, ret, msg->size);
>                         return -EREMOTEIO;
>
>                 case DP_AUX_NATIVE_REPLY_DEFER:
> -                       DRM_DEBUG_KMS("%s: native defer\n", aux->name);
> +                       drm_dbg_kms(aux->drm_dev, "%s: native defer\n", aux->name);
>                         /*
>                          * We could check for I2C bit rate capabilities and if
>                          * available adjust this interval. We could also be
> @@ -1449,8 +1447,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         continue;
>
>                 default:
> -                       DRM_ERROR("%s: invalid native reply %#04x\n",
> -                                 aux->name, msg->reply);
> +                       drm_err(aux->drm_dev, "%s: invalid native reply %#04x\n",
> +                               aux->name, msg->reply);
>                         return -EREMOTEIO;
>                 }
>
> @@ -1465,13 +1463,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         return ret;
>
>                 case DP_AUX_I2C_REPLY_NACK:
> -                       DRM_DEBUG_KMS("%s: I2C nack (result=%d, size=%zu)\n",
> -                                     aux->name, ret, msg->size);
> +                       drm_dbg_kms(aux->drm_dev, "%s: I2C nack (result=%d, size=%zu)\n",
> +                                   aux->name, ret, msg->size);
>                         aux->i2c_nack_count++;
>                         return -EREMOTEIO;
>
>                 case DP_AUX_I2C_REPLY_DEFER:
> -                       DRM_DEBUG_KMS("%s: I2C defer\n", aux->name);
> +                       drm_dbg_kms(aux->drm_dev, "%s: I2C defer\n", aux->name);
>                         /* DP Compliance Test 4.2.2.5 Requirement:
>                          * Must have at least 7 retries for I2C defers on the
>                          * transaction to pass this test
> @@ -1485,13 +1483,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>                         continue;
>
>                 default:
> -                       DRM_ERROR("%s: invalid I2C reply %#04x\n",
> -                                 aux->name, msg->reply);
> +                       drm_err(aux->drm_dev, "%s: invalid I2C reply %#04x\n",
> +                               aux->name, msg->reply);
>                         return -EREMOTEIO;
>                 }
>         }
>
> -       DRM_DEBUG_KMS("%s: Too many retries, giving up\n", aux->name);
> +       drm_dbg_kms(aux->drm_dev, "%s: Too many retries, giving up\n", aux->name);
>         return -EREMOTEIO;
>  }
>
> @@ -1520,8 +1518,9 @@ static int drm_dp_i2c_drain_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *o
>                         return err == 0 ? -EPROTO : err;
>
>                 if (err < msg.size && err < ret) {
> -                       DRM_DEBUG_KMS("%s: Partial I2C reply: requested %zu bytes got %d bytes\n",
> -                                     aux->name, msg.size, err);
> +                       drm_dbg_kms(aux->drm_dev,
> +                                   "%s: Partial I2C reply: requested %zu bytes got %d bytes\n",
> +                                   aux->name, msg.size, err);
>                         ret = err;
>                 }
>
> @@ -1700,12 +1699,11 @@ static void drm_dp_aux_crc_work(struct work_struct *work)
>                 }
>
>                 if (ret == -EAGAIN) {
> -                       DRM_DEBUG_KMS("%s: Get CRC failed after retrying: %d\n",
> -                                     aux->name, ret);
> +                       drm_dbg_kms(aux->drm_dev, "%s: Get CRC failed after retrying: %d\n",
> +                                   aux->name, ret);
>                         continue;
>                 } else if (ret) {
> -                       DRM_DEBUG_KMS("%s: Failed to get a CRC: %d\n",
> -                                     aux->name, ret);
> +                       drm_dbg_kms(aux->drm_dev, "%s: Failed to get a CRC: %d\n", aux->name, ret);
>                         continue;
>                 }
>
> @@ -2001,13 +1999,12 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
>
>         dev_id_len = strnlen(ident->device_id, sizeof(ident->device_id));
>
> -       DRM_DEBUG_KMS("%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
> -                     aux->name, is_branch ? "branch" : "sink",
> -                     (int)sizeof(ident->oui), ident->oui,
> -                     dev_id_len, ident->device_id,
> -                     ident->hw_rev >> 4, ident->hw_rev & 0xf,
> -                     ident->sw_major_rev, ident->sw_minor_rev,
> -                     desc->quirks);
> +       drm_dbg_kms(aux->drm_dev,
> +                   "%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
> +                   aux->name, is_branch ? "branch" : "sink",
> +                   (int)sizeof(ident->oui), ident->oui, dev_id_len,
> +                   ident->device_id, ident->hw_rev >> 4, ident->hw_rev & 0xf,
> +                   ident->sw_major_rev, ident->sw_minor_rev, desc->quirks);
>
>         return 0;
>  }
> @@ -2769,7 +2766,8 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
>         if (ret < 0)
>                 return ret;
>         if (!(buf & DP_PCON_ENABLE_SOURCE_CTL_MODE)) {
> -               DRM_DEBUG_KMS("%s: PCON in Autonomous mode, can't enable FRL\n", aux->name);
> +               drm_dbg_kms(aux->drm_dev, "%s: PCON in Autonomous mode, can't enable FRL\n",
> +                           aux->name);
>                 return -EINVAL;
>         }
>         buf |= DP_PCON_ENABLE_HDMI_LINK;
> @@ -2864,8 +2862,8 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
>                         num_error = 0;
>                 }
>
> -               DRM_ERROR("%s: More than %d errors since the last read for lane %d",
> -                         aux->name, num_error, i);
> +               drm_err(aux->drm_dev, "%s: More than %d errors since the last read for lane %d",
> +                       aux->name, num_error, i);
>         }
>  }
>  EXPORT_SYMBOL(drm_dp_pcon_hdmi_frl_link_error_count);
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
