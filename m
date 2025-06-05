Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C634AACE97F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 07:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9091110E0C5;
	Thu,  5 Jun 2025 05:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DdFJEz7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29F110E0C5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 05:55:33 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6070293103cso859845a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749102932; x=1749707732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ol/a69YHn6Z8Z1E3rPR4cd8Ja0wlD86SrLCVfeSdAY=;
 b=DdFJEz7b/JKrB8NdmK43U5mt6hA9ODyHSbMSr/d0wUkVR/XmvbNiQJOFTRgDEzZk83
 9tvvTvnUhlE5sX4kxAwDbqOdIiNFDromgrC91KBar6E6mZGw8rffjQ5qBWs6rOL/g+Zp
 +VxONm4Y94ykMLqHlctDp9fDg6VlpAVzKEeoCtEaVDC7uNFORPhcqnYGdcw0hy3KkoWF
 66vRwJANDXUX3TFLAitVD/MCaKPkQWpjrwjSTzhqZZULU0hWwq608pwlySssiiAdr04S
 CLnxDfE4FbmFDaCanRLo4Pakz3oNJ/cnT+iNm1diZMrKPwjco5CDxC6ID8Wmwq9hGmu1
 f4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749102932; x=1749707732;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ol/a69YHn6Z8Z1E3rPR4cd8Ja0wlD86SrLCVfeSdAY=;
 b=Es14wasqVhWd8qb9v5GlByqugqJG+Xia+OpT/TeLVewGDLHrZbGJVHaCoQa3MpgUbU
 bIIZUSXmH1v1AYgqTYc4iRvVoMB1cXoIgPvl7DxBiOjD5CXuScA5vNbpnzDdVVu/9WIt
 DV+YbH8LBD1q1EPJJLEseqo2BUgb3BXHDRaFaZZ7GFQ8+fA+Ez/fT3VUwtkeFxgcZlUg
 mChLOLGDrcNCbr1xsoek2AC0/C4DF/E8S6r3FYu3H7z0ygW+kureqSvDKJEdF5Tk095S
 LwULfoYYwd+zW8xVHcXGaC7668lBORCJFrYSMGoEqckzzQA5e01pu+jGOLlSkNhoLKY3
 rHwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzs3zGFEfK16TouGP5YqAiu2iHl1wijBVODArdwLPu2uTqyb/egl4FkUhMwynirHz8Pr8LarUbXfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLdnUgiM/oE/lHrKp/lOEhm4PJ6RHrljfKwY21g8prR6GzekWg
 9xA5DAQCpd62A4rHzHWMiNWih79pprixwwGh5c7+bcF380J0qwTZ0hV6TnR60lytebI=
X-Gm-Gg: ASbGncsDwfeCl+Krsq6PACi0AcpFphmdPYGybKHM67p+LqbYFoCtzZXuKRhMzSk2NfW
 I+0Z8HnriHUY+noyFGISlZy+ljJDki/ovZIKfB0acbVlN6NdHSzamRsbfSbHNj5yLSrBkcHVno7
 4QF+nS1fBFwb68f1FZkIpwpEyPzNZsy2CLQs/SvvEf3/E10lb3ky98Qr0+T4kSfRtpc1T2kCCKF
 VyGWzsvj/cOnBqItaZyVVvv1xHK7ET2P++K0iEVH7pzT/DxRq1VJDoSStYZkMrBpSHyhyuBD77V
 Fa7Kh+5fe1uWKGijxhSFE+ljbzprHOK3UahPEe0ad2tphmcAufN4WOIrh/2LkVUKVB7sljZO0Hg
 h
X-Google-Smtp-Source: AGHT+IG4axg7h15fFW1J2Nh//eAiOSbPO5FNtGxUNYy6LlYttIT/I3Z4H5vRX6rvUFLJJ/hPB4SQiw==
X-Received: by 2002:a05:6402:1ed6:b0:5fb:87a2:5ef9 with SMTP id
 4fb4d7f45d1cf-606ea3c5e65mr4977473a12.23.1749102932457; 
 Wed, 04 Jun 2025 22:55:32 -0700 (PDT)
Received: from localhost ([41.210.155.222])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-6071b7a7fbdsm981668a12.59.2025.06.04.22.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 22:55:31 -0700 (PDT)
Date: Thu, 5 Jun 2025 08:55:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] dma-buf: dma-buf: stop mapping sg_tables on attach v2
Message-ID: <aEExTkVMcYEOrIOE@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hello Christian König,

Commit de68b17d5d07 ("dma-buf: dma-buf: stop mapping sg_tables on
attach v2") from Feb 11, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment()
	warn: passing positive error code '16' to 'ERR_PTR'

drivers/dma-buf/dma-buf.c
    1113         dma_resv_assert_held(attach->dmabuf->resv);
    1114 
    1115         if (dma_buf_pin_on_map(attach)) {
    1116                 ret = attach->dmabuf->ops->pin(attach);
    1117                 /*
    1118                  * Catch exporters making buffers inaccessible even when
    1119                  * attachments preventing that exist.
    1120                  */
    1121                 WARN_ON_ONCE(ret == EBUSY);
                                             ^^^^^
This was probably intended to be -EBUSY?

    1122                 if (ret)
--> 1123                         return ERR_PTR(ret);
                                                ^^^
Otherwise we will eventually crash.

    1124         }
    1125 
    1126         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
    1127         if (!sg_table)
    1128                 sg_table = ERR_PTR(-ENOMEM);
    1129         if (IS_ERR(sg_table))
    1130                 goto error_unpin;
    1131 

regards,
dan carpenter
