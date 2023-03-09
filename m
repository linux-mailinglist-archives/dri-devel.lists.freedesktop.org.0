Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29106B1B24
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D5110E795;
	Thu,  9 Mar 2023 06:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D2810E795
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id BF1D142118;
 Thu,  9 Mar 2023 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678342262;
 bh=B+9nPUAyV8RcIjHdZiRtvBHrm1qUoJ2YnUJI9mL8OU8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=PlvUU7AChMN+y2uSDSmhUq9MNe+rf6C0ZtCgSk8xWkohNRj8+AyB3wr36ek6paNek
 RiQBVRMogoYUk74mPqQnlLlVUmWj9nxyFm2F+Z4kMItrty/YfZ/AsxRmAqrPd2Sg4E
 Q+5Mps+qnDRYVKtcv/q51vubggpiDtTCB8dVe91p6uBvaAdwhg6i9Kj3C1tawnxOPh
 v93PGOH4x1lR1wVdsLQFREJ3WFtdSb4BoENJX7+st1wqSranqShTxvK7/pgH7lLPfb
 IUd8fUVWqVnyfIbWo2NICrP9hSEh1gRFIbwzsB9NpGu6/qMhiTfDbyNoj0LddnTdfC
 Vq0jJdU85h8Iw==
Message-ID: <dfbed5a2-9ec5-5cd0-c992-27f4dd6c8808@asahilina.net>
Date: Thu, 9 Mar 2023 15:10:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 02/18] rust: drm: Add Device and Driver abstractions
Content-Language: en-US
To: =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
 <LgJBjn9Sl_vEeMPI8yvQkT5yQzZGk3eC8zdazRRupvjTuysDp8AJU1KY937LoPXugI78XH35UbTxn5tQzunr_pnr63bV_4HC_Ft6VW_mRL8=@protonmail.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <LgJBjn9Sl_vEeMPI8yvQkT5yQzZGk3eC8zdazRRupvjTuysDp8AJU1KY937LoPXugI78XH35UbTxn5tQzunr_pnr63bV_4HC_Ft6VW_mRL8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 linaro-mm-sig@lists.linaro.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-sgx@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2023 03.19, Björn Roy Baron wrote:
> ------- Original Message -------
> On Tuesday, March 7th, 2023 at 15:25, Asahi Lina <lina@asahilina.net> wrote:
> 
>> Add the initial abstractions for DRM drivers and devices. These go
>> together in one commit since they are fairly tightly coupled types.
>>
>> A few things have been stubbed out, to be implemented as further bits of
>> the DRM subsystem are introduced.
>>
>> Signed-off-by: Asahi Lina lina@asahilina.net
>>
>> ---
[...]

>> +/// Information data for a DRM Driver.
>> +pub struct DriverInfo {
>> +    /// Driver major version.
>> +    pub major: i32,
>> +    /// Driver minor version.
>> +    pub minor: i32,
>> +    /// Driver patchlevel version.
>> +    pub patchlevel: i32,
>> +    /// Driver name.
>> +    pub name: &'static CStr,
>> +    /// Driver description.
>> +    pub desc: &'static CStr,
>> +    /// Driver date.
>> +    pub date: &'static CStr,
>> +}
>> +
> 
> Could you please add an Invariants section to the doc comments indicating what requirements these function pointers must satisfy?

I can try (as much as I can divine from the C side anyway...). I guess
you want interface docs for each callback, so like what it must do and
what invariants each one must uphold?

Note that this is a kernel crate-only struct (the fields are not public)
so users can't create their own AllocOps variants anyway (plus AllocImpl
is sealed, on top of that), but I guess it makes sense to document for
internal kernel crate purposes. At some point it might make sense to
allow drivers to override these with proper Rust callbacks (and then the
wrappers need to ensure safety), but right now that's not implemented.

>> +/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
>> +///
>> +/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
>> +pub struct AllocOps {
>> +    pub(crate) gem_create_object: Option<
>> +        unsafe extern "C" fn(
>> +            dev: *mut bindings::drm_device,
>> +            size: usize,
>> +        ) -> *mut bindings::drm_gem_object,
>> +    >,
>> +    pub(crate) prime_handle_to_fd: Option<
>> +        unsafe extern "C" fn(
>> +            dev: *mut bindings::drm_device,
>> +            file_priv: *mut bindings::drm_file,
>> +            handle: u32,
>> +            flags: u32,
>> +            prime_fd: *mut core::ffi::c_int,
>> +        ) -> core::ffi::c_int,
>> +    >,
>> +    pub(crate) prime_fd_to_handle: Option<
>> +        unsafe extern "C" fn(
>> +            dev: *mut bindings::drm_device,
>> +            file_priv: *mut bindings::drm_file,
>> +            prime_fd: core::ffi::c_int,
>> +            handle: *mut u32,
>> +        ) -> core::ffi::c_int,
>> +    >,
>> +    pub(crate) gem_prime_import: Option<
>> +        unsafe extern "C" fn(
>> +            dev: *mut bindings::drm_device,
>> +            dma_buf: *mut bindings::dma_buf,
>> +        ) -> *mut bindings::drm_gem_object,
>> +    >,
>> +    pub(crate) gem_prime_import_sg_table: Option<
>> +        unsafe extern "C" fn(
>> +            dev: *mut bindings::drm_device,
>> +            attach: *mut bindings::dma_buf_attachment,
>> +            sgt: *mut bindings::sg_table,
>> +        ) -> *mut bindings::drm_gem_object,
>> +    >,
>> +    pub(crate) gem_prime_mmap: Option<
>> +        unsafe extern "C" fn(
>> +            obj: *mut bindings::drm_gem_object,
>> +            vma: *mut bindings::vm_area_struct,
>> +        ) -> core::ffi::c_int,
>> +    >,
>> +    pub(crate) dumb_create: Option<
>> +        unsafe extern "C" fn(
>> +            file_priv: *mut bindings::drm_file,
>> +            dev: *mut bindings::drm_device,
>> +            args: *mut bindings::drm_mode_create_dumb,
>> +        ) -> core::ffi::c_int,
>> +    >,
>> +    pub(crate) dumb_map_offset: Option<
>> +        unsafe extern "C" fn(
>> +            file_priv: *mut bindings::drm_file,
>> +            dev: *mut bindings::drm_device,
>> +            handle: u32,
>> +            offset: *mut u64,
>> +        ) -> core::ffi::c_int,
>> +    >,
>> +    pub(crate) dumb_destroy: Option<
>> +        unsafe extern "C" fn(
>> +            file_priv: *mut bindings::drm_file,
>> +            dev: *mut bindings::drm_device,
>> +            handle: u32,
>> +        ) -> core::ffi::c_int,
>> +    >,
>> +}
>> +

~~ Lina
