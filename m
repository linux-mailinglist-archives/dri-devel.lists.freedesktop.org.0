Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C218158F414
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 00:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F187511AEB6;
	Wed, 10 Aug 2022 22:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779A511A088
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 22:01:41 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso3540206pjo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc;
 bh=jp9l0Ro/JdxDhmDJRS2kwEBWz37R0gfYtLWESZmTTdo=;
 b=pR/Uz73diROtKoK45pSsnr9gDkyqdToZ6bxo/wDiwdfGMSRghz3CDbk46kMtQwAFO3
 x22iXNjmkw6auGPluUNkD2GpzL9z734QfkCy9bn0Gv+2AgX5bsK1CBg+TTz2q4Lb8a0u
 3T6PRK5CoElkC2XrFW0em//AvrYpm+7+C4IJZVYZJR71jicazAfVHoEokRhkpuEu2OiY
 CCXQUmnc6fWyvGdzopEWFni24vLVkD1UncUMn+2pHen8sb5PGlGazWUWsWvcPabpO10+
 F1qMKGxOoXI3JW1qYA6ANnXZml7AHYP11NQa0uG/wg33C4hNlUfavJ68c6gZ3kNZaK36
 SQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
 bh=jp9l0Ro/JdxDhmDJRS2kwEBWz37R0gfYtLWESZmTTdo=;
 b=qup8aKGguTyQ0IOcZAd1c0SU+qyrXKwTEs6KkacNsSlC0/aBo9KsaPV2RFbXd6UPLS
 6v5eKnVYj37qJB5yR7kLmAJu1TpGd5VaRdcqXodA1PEhxi74tmOnyO6j7x/2cxs+8WT9
 jydA3SLXGfwI4vFG44SZcVYk6hkmbIfECGrH4COQdzGqLqXgDtNqhpZXfK8lSYcgyy2d
 /guvY0mCvEd1WAZiB6oqX9NFuwEH/OBMI3BboVLN4Epij5rossoOzm4f6jRabKzAOtZl
 lAJ4MVyztKAgVSQwZ+FE8yVnquGxx5fKo8grRwp8LeNVXgyNXPk3/eZ2G7XlA/l9lKoW
 p18Q==
X-Gm-Message-State: ACgBeo347+cMm0pQ2TbX8Ikawk3yRMZzJA08n1wtxXss/oTcp4lw2us6
 I2ER0YOSlvJrCRUXFKk8LBxYRg==
X-Google-Smtp-Source: AA6agR7JMJRtaF35vTSx4M/wwukmZAy0p6XS3yEu9BKdT7sblcvfXr74D3tJ4lir0IU2VY1RyB2MJQ==
X-Received: by 2002:a17:902:dac7:b0:16f:13c6:938d with SMTP id
 q7-20020a170902dac700b0016f13c6938dmr29705635plx.11.1660168900898; 
 Wed, 10 Aug 2022 15:01:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 j6-20020a170902da8600b001618b70dcc9sm13779572plx.101.2022.08.10.15.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 15:01:40 -0700 (PDT)
Date: Wed, 10 Aug 2022 15:01:40 -0700 (PDT)
X-Google-Original-Date: Wed, 10 Aug 2022 14:38:28 PDT (-0700)
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
In-Reply-To: <338e4fd5-9d6d-6f83-30fb-3ab3ed0ead31@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-1373d9c2-ae29-488e-b2c1-032ab2cd52ba@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: niklas.cassel@wdc.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org, masahiroy@kernel.org,
 daniel.lezcano@linaro.org, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, vkoul@kernel.org,
 dmaengine@vger.kernel.org, damien.lemoal@opensource.wdc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Aug 2022 10:51:00 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 14/07/2022 23:11, Conor Dooley - M52691 wrote:
>> On 14/07/2022 23:04, Palmer Dabbelt wrote:
>>> I'm trying to sort out how to merge this one.  I'm not opposed to taking it through the RISC-V tree as Rob's reviewed/acked the bindings, but just figured I'd say something before putting anything on for-next to try and minimize confusion.
>>>
>>> Unless I'm missing something it's just patch 3 that's been taken so far, via Vinod's tree.  I've dropped that one and put the rest on palmer/riscv-canaan_dt_schema, if that looks good then I'll take it into riscv/for-next when this loops back to the top of my queue.
>>>
>>> Thanks!
>> 
>> Patches 1 & 2 never got review from the DRM side and patch 12
>> depends on those. If it comes to it, you could drop those three
>> (and patch 3 that Vinod took). The only other one is patch 4,
>> which has Krzysztof's ack as memory-controller maintainer, so
>> that one should be okay.
> 
> Hey Palmer,
> These fixes have been sitting on palmer/riscv-canaan_dt_schema for
> a few weeks now, without an autobuilder complaint etc. Could you
> move it onto for-next?

These are on for-next.
