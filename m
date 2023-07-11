Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5C74E6D0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1631810E307;
	Tue, 11 Jul 2023 06:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722FD10E307
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:08:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbc656873eso66394845e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689055681; x=1691647681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ylMkhP5iApXqUlg2Qp54MKEXiwYX+p46Gaz2A+cIsD0=;
 b=FsgY1ZT2rRl+7zR2oyCxnQKtF8FkyOuc3KiCGv+HxNmd9b8YJvv2nR3YdABt+GQXDm
 D6fkbZrTxLjPduhuM8/J10pt74OBHR29awp2zygJtnpWbjRWKq9NbsEunWfEKTxqO/vl
 0CH1DVov289fSxjVCsqS2fCo9srbIGc08/f3lmE9uEmew89VBl0SRqspVYa3/Uj69l9S
 yUC7TX/sb2K11xvQMgXWutueqg1OAtvgZGhifykhwgaqoDfnH+AHMPxDsKNXn8Tl60K9
 L5ZGe7+P2n/sHO9J749RASjwdD5FVzlEfWb6cPbAjv/zxg8bmUn5nvoZXYVO0DFJl4PZ
 sEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689055681; x=1691647681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ylMkhP5iApXqUlg2Qp54MKEXiwYX+p46Gaz2A+cIsD0=;
 b=E49RJ9XaVrNzswXLFTVcaJU3kjXPqxVQ+Ivg0v7Y5fIVRABwlZKEbO9gylEn2Ywve+
 3vxf8ejOeP1TnMLIJ1cIAGKVH/rDXnUPKGxanOVCPjf9XBbm1dSfep+3geUgaikslV5r
 j8uglJ7bm0w75PN7A3nkgTYZrlqPd/AckBRqWcsWtsasWVFzr4yLfailR8gFdkgBSuhc
 lL2OtUEUC1wTuStWxgup36unH2uMdt48H2PIHXocKiS+eN6Q5OM7Qe8ju3uKEBFlv7pr
 MfoasnbbSBD9C8LTb/cW38DCWj/dnLfxqd2CjppLfjZ4c0QlTOAffKTxfdWuxWMpkvuW
 9U5g==
X-Gm-Message-State: ABy/qLbmAdAeNpsjcXNFp/KgQCoiTcujp5sCewBCfMY7hOYIVBEPcYPn
 FfcMQ4BXWY8PZXOEKd66cNI1zQ==
X-Google-Smtp-Source: APBJJlEu3vGunYmloCnFe4G0ic4Cf6SKC/3Yc++PBYxfbIesl5w5Avpv1N3JTMG4cUKE8qkhSw6F+g==
X-Received: by 2002:a1c:6a04:0:b0:3fb:b9b7:fb0c with SMTP id
 f4-20020a1c6a04000000b003fbb9b7fb0cmr18270975wmc.31.1689055681338; 
 Mon, 10 Jul 2023 23:08:01 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 u9-20020a7bc049000000b003fbc681c8d1sm12043925wmc.36.2023.07.10.23.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:07:58 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:07:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <627f10fc-6f09-44ab-9c2e-f5615a86f080@kadam.mountain>
References: <ZKzxP8iX8Op0lYvh@moroto>
 <ZKzxXhtwqYvoat8B@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzxXhtwqYvoat8B@moroto>
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oops.  Left the v2 out of the subject.

Let me start this whole thread over...

regards,
dan carpenter

