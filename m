Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62847ACD31
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 02:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96C210E12D;
	Mon, 25 Sep 2023 00:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D0D10E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 00:41:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so646419066b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 17:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695602490; x=1696207290; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4ileczhTo59jSLKKhIFJHNq8m7EKn5gFshxEeqYf+g8=;
 b=TBEmFKEqMXsCryD6yhY7pQIqr5Ar9GRimQlEI7zNWM1dhenEQWHQ+d3S8yOZYwEzAS
 CbvuvKIhIRPU6Kw2llfcsf5W6D3lAgLeNMMez8ulCJfyNDW1YmSyMN30mQe6U4266ilb
 t+p4camyGzV4ngpg+M5bSB1a+X2gcjx11dJeF3LmqP5myeLaJfBuq8/PvVeQdzj7k00E
 iUD0xNirfddk6q/VTDqs7SPvv02q0GvBSDbm7I8TYq1YW67linFd9EYM3siSGNbd8Kyr
 S+s8lZOHMPJcmlG3zwMWKpteCOiS0KTkvHO1w5OywGN/6ovzCea26Mv9HYtYX1M9fLFx
 ssXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695602490; x=1696207290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ileczhTo59jSLKKhIFJHNq8m7EKn5gFshxEeqYf+g8=;
 b=AIwNKVecMHHfhjhczLDdB3mHDVjUfaYt00742E8dQgu9p+pQAaI2btzh/IVV4RSMdl
 16kk+UK95q9xpffLfkvXSKZTD+H9/G5sbIvTDh45tKf5l4cnYWazxdDCg4N0bro/V0o2
 LjwWnd3+fL/LGmHri0t6KUaGZEssBpHuEK7mRHOfau0M6cF3G14wIR0fylZeNzgqptG2
 OBf5GtVyJZ48msgVsZ58UPhWS9IwE/+vQdYVfivyhuhIxwQiRCjWfkRqR/yWpRQQPvgC
 fWD1uwW0SXOhqZ6ZI7ERqG2KRHV1bDfQSZq0yPV6WGIOWuy5CfPUFmEbCdCzLIQIAi8l
 ivWg==
X-Gm-Message-State: AOJu0Yyk3rtP/zrguWtY7krguKDUqkS7QAi0E9mgOQgnv/2HtFAfGZ3u
 w7qhwlJjdy0zTJpFPtIUZllWFgH08Ne9VbpUj/s=
X-Google-Smtp-Source: AGHT+IGFjEMVeNFrkLJYHamatWrMaHQ1gzKqElZWX+oPSiWwW/r2LvYGho6VeMP5MixDo8P7RVqpzjEqVBXiLu4U1bg=
X-Received: by 2002:a17:907:7610:b0:9ae:7d2d:f2b0 with SMTP id
 jx16-20020a170907761000b009ae7d2df2b0mr4859432ejc.63.1695602490251; Sun, 24
 Sep 2023 17:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-5-sarah.walker@imgtec.com>
In-Reply-To: <20230906095542.3280699-5-sarah.walker@imgtec.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 25 Sep 2023 10:41:18 +1000
Message-ID: <CAPM=9twSNbXEttteT=NBqn3baxVPHcSHfJ-aUmneKuhO4yDiEg@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] drm/imagination/uapi: Add PowerVR driver UAPI
To: Sarah Walker <sarah.walker@imgtec.com>
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, matt.coster@imgtec.com, robh+dt@kernel.org,
 faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +struct drm_pvr_dev_query_gpu_info {
> +       /**
> +        * @gpu_id: GPU identifier.
> +        *
> +        * For all currently supported GPUs this is the BVNC encoded as a 64-bit
> +        * value as follows:
> +        *
> +        *    +--------+--------+--------+-------+
> +        *    | 63..48 | 47..32 | 31..16 | 15..0 |
> +        *    +========+========+========+=======+
> +        *    | B      | V      | N      | C     |
> +        *    +--------+--------+--------+-------+
> +        */
> +       __u64 gpu_id;
> +
> +       /**
> +        * @num_phantoms: Number of Phantoms present.
> +        */
> +       __u32 num_phantoms;
> +};

I think this one needs __u32 padding; of some sort.

Dave.
