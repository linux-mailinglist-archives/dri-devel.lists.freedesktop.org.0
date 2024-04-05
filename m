Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3994C89A18D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFC510ED11;
	Fri,  5 Apr 2024 15:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VifUXvR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AC710EB8F;
 Fri,  5 Apr 2024 15:41:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4162f7ea50cso6399805e9.3; 
 Fri, 05 Apr 2024 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712331674; x=1712936474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWae/TQVR4lDMRxTHKpFB8Vkf/PIFo/hlHy1KJVttno=;
 b=VifUXvR5xab+VNxBPzVH1apw0GqirSUqXD0sW3jSflJBrW/2p25OiPqBq1PbwzARcS
 Ymc3xY1B4epIghvMYz0JnoF3GOdI4dBc94WOnwcLClR8Q1TgBwyByIxv+gcDMqirJs4w
 0pgb/hI4/xotFmFfedNgpr9TuZ6kDxeQz1JZ9fCFGTZzwsw2cah14pJWttC48nSMNIHl
 FRgK5n6W/Cec1MOAciuJIsjKp+qB7pWSqmQKocVI0s7smR5delKR9OoQFYR+6159yOBo
 8lIBXTU13JXaesECFVWQUq1nBOLT5rpu20GP23nPWnCIldT3XZd7+OqGdfi2wpIQynpb
 df4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712331674; x=1712936474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWae/TQVR4lDMRxTHKpFB8Vkf/PIFo/hlHy1KJVttno=;
 b=h60hl/zBR5uFjL1ebOYuYURoA8NB5+0fW/s+Y5XMnNkKyqhgzxv8w4Qeg/1qMSrHU7
 HT6/JuLx0bNpHAgr10dG2gNbi2wV1SHnrPogSrI1xhV1Ay9M75y3LLMByqiW4uITXBTI
 FlQTmIkvTrcS4ibTUxR/H+2vl+916NT7celmRYZ6ab3AKBmnSnahiTJD2wiXAbZCocIM
 jMuW3OrVecBoX6xm3SCwaZIEr5tecoaJQQC9RFhtTJQcIvcLjUN/nf/UCuF3HZJSPWP9
 OwfN46qUeTVPzbhP8yTdyT6jYNVrkoM1KHL9t8su1er0h49/IOqOB70B3XYcEBq+2mZp
 r1qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWudLql74iYGov2MbtDDP5IscQfKF32dEKNBDhc4qfDg5wd4t5u2pulf5VVBq96TbXYcKi4GtC0GYSLm6/awharU4ey9CeEQOptTTUyPtS3GDudmx6L91izC7BctwjrneAJltFSG9aUgR4zO5CFCJKnUHdl2gRbLXiprRIL+y66GFJrw1xjbhE5cmi1xpkx94TgEP3vKLkWtAhJ9GXomDAL6/5j2/pdpyvH/9vdyeLuHz8UFTw/j+zQ3kQrhILQVVDfKVMfBMDGF6xaj70Ymq/WLJlq5lVxDB2vllW5miJCUvbCDwPI60W3vLfiAJExzYhZhjl3Xos2sMXxfMbIJ/QTcAcUcYI68cXpIr8=
X-Gm-Message-State: AOJu0YyHJwq2DT2IFV+MfrA6O5v/mo9EbIP7oj8EQugjUizIKqDxcp0f
 3omusJV61gqUP1SHVI0YTTLAoow9HSB4eb8dHq3mydAFDYRS/GqehUMF5kqhZwN6UHPIqEauFuQ
 MzyuSbUHpTvajRExWRLd0welb/Fo=
X-Google-Smtp-Source: AGHT+IEH9WiGdwQmFDR3UUpRkcaEXiGYsc+rbm05qeGkTnAd0VuAIEH5g2EodOENEkeRm+TdhthkOlf3f027HucPkCY=
X-Received: by 2002:a05:600c:19cd:b0:416:2bef:ce81 with SMTP id
 u13-20020a05600c19cd00b004162befce81mr1484706wmq.1.1712331657141; Fri, 05 Apr
 2024 08:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <202404052349.lQch9J7G-lkp@intel.com>
In-Reply-To: <202404052349.lQch9J7G-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 5 Apr 2024 08:40:45 -0700
Message-ID: <CAADnVQJXq1bSe20FgBN=BL1E5d8qOfLv_Ettq+724h5QfRuuKg@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 bpf <bpf@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org, 
 linux-arch <linux-arch@vger.kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 5, 2024 at 8:37=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git master
> branch HEAD: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc  Add linux-next spe=
cific files for 20240405
>
> Error/Warning reports:
>
> https://lore.kernel.org/oe-kbuild-all/202404051333.7und7PPW-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202404051423.eiaXLwhX-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202404051659.aawUkGUQ-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202404052022.Cwf2ilBp-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>
> aarch64-linux-ld: kernel/bpf/verifier.c:20223:(.text+0xdbb4): undefined r=
eference to `__SCK__perf_snapshot_branch_stack'
> aarch64-linux-ld: verifier.c:(.text+0x17c3c): undefined reference to `__S=
CK__perf_snapshot_branch_stack'
> drivers/i2c/busses/i2c-i801.c:1407:(.text+0x1d2ef4a): undefined reference=
 to `i2c_root_adapter'
> kernel/bpf/verifier.c:20223:(.text+0xdba4): dangerous relocation: unsuppo=
rted relocation
> loongarch64-linux-ld: kernel/bpf/verifier.c:20223:(.text+0xa818): undefin=
ed reference to `__SCK__perf_snapshot_branch_stack'
> loongarch64-linux-ld: verifier.c:(.text+0xa964): undefined reference to `=
__SCK__perf_snapshot_branch_stack'
> mips64el-linux-ld: verifier.c:(.text.do_misc_fixups+0xd9c): undefined ref=
erence to `__SCK__perf_snapshot_branch_stack'
> riscv32-linux-ld: section .data LMA [00369000,00907967] overlaps section =
.text LMA [0007899c,01a6a6af]
> s390-linux-ld: verifier.c:(.text+0x13038): undefined reference to `__SCK_=
_perf_snapshot_branch_stack'
> verifier.c:(.text+0x17c14): relocation truncated to fit: R_AARCH64_ADR_PR=
EL_PG_HI21 against undefined symbol `__SCK__perf_snapshot_branch_stack'
> verifier.c:(.text+0xa960): undefined reference to `__SCK__perf_snapshot_b=
ranch_stack'
> verifier.c:(.text+0xadd0): dangerous relocation: unsupported relocation
> verifier.c:(.text.do_misc_fixups+0xd98): undefined reference to `__SCK__p=
erf_snapshot_branch_stack'

Fixed in bpf-next with commit:
https://lore.kernel.org/all/20240405142637.577046-1-arnd@kernel.org/
