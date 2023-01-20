Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B056754A4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708EF10EA55;
	Fri, 20 Jan 2023 12:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B49110EA4D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:35:45 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso8934607pjg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMRe8eLbb8kiHFG5rJAk+PE3/E/OOzFPOQcaCCbQAoA=;
 b=h9ZDQEpdJpvry7XWWAXJlAu+RImAffJ6mJRokPSxuAcl2ojeIUAJU0hYBM87Wef3Y8
 qcYv78OCB4+F0a2EHi0QexCUL6KQ0DtM1FFTJEVsXO11eHp0daCIkA4LMm0Opmi+FPN3
 jhn32UKAz8788V4RxXr8quDOe1L/wp0akqP6LII6QaCnyU271LrAxphlEh1tXgYq6pYP
 QuW5RwUWCDp2ACemGyrEa02k6zfNs9MnZC8GkkI6LUp5eX8Ct37FpjcEQEeWK4iX6BHf
 YoUFBXj0jO4eAJ2UdSeXQVt/b85CUCo/eEy8yh/UYWZvoGkemlhiTVLDWdEd1GEuoE2H
 6q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMRe8eLbb8kiHFG5rJAk+PE3/E/OOzFPOQcaCCbQAoA=;
 b=4v112iWL7nzAPV7KZsV1W8MFxTTC1Yc5hfHYkFegf4xt3jvmajvrPS7iMN4y/f5MkY
 2wssOwArgcyRTaSZQWFRFhQsIrcMScQCFawETk4j3Ri5apPFeK2DLlzXuxLkrq+HJnTo
 3VyAFMiGyNE1eOouUWwBk8qZDjzFXkqlTvCN7BCMGM86vqluJr+LxMNIDtqBuOrR2PmN
 uOmwWfqEnB8Cr3ZgpK6a/nowBljEnigV8edRKbkRFzRC5AqTgrXnIXbRqc0WkYIrDHmk
 m56j9vcbR8tU8T6EjgXlxVSqsg/LUW+kLHIuxepJcRfhADM7iTNqPsK3iGHClK9zNX4y
 fj1A==
X-Gm-Message-State: AFqh2kqperLeydieN7WI/y6w8kgiGMp1AhBLe/G1X805TMH5XOoDR3aW
 knoy2vWmBHpeQkCvFhyzhlg=
X-Google-Smtp-Source: AMrXdXvVos2ggTL5T7HwbpOP+GXCUldlSyFLCZin7OjMSnh1W6yxJ50nEOUR/Xc6pUbJWCAKcPjonA==
X-Received: by 2002:a05:6a21:398b:b0:b6:a58c:d01 with SMTP id
 ad11-20020a056a21398b00b000b6a58c0d01mr16824076pzc.30.1674218144599; 
 Fri, 20 Jan 2023 04:35:44 -0800 (PST)
Received: from debian.me (subs02-180-214-232-6.three.co.id. [180.214.232.6])
 by smtp.gmail.com with ESMTPSA id
 z189-20020a6233c6000000b0058de3516c3esm5534003pfz.142.2023.01.20.04.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:35:42 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 2CA5310189D; Fri, 20 Jan 2023 19:35:37 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Freedesktop DRI List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux KVM <kvm@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH linux-next 3/3] kvm: x86/pmu: Add blank line separator before
 KVM_CAP_PMU_EVENT_MASKED_EVENTS code path list
Date: Fri, 20 Jan 2023 19:35:34 +0700
Message-Id: <20230120123534.137413-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120123534.137413-1-bagasdotme@gmail.com>
References: <20230120123534.137413-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=bagasdotme@gmail.com;
 h=from:subject; bh=ztjmBXMVnQA+Q8YPslWD2ffuuyTaZSosFKC4Wud/mqs=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMmnuqblvYpfyPXs1e8DP07fz4sKKRN5eY/58eVV/IEWT1Vv
 Kmzf31HKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJnLvGyLBLoHBL85E3pyuuRp/+xf
 +y3l5IOY01q1D5xHmXgHn8/rcYGf4FlBw+lH5Gneue8eWN89Sf5jfYbNh89/ir5stxBk9Ou7EBAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Aaron Lewis <aaronlewis@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Oded Gabbay <ogabbay@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stephen Rothwell reported htmldocs warning when merging kvm-x86 tree:

Documentation/virt/kvm/api.rst:5070: ERROR: Unexpected indentation.

Fix the warning by adding a blank line separator before
KVM_CAP_PMU_EVENT_MASKED_EVENTS code path list to determine guest access.

Link: https://lore.kernel.org/linux-next/20230120130927.3100f935@canb.auug.org.au/
Fixes: 651daa44b11c0e ("kvm: x86/pmu: Introduce masked events to the pmu event filter")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/virt/kvm/api.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index a477186c57c193..83e3acc9e3211d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5067,6 +5067,7 @@ An encoded event will follow this layout::
 
 When the guest attempts to program the PMU, these steps are followed in
 determining if the guest should have access:
+
  1. Match the event select from the guest against the filter events.
  2. If a match is found, match the guest's unit mask to the mask and match
     values of the included filter events.
-- 
An old man doll... just what I always wanted! - Clara

