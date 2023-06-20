Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629B1736511
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4285010E27D;
	Tue, 20 Jun 2023 07:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA10E10E27D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 07:45:05 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b45c289615so55510451fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687247103; x=1689839103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wESTR9hp8QbMJwR1Q1phtcrcKn8kK2hZnv+6lF1RSbE=;
 b=UbRFJO/7SOyqKIZckxXwxHNU4Nmlb0G43+TakTCeqG2mdXo/VjE97pNrhhDKGuqul6
 g0FDSgQ1qhlFRm66v2CSR07HEumgOiI1DwY70cvZ/GRnH3GfRPO/rQXbF1Svml7efMkh
 lhp9MswnOIHmtxPe6YalCOL2HsaeUEJ1reXvdnquy86Yz3ekmbH8PJNZHnxHquD3AOqx
 EgxWf74zYgBhQ2Sxh9FNRWpZuodQDfPg+3tl0Z1GfgQyuZfTgssS7hr9akr9b+chCghg
 +BSx/W2fCD9px1aN4YbOwgziz4ZOrjlN0uhBjcARDLHWbletHPL7ZmyaQfGhp33/A1K5
 qigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687247103; x=1689839103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wESTR9hp8QbMJwR1Q1phtcrcKn8kK2hZnv+6lF1RSbE=;
 b=dXbUiNCVKk2uKPtcLSHrwqMShcOo7gC9CpUITEcdPb2gGxTrrkEalEuzdy8r0nsSkw
 riaXtijza7wh1SOULMrZzqj0J6noWGM5bHubR1chhqyRM4TEd2JKcMeom4uHxju02pQG
 tvm+CojqQmiTqvZ0peqkTGutw15JF8uUYsq2O405BylNpeMfBzOGWEMXXM1YaHuL5r7D
 9MYyot7Ucd6c5R8I0GaSo58MSJ+A/6lTiG4eKHp6Wb0/uzkmY7BVXz7kwt6ajlEKqWuU
 u0Mz9O7r8kapaQkatsiQJpVN97MJGVmLIaFJ8YQPIBk79Ep6ixDIUw0b76PYQJSRdtuy
 dTyg==
X-Gm-Message-State: AC+VfDyR8pSJFvIwd0wJxv0UQxCF41rC+xap4HWCxXJtb210OR9NIcWi
 KStYhULhSdOfvtPZP4iByxteKw==
X-Google-Smtp-Source: ACHHUZ5YYYlSgC1V3KRSjRNSOXWVqQWlcOczSmzsen3nujIQLBEGe4Bnnj50uCWaKV4ofo1n52bAFA==
X-Received: by 2002:a2e:7e07:0:b0:2b4:7633:ff0f with SMTP id
 z7-20020a2e7e07000000b002b47633ff0fmr3270970ljc.48.1687247102890; 
 Tue, 20 Jun 2023 00:45:02 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 p21-20020a7bcc95000000b003f739a8bcc8sm1635305wma.19.2023.06.20.00.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 00:45:00 -0700 (PDT)
Date: Tue, 20 Jun 2023 10:44:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Message-ID: <6785d220-6ccf-40ad-ae07-4c1cae7c7ca3@kadam.mountain>
References: <20230620045919.492128-1-suhui@nfschina.com>
 <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
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
Cc: Jane.Jian@amd.com, Bokun.Zhang@amd.com, David.Francis@amd.com,
 Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 10:37:59AM +0300, Dan Carpenter wrote:
> "Mark the associated types properly packed individually, rather than
> use the disgusting "pragma pack()" that should never be used."
> 
> https://lore.kernel.org/linux-sparse/CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com/

Marking the structs packed could be very simple.

regards,
dan carpenter

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
index 104a5ad8397d..e29dae04f7e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -209,7 +209,7 @@ struct amd_sriov_msg_pf2vf_info {
 	uint32_t pcie_atomic_ops_support_flags;
 	/* reserved */
 	uint32_t reserved[256 - AMD_SRIOV_MSG_PF2VF_INFO_FILLED_SIZE];
-};
+} __packed;
 
 struct amd_sriov_msg_vf2pf_info_header {
 	/* the total structure size in byte */
@@ -262,7 +262,7 @@ struct amd_sriov_msg_vf2pf_info {
 	struct {
 		uint8_t id;
 		uint32_t version;
-	} ucode_info[AMD_SRIOV_MSG_RESERVE_UCODE];
+	} __packed ucode_info[AMD_SRIOV_MSG_RESERVE_UCODE];
 	uint64_t dummy_page_addr;
 
 	/* reserved */
