Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF786746C51
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437CC10E116;
	Tue,  4 Jul 2023 08:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432BF10E116
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 08:48:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3143b70d6easo1470120f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688460523; x=1691052523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f6YOwXLm+1hJya88jiZQ5u2PUvGz6DQZ0Xib4QcnZYk=;
 b=X/eFpPIu9v9z5x9Xi4PWBH8nDYyQ8AuoTlOeeIStjQo9fjJMbOdSgeo2C6OXcfn7/i
 y0WznCIrriOGeAVTM+lOmplmrLIZm14T0xkcLyeiymVAiV2nQDalxBkkp9rXbX10/pgv
 OrH6HkpKxaQTSBt/AVj5shbdUiZW0GW227sPzdDojSC/mHvi6R529B3eHPzHdR5hvit8
 X8RmeyquIWQAx2S3t4IQqKQ3DSWjzP8ReBgEDrMFvA7l49DEA3f2FKC9IVou3gc/TWHQ
 OfmCEVwy8cdklhVlin2D0OJbZfWA5ZIMrVP3MchtYToVZKwEzrMvHJCI9mvZF4Nb4aMm
 fz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688460523; x=1691052523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6YOwXLm+1hJya88jiZQ5u2PUvGz6DQZ0Xib4QcnZYk=;
 b=W5g7r6+tziig33Z+7HeM/kqgjhrG2pEHRx+gi6u47bst5LYYEBMcwFK/95wmZLwth4
 bxS/95y5DoPYEKijJZsqRSfP9jsIyAEST+HMPprB6x9qmn28Lxl767Agyz/RRJ7zBL9+
 LHvBHYilnJEC/5XqLlvHk7VwOOjb7TF4X6HjGALMHdqi354zByea88N3CECnV7IXTUii
 kgHsOJsB1ylalU7Yla3MCPjFw35sqzL+KdgTc1UAU0hddTBVIRDgf/JhEpGWnQxctHhk
 m7f7SU4jmnvNdarzKznD08E8XsBnXDMAFsX77soCFmOYgVOHO8FzIik8FdwzDDXN0FER
 CXcg==
X-Gm-Message-State: ABy/qLZErP/qvIJCJQuHg6M5MhJGO3MgglvxVBptiy8e1kOug04NDeMl
 /cmhxIW5kfsbRpW2ckOlTUXSf4WIYlJ/y3bacq4=
X-Google-Smtp-Source: APBJJlHIxOV9dndynkfl4sClPYXQ9Jj7TscatAL2py7KSBsv//PuPwpcqjmk0a6BsvffZZHAvCfTPw==
X-Received: by 2002:a5d:6e56:0:b0:314:dea:f1f8 with SMTP id
 j22-20020a5d6e56000000b003140deaf1f8mr9638778wrz.11.1688460523347; 
 Tue, 04 Jul 2023 01:48:43 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j15-20020adff00f000000b00314315071bbsm7085181wro.38.2023.07.04.01.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 01:48:40 -0700 (PDT)
Date: Tue, 4 Jul 2023 11:48:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <571cd06a-c488-4e46-af0d-183943fbbd7d@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
 <5fecc4c3-7a99-4329-d56c-b6a4f56c990c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fecc4c3-7a99-4329-d56c-b6a4f56c990c@quicinc.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 12:04:01PM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> > > -??????? if (user_len + trans_hdr->len > user_msg->len) {
> > > +??????? if (trans_hdr->len < sizeof(trans_hdr) ||
> > > +??????????? size_add(user_len, trans_hdr->len) > user_msg->len) {
> Since the size of characters per line is 100 now. Can we rearrange this if
> condition and have them in one line. Similarity at other places in this
> patch series.

Style is subjective so I can't say for sure that my style is better but
obviously it is.  ;)  Those are two separate conditions so I put them on
two lines.  If it were something very related like if (x < 0 || x >= 10)
then I would have put it on one line.

regards,
dan carpenter

