Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B9809E40
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9C510EA20;
	Fri,  8 Dec 2023 08:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AF310E9BB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 04:17:04 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5d747dbf81eso14518537b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 20:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1702009023; x=1702613823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f7vp8x0oDP3EbH3U6bJ7KDFrE+BpYL9j1ysozmjTXzU=;
 b=Wv3cuwhM+D3K7idFle1sQiM/tS8GC7eKR8eBYMFXpcCBBBnDR3OD7KRGncrRrhImhv
 PZd+cb8ECuPMetTJZezws6aSOwOp4JCa20QsiV2Ue3/GAEliT/nudsWpimJqgpJtgibf
 e/+UEbHHwikVM3O4ufZuZbnabc3RojG1OTerQPG2/LFZjA+eCMBB0HXV8rT5/8ICmAgR
 +f+03JTb8ruyM2wsLEkOiteUUb6Q0l1ra8QEMJO71MHWpCWNPVGUGJW+zHYnLy063PDD
 YQc5GjkTxiV0WRYOoF22z7X6EV+zlY1zss/UvMUT3ZYAYf7rxr6Fkb5apwnCDkrZXanf
 0RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702009023; x=1702613823;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f7vp8x0oDP3EbH3U6bJ7KDFrE+BpYL9j1ysozmjTXzU=;
 b=VD+q29TQUZLaSzJ7iEsxlbpYUDVPyErnNnSCDanpf1zxSfDX2JBB2opwX8KliaKjti
 0MGlVOoecstXNoUszho7MqKtPJ4qoqjEye+Jh7jChfA/ozh5wzYHL/IesrY8tqVacj5d
 PrXL4AKqkSv3lp4GUU6ZWXo33dSs+tfehJJ2RuLyHpEN643IOCTsyzn+/SAkLxbjb8DL
 ZU0SFI1ARkq8CTR1VN5VPmi8FKInfAPK1OLMdZKTEsJs996SC0vhfkGctFRRPPCoEiVG
 XmLzzJkKUH0Bl/vsw7BZ+azW9tHEqoiMdaVxmGVDeBEXU8R7VVwl5Mg4Gq7NxjpSWeit
 hddQ==
X-Gm-Message-State: AOJu0YyoV3Z0bpz6PZK2yFm4Mu03I/j6s6nrFeWgBNGDkaJwHl01Aitp
 CBwP3l6m8O0ojk6wqqz7Fa7L8Q==
X-Google-Smtp-Source: AGHT+IFJ7rl316vQtE3r+S2OEJohJzfcnMzp0IFjlp1x5P7qNhZsNS2qZXmMmO5ixQp4wMXH8QWNgg==
X-Received: by 2002:a0d:e690:0:b0:5d7:1941:abb with SMTP id
 p138-20020a0de690000000b005d719410abbmr3581208ywe.86.1702009023272; 
 Thu, 07 Dec 2023 20:17:03 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:41c5:bf1:860b:1e95?
 ([2600:1700:2000:b002:41c5:bf1:860b:1e95])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a0ce9c5000000b0067ac1c30e80sm468893qvo.120.2023.12.07.20.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 20:17:02 -0800 (PST)
Message-ID: <86d857bf-a833-4529-aba9-391c49a3550b@sifive.com>
Date: Thu, 7 Dec 2023 22:17:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: Add support for kernel-mode FPU
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-2-samuel.holland@sifive.com>
 <ZV283NfE/K5zLXDD@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZV283NfE/K5zLXDD@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 08 Dec 2023 08:35:21 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

On 2023-11-22 2:33 AM, Christoph Hellwig wrote:
> On Tue, Nov 21, 2023 at 07:05:13PM -0800, Samuel Holland wrote:
>> +static inline void kernel_fpu_begin(void)
>> +{
>> +	preempt_disable();
>> +	fstate_save(current, task_pt_regs(current));
>> +	csr_set(CSR_SSTATUS, SR_FS);
>> +}
>> +
>> +static inline void kernel_fpu_end(void)
>> +{
>> +	csr_clear(CSR_SSTATUS, SR_FS);
>> +	fstate_restore(current, task_pt_regs(current));
>> +	preempt_enable();
>> +}
> 
> Is there any critical reason to inline these two?  I'd much rather see
> them out of line and exported instead of the low-level helpers.

No, I will define them out of line in v2.

Regards,
Samuel

