Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D806D82D9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC1510E149;
	Wed,  5 Apr 2023 16:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FB510E093
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:37:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-947a47eb908so55625666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680705465;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MKZ2Ou83FMMxb3v1bIH8ar3ZO4TMJeURyNtUkJ3Xro=;
 b=TQgXO0ZWy1GwstCdhBoGJZLMPbZyReyHH/ZxuWFktSToafVFKvrRcQm5rXP+toqBTj
 +YutNx/5j4DNidSkfa9gpzLsJQWHw2kehX/9JS4LsCHxOdgZ7PyD35AMc95fZEyRXJNG
 Z2qWwsiJrGa77bhrq60nYT/VwFhaOG92E0huo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680705465;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5MKZ2Ou83FMMxb3v1bIH8ar3ZO4TMJeURyNtUkJ3Xro=;
 b=L439mAQOlztUjjJzKtISdhc9/hNZaAzR3tQbAln35gkLVBMo2nLCvO28FaaKAhsV5I
 UxspVNdnHAiOf19CB81KEUyRqlDc87B8IDVYjaRM0wshIIO7WlTIHgqbwovdsDaI0grQ
 atddqZNzkLthtQD8SIINvZHA8LfgwQleb/yIU3NmIjxr8rB003Hlof8J7mqxPsD5U6E2
 BPoxgrorlf22NfX41NGXYZ4yYUgnhA+eshsUhHyOhMOZ2+Fi/249pXzIT7hgzPh8G3Ir
 RKDDzhjZ2eM7jxSy45w6Iv5sIAyHD1OFsPmdipz2FI7Uaby2QJKtZi1Qsm7493+r5ENG
 48fQ==
X-Gm-Message-State: AAQBX9f4+wuzX66TKRvo1STMQfwJUP7+a1N1DcIk4BLyL2Us6V0l98eN
 TV44WqlotOnbjjuh1XdxnBAOSQ==
X-Google-Smtp-Source: AKy350ZK14HHuuJP60AghSHFItUw1di6hSb4WSbQRad1gXmOdpYPeMkO0gMAmhOzrgT9AG2oIycLXg==
X-Received: by 2002:a17:906:13:b0:8f0:ba09:4abe with SMTP id
 19-20020a170906001300b008f0ba094abemr3108103eja.2.1680705463645; 
 Wed, 05 Apr 2023 07:37:43 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 m11-20020a170906160b00b00938041aef83sm7427265ejd.169.2023.04.05.07.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 07:37:42 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:37:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi driver for Apple AGX
 GPUs
Message-ID: <ZC2HtBOaoUAzVCVH@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Mailman-Approved-At: Wed, 05 Apr 2023 16:03:52 +0000
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
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
> +/// A generic monotonically incrementing ID used to uniquely identify object instances within the
> +/// driver.
> +pub(crate) struct ID(AtomicU64);
> +
> +impl ID {
> +    /// Create a new ID counter with a given value.
> +    fn new(val: u64) -> ID {
> +        ID(AtomicU64::new(val))
> +    }
> +
> +    /// Fetch the next unique ID.
> +    pub(crate) fn next(&self) -> u64 {
> +        self.0.fetch_add(1, Ordering::Relaxed)
> +    }
> +}

Continuing the theme of me commenting on individual things, I stumbled
over this because I noticed that there's a lot of id based lookups where I
don't expect them, and started chasing.

- For ids use xarray, not atomic counters. Yes I know dma_fence timelines
  gets this wrong, this goes back to an innocent time where we didn't
  allocate more than one timeline per engine, and no one fixed it since
  then. Yes u64 should be big enough for everyone :-/

- Attaching ID spaces to drm_device is also not great. drm is full of
  these mistakes. Much better if their per drm_file and so private to each
  client.

- They shouldn't be used for anything else than uapi id -> kernel object
  lookup at the beginning of ioctl code, and nowhere else. At least from
  skimming it seems like these are used all over the driver codebase,
  which does freak me out. At least on the C side that's a clear indicator
  for a refcount/lockin/data structure model that's not thought out at
  all.

What's going on here, what do I miss?
-Daniel


> +
> +impl Default for ID {
> +    /// IDs default to starting at 2, as 0/1 are considered reserved for the system.
> +    fn default() -> Self {
> +        Self::new(2)
> +    }
> +}
> +
> +/// A guard representing one active submission on the GPU. When dropped, decrements the active
> +/// submission count.
> +pub(crate) struct OpGuard(Arc<dyn GpuManagerPriv>);
> +
> +impl Drop for OpGuard {
> +    fn drop(&mut self) {
> +        self.0.end_op();
> +    }
> +}
> +
> +/// Set of global sequence IDs used in the driver.
> +#[derive(Default)]
> +pub(crate) struct SequenceIDs {
> +    /// `File` instance ID.
> +    pub(crate) file: ID,
> +    /// `Vm` instance ID.
> +    pub(crate) vm: ID,
> +    /// Submission instance ID.
> +    pub(crate) submission: ID,
> +    /// `Queue` instance ID.
> +    pub(crate) queue: ID,
> +}
> +
> +/// Top-level GPU manager that owns all the global state relevant to the driver instance.
> +#[versions(AGX)]
> +pub(crate) struct GpuManager {
> +    dev: AsahiDevice,
> +    cfg: &'static hw::HwConfig,
> +    dyncfg: Box<hw::DynConfig>,
> +    pub(crate) initdata: Box<fw::types::GpuObject<fw::initdata::InitData::ver>>,
> +    uat: Box<mmu::Uat>,
> +    crashed: AtomicBool,
> +    alloc: Mutex<KernelAllocators>,
> +    io_mappings: Vec<mmu::Mapping>,
> +    rtkit: Mutex<Option<Box<rtkit::RtKit<GpuManager::ver>>>>,
> +    rx_channels: Mutex<Box<RxChannels::ver>>,
> +    tx_channels: Mutex<Box<TxChannels::ver>>,
> +    fwctl_channel: Mutex<Box<channel::FwCtlChannel>>,
> +    pipes: PipeChannels::ver,
> +    event_manager: Arc<event::EventManager>,
> +    buffer_mgr: buffer::BufferManager,
> +    ids: SequenceIDs,
> +}
> +
> +/// Trait used to abstract the firmware/GPU-dependent variants of the GpuManager.
> +pub(crate) trait GpuManager: Send + Sync {
> +    /// Cast as an Any type.
> +    fn as_any(&self) -> &dyn Any;
> +    /// Cast Arc<Self> as an Any type.
> +    fn arc_as_any(self: Arc<Self>) -> Arc<dyn Any + Sync + Send>;
> +    /// Initialize the GPU.
> +    fn init(&self) -> Result;
> +    /// Update the GPU globals from global info
> +    ///
> +    /// TODO: Unclear what can and cannot be updated like this.
> +    fn update_globals(&self);
> +    /// Get a reference to the KernelAllocators.
> +    fn alloc(&self) -> Guard<'_, Mutex<KernelAllocators>>;
> +    /// Create a new `Vm` given a unique `File` ID.
> +    fn new_vm(&self, file_id: u64) -> Result<mmu::Vm>;
> +    /// Bind a `Vm` to an available slot and return the `VmBind`.
> +    fn bind_vm(&self, vm: &mmu::Vm) -> Result<mmu::VmBind>;
> +    /// Create a new user command queue.
> +    fn new_queue(
> +        &self,
> +        vm: mmu::Vm,
> +        ualloc: Arc<Mutex<alloc::DefaultAllocator>>,
> +        ualloc_priv: Arc<Mutex<alloc::DefaultAllocator>>,
> +        priority: u32,
> +        caps: u32,
> +    ) -> Result<Box<dyn queue::Queue>>;
> +    /// Return a reference to the global `SequenceIDs` instance.
> +    fn ids(&self) -> &SequenceIDs;
> +    /// Kick the firmware (wake it up if asleep).
> +    ///
> +    /// This should be useful to reduce latency on work submission, so we can ask the firmware to
> +    /// wake up while we do some preparatory work for the work submission.
> +    fn kick_firmware(&self) -> Result;
> +    /// Invalidate a GPU scheduler context. Must be called before the relevant structures are freed.
> +    fn invalidate_context(
> +        &self,
> +        context: &fw::types::GpuObject<fw::workqueue::GpuContextData>,
> +    ) -> Result;
> +    /// Flush the entire firmware cache.
> +    ///
> +    /// TODO: Does this actually work?
> +    fn flush_fw_cache(&self) -> Result;
> +    /// Handle a GPU work timeout event.
> +    fn handle_timeout(&self, counter: u32, event_slot: u32);
> +    /// Handle a GPU fault event.
> +    fn handle_fault(&self);
> +    /// Wait for the GPU to become idle and power off.
> +    fn wait_for_poweroff(&self, timeout: usize) -> Result;
> +    /// Send a firmware control command (secure cache flush).
> +    fn fwctl(&self, msg: fw::channels::FwCtlMsg) -> Result;
> +    /// Get the static GPU configuration for this SoC.
> +    fn get_cfg(&self) -> &'static hw::HwConfig;
> +    /// Get the dynamic GPU configuration for this SoC.
> +    fn get_dyncfg(&self) -> &hw::DynConfig;
> +}
> +
> +/// Private generic trait for functions that don't need to escape this module.
> +trait GpuManagerPriv {
> +    /// Decrement the pending submission counter.
> +    fn end_op(&self);
> +}
> +
> +#[versions(AGX)]
> +#[vtable]
> +impl rtkit::Operations for GpuManager::ver {
> +    type Data = Arc<GpuManager::ver>;
> +    type Buffer = gem::ObjectRef;
> +
> +    fn recv_message(data: <Self::Data as ForeignOwnable>::Borrowed<'_>, ep: u8, msg: u64) {
> +        let dev = &data.dev;
> +        //dev_info!(dev, "RtKit message: {:#x}:{:#x}\n", ep, msg);
> +
> +        if ep != EP_FIRMWARE || msg != MSG_RX_DOORBELL {
> +            dev_err!(dev, "Unknown message: {:#x}:{:#x}\n", ep, msg);
> +            return;
> +        }
> +
> +        let mut ch = data.rx_channels.lock();
> +
> +        ch.fw_log.poll();
> +        ch.ktrace.poll();
> +        ch.stats.poll();
> +        ch.event.poll();
> +    }
> +
> +    fn crashed(data: <Self::Data as ForeignOwnable>::Borrowed<'_>) {
> +        let dev = &data.dev;
> +        dev_err!(dev, "GPU firmware crashed, failing all jobs\n");
> +
> +        data.crashed.store(true, Ordering::Relaxed);
> +        data.event_manager.fail_all(workqueue::WorkError::NoDevice);
> +    }
> +
> +    fn shmem_alloc(
> +        data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
> +        size: usize,
> +    ) -> Result<Self::Buffer> {
> +        let dev = &data.dev;
> +        mod_dev_dbg!(dev, "shmem_alloc() {:#x} bytes\n", size);
> +
> +        let mut obj = gem::new_kernel_object(dev, size)?;
> +        obj.vmap()?;
> +        let iova = obj.map_into(data.uat.kernel_vm())?;
> +        mod_dev_dbg!(dev, "shmem_alloc() -> VA {:#x}\n", iova);
> +        Ok(obj)
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl GpuManager::ver {
> +    /// Create a new GpuManager of this version/GPU combination.
> +    #[inline(never)]
> +    pub(crate) fn new(
> +        dev: &AsahiDevice,
> +        res: &regs::Resources,
> +        cfg: &'static hw::HwConfig,
> +    ) -> Result<Arc<GpuManager::ver>> {
> +        let uat = Self::make_uat(dev, cfg)?;
> +        let dyncfg = Self::make_dyncfg(dev, res, cfg, &uat)?;
> +
> +        let mut alloc = KernelAllocators {
> +            private: alloc::DefaultAllocator::new(
> +                dev,
> +                uat.kernel_vm(),
> +                IOVA_KERN_PRIV_BASE,
> +                IOVA_KERN_PRIV_TOP,
> +                0x80,
> +                mmu::PROT_FW_PRIV_RW,
> +                1024 * 1024,
> +                true,
> +                fmt!("Kernel Private"),
> +                true,
> +            )?,
> +            shared: alloc::DefaultAllocator::new(
> +                dev,
> +                uat.kernel_vm(),
> +                IOVA_KERN_SHARED_BASE,
> +                IOVA_KERN_SHARED_TOP,
> +                0x80,
> +                mmu::PROT_FW_SHARED_RW,
> +                1024 * 1024,
> +                true,
> +                fmt!("Kernel Shared"),
> +                false,
> +            )?,
> +            shared_ro: alloc::DefaultAllocator::new(
> +                dev,
> +                uat.kernel_vm(),
> +                IOVA_KERN_SHARED_RO_BASE,
> +                IOVA_KERN_SHARED_RO_TOP,
> +                0x80,
> +                mmu::PROT_FW_SHARED_RO,
> +                64 * 1024,
> +                true,
> +                fmt!("Kernel RO Shared"),
> +                false,
> +            )?,
> +            gpu: alloc::DefaultAllocator::new(
> +                dev,
> +                uat.kernel_vm(),
> +                IOVA_KERN_GPU_BASE,
> +                IOVA_KERN_GPU_TOP,
> +                0x80,
> +                mmu::PROT_GPU_FW_SHARED_RW,
> +                64 * 1024,
> +                true,
> +                fmt!("Kernel GPU Shared"),
> +                false,
> +            )?,
> +        };
> +
> +        let event_manager = Self::make_event_manager(&mut alloc)?;
> +        let initdata = Self::make_initdata(cfg, &dyncfg, &mut alloc)?;
> +        let mut mgr = Self::make_mgr(dev, cfg, dyncfg, uat, alloc, event_manager, initdata)?;
> +
> +        {
> +            let fwctl = mgr.fwctl_channel.lock();
> +            let p_fwctl = fwctl.to_raw();
> +            core::mem::drop(fwctl);
> +
> +            mgr.initdata.fw_status.with_mut(|raw, _inner| {
> +                raw.fwctl_channel = p_fwctl;
> +            });
> +        }
> +
> +        {
> +            let txc = mgr.tx_channels.lock();
> +            let p_device_control = txc.device_control.to_raw();
> +            core::mem::drop(txc);
> +
> +            let rxc = mgr.rx_channels.lock();
> +            let p_event = rxc.event.to_raw();
> +            let p_fw_log = rxc.fw_log.to_raw();
> +            let p_ktrace = rxc.ktrace.to_raw();
> +            let p_stats = rxc.stats.to_raw();
> +            let p_fwlog_buf = rxc.fw_log.get_buf();
> +            core::mem::drop(rxc);
> +
> +            mgr.initdata.runtime_pointers.with_mut(|raw, _inner| {
> +                raw.device_control = p_device_control;
> +                raw.event = p_event;
> +                raw.fw_log = p_fw_log;
> +                raw.ktrace = p_ktrace;
> +                raw.stats = p_stats;
> +                raw.fwlog_buf = Some(p_fwlog_buf);
> +            });
> +        }
> +
> +        let mut p_pipes: Vec<fw::initdata::raw::PipeChannels::ver> = Vec::new();
> +
> +        for ((v, f), c) in mgr
> +            .pipes
> +            .vtx
> +            .iter()
> +            .zip(&mgr.pipes.frag)
> +            .zip(&mgr.pipes.comp)
> +        {
> +            p_pipes.try_push(fw::initdata::raw::PipeChannels::ver {
> +                vtx: v.lock().to_raw(),
> +                frag: f.lock().to_raw(),
> +                comp: c.lock().to_raw(),
> +            })?;
> +        }
> +
> +        mgr.initdata.runtime_pointers.with_mut(|raw, _inner| {
> +            for (i, p) in p_pipes.into_iter().enumerate() {
> +                raw.pipes[i].vtx = p.vtx;
> +                raw.pipes[i].frag = p.frag;
> +                raw.pipes[i].comp = p.comp;
> +            }
> +        });
> +
> +        for (i, map) in cfg.io_mappings.iter().enumerate() {
> +            if let Some(map) = map.as_ref() {
> +                mgr.iomap(i, map)?;
> +            }
> +        }
> +
> +        let mgr = Arc::from(mgr);
> +
> +        let rtkit = Box::try_new(rtkit::RtKit::<GpuManager::ver>::new(
> +            dev,
> +            None,
> +            0,
> +            mgr.clone(),
> +        )?)?;
> +
> +        *mgr.rtkit.lock() = Some(rtkit);
> +
> +        {
> +            let mut rxc = mgr.rx_channels.lock();
> +            rxc.event.set_manager(mgr.clone());
> +        }
> +
> +        Ok(mgr)
> +    }
> +
> +    /// Build the entire GPU InitData structure tree and return it as a boxed GpuObject.
> +    fn make_initdata(
> +        cfg: &'static hw::HwConfig,
> +        dyncfg: &hw::DynConfig,
> +        alloc: &mut KernelAllocators,
> +    ) -> Result<Box<fw::types::GpuObject<fw::initdata::InitData::ver>>> {
> +        let mut builder = initdata::InitDataBuilder::ver::new(alloc, cfg, dyncfg);
> +        builder.build()
> +    }
> +
> +    /// Create a fresh boxed Uat instance.
> +    ///
> +    /// Force disable inlining to avoid blowing up the stack.
> +    #[inline(never)]
> +    fn make_uat(dev: &AsahiDevice, cfg: &'static hw::HwConfig) -> Result<Box<mmu::Uat>> {
> +        Ok(Box::try_new(mmu::Uat::new(dev, cfg)?)?)
> +    }
> +
> +    /// Actually create the final GpuManager instance, as a UniqueArc.
> +    ///
> +    /// Force disable inlining to avoid blowing up the stack.
> +    #[inline(never)]
> +    fn make_mgr(
> +        dev: &AsahiDevice,
> +        cfg: &'static hw::HwConfig,
> +        dyncfg: Box<hw::DynConfig>,
> +        uat: Box<mmu::Uat>,
> +        mut alloc: KernelAllocators,
> +        event_manager: Arc<event::EventManager>,
> +        initdata: Box<fw::types::GpuObject<fw::initdata::InitData::ver>>,
> +    ) -> Result<UniqueArc<GpuManager::ver>> {
> +        let mut pipes = PipeChannels::ver {
> +            vtx: Vec::new(),
> +            frag: Vec::new(),
> +            comp: Vec::new(),
> +        };
> +
> +        for _i in 0..=NUM_PIPES - 1 {
> +            pipes
> +                .vtx
> +                .try_push(Mutex::new(channel::PipeChannel::ver::new(dev, &mut alloc)?))?;
> +            pipes
> +                .frag
> +                .try_push(Mutex::new(channel::PipeChannel::ver::new(dev, &mut alloc)?))?;
> +            pipes
> +                .comp
> +                .try_push(Mutex::new(channel::PipeChannel::ver::new(dev, &mut alloc)?))?;
> +        }
> +
> +        UniqueArc::try_new(GpuManager::ver {
> +            dev: dev.clone(),
> +            cfg,
> +            dyncfg,
> +            initdata,
> +            uat,
> +            io_mappings: Vec::new(),
> +            rtkit: Mutex::new(None),
> +            crashed: AtomicBool::new(false),
> +            rx_channels: Mutex::new(box_in_place!(RxChannels::ver {
> +                event: channel::EventChannel::new(dev, &mut alloc, event_manager.clone())?,
> +                fw_log: channel::FwLogChannel::new(dev, &mut alloc)?,
> +                ktrace: channel::KTraceChannel::new(dev, &mut alloc)?,
> +                stats: channel::StatsChannel::ver::new(dev, &mut alloc)?,
> +            })?),
> +            tx_channels: Mutex::new(Box::try_new(TxChannels::ver {
> +                device_control: channel::DeviceControlChannel::ver::new(dev, &mut alloc)?,
> +            })?),
> +            fwctl_channel: Mutex::new(Box::try_new(channel::FwCtlChannel::new(dev, &mut alloc)?)?),
> +            pipes,
> +            event_manager,
> +            buffer_mgr: buffer::BufferManager::new()?,
> +            alloc: Mutex::new(alloc),
> +            ids: Default::default(),
> +        })
> +    }
> +
> +    /// Fetch and validate the GPU dynamic configuration from the device tree and hardware.
> +    ///
> +    /// Force disable inlining to avoid blowing up the stack.
> +    #[inline(never)]
> +    fn make_dyncfg(
> +        dev: &AsahiDevice,
> +        res: &regs::Resources,
> +        cfg: &'static hw::HwConfig,
> +        uat: &mmu::Uat,
> +    ) -> Result<Box<hw::DynConfig>> {
> +        let gpu_id = res.get_gpu_id()?;
> +
> +        dev_info!(dev, "GPU Information:\n");
> +        dev_info!(
> +            dev,
> +            "  Type: {:?}{:?}\n",
> +            gpu_id.gpu_gen,
> +            gpu_id.gpu_variant
> +        );
> +        dev_info!(dev, "  Max dies: {}\n", gpu_id.max_dies);
> +        dev_info!(dev, "  Clusters: {}\n", gpu_id.num_clusters);
> +        dev_info!(
> +            dev,
> +            "  Cores: {} ({})\n",
> +            gpu_id.num_cores,
> +            gpu_id.num_cores * gpu_id.num_clusters
> +        );
> +        dev_info!(
> +            dev,
> +            "  Frags: {} ({})\n",
> +            gpu_id.num_frags,
> +            gpu_id.num_frags * gpu_id.num_clusters
> +        );
> +        dev_info!(
> +            dev,
> +            "  GPs: {} ({})\n",
> +            gpu_id.num_gps,
> +            gpu_id.num_gps * gpu_id.num_clusters
> +        );
> +        dev_info!(dev, "  Core masks: {:#x?}\n", gpu_id.core_masks);
> +        dev_info!(dev, "  Active cores: {}\n", gpu_id.total_active_cores);
> +
> +        dev_info!(dev, "Getting configuration from device tree...\n");
> +        let pwr_cfg = hw::PwrConfig::load(dev, cfg)?;
> +        dev_info!(dev, "Dynamic configuration fetched\n");
> +
> +        if gpu_id.gpu_gen != cfg.gpu_gen || gpu_id.gpu_variant != cfg.gpu_variant {
> +            dev_err!(
> +                dev,
> +                "GPU type mismatch (expected {:?}{:?}, found {:?}{:?})\n",
> +                cfg.gpu_gen,
> +                cfg.gpu_variant,
> +                gpu_id.gpu_gen,
> +                gpu_id.gpu_variant
> +            );
> +            return Err(EIO);
> +        }
> +        if gpu_id.num_clusters > cfg.max_num_clusters {
> +            dev_err!(
> +                dev,
> +                "Too many clusters ({} > {})\n",
> +                gpu_id.num_clusters,
> +                cfg.max_num_clusters
> +            );
> +            return Err(EIO);
> +        }
> +        if gpu_id.num_cores > cfg.max_num_cores {
> +            dev_err!(
> +                dev,
> +                "Too many cores ({} > {})\n",
> +                gpu_id.num_cores,
> +                cfg.max_num_cores
> +            );
> +            return Err(EIO);
> +        }
> +        if gpu_id.num_frags > cfg.max_num_frags {
> +            dev_err!(
> +                dev,
> +                "Too many frags ({} > {})\n",
> +                gpu_id.num_frags,
> +                cfg.max_num_frags
> +            );
> +            return Err(EIO);
> +        }
> +        if gpu_id.num_gps > cfg.max_num_gps {
> +            dev_err!(
> +                dev,
> +                "Too many GPs ({} > {})\n",
> +                gpu_id.num_gps,
> +                cfg.max_num_gps
> +            );
> +            return Err(EIO);
> +        }
> +
> +        Ok(Box::try_new(hw::DynConfig {
> +            pwr: pwr_cfg,
> +            uat_ttb_base: uat.ttb_base(),
> +            id: gpu_id,
> +        })?)
> +    }
> +
> +    /// Create the global GPU event manager, and return an `Arc<>` to it.
> +    fn make_event_manager(alloc: &mut KernelAllocators) -> Result<Arc<event::EventManager>> {
> +        Arc::try_new(event::EventManager::new(alloc)?)
> +    }
> +
> +    /// Create a new MMIO mapping and add it to the mappings list in initdata at the specified
> +    /// index.
> +    fn iomap(&mut self, index: usize, map: &hw::IOMapping) -> Result {
> +        let off = map.base & mmu::UAT_PGMSK;
> +        let base = map.base - off;
> +        let end = (map.base + map.size + mmu::UAT_PGMSK) & !mmu::UAT_PGMSK;
> +        let mapping = self
> +            .uat
> +            .kernel_vm()
> +            .map_io(base, end - base, map.writable)?;
> +
> +        self.initdata.runtime_pointers.hwdata_b.with_mut(|raw, _| {
> +            raw.io_mappings[index] = fw::initdata::raw::IOMapping {
> +                phys_addr: U64(map.base as u64),
> +                virt_addr: U64((mapping.iova() + off) as u64),
> +                size: map.size as u32,
> +                range_size: map.range_size as u32,
> +                readwrite: U64(map.writable as u64),
> +            };
> +        });
> +
> +        self.io_mappings.try_push(mapping)?;
> +        Ok(())
> +    }
> +
> +    /// Mark work associated with currently in-progress event slots as failed, after a fault or
> +    /// timeout.
> +    fn mark_pending_events(&self, culprit_slot: Option<u32>, error: workqueue::WorkError) {
> +        dev_err!(self.dev, "  Pending events:\n");
> +
> +        self.initdata.globals.with(|raw, _inner| {
> +            for i in raw.pending_stamps.iter() {
> +                let info = i.info.load(Ordering::Relaxed);
> +                let wait_value = i.wait_value.load(Ordering::Relaxed);
> +
> +                if info & 1 != 0 {
> +                    let slot = info >> 3;
> +                    let flags = info & 0x7;
> +                    dev_err!(
> +                        self.dev,
> +                        "    [{}] flags={} value={:#x}\n",
> +                        slot,
> +                        flags,
> +                        wait_value
> +                    );
> +                    let error = if culprit_slot.is_some() && culprit_slot != Some(slot) {
> +                        workqueue::WorkError::Killed
> +                    } else {
> +                        error
> +                    };
> +                    self.event_manager.mark_error(slot, wait_value, error);
> +                    i.info.store(0, Ordering::Relaxed);
> +                    i.wait_value.store(0, Ordering::Relaxed);
> +                }
> +            }
> +        });
> +    }
> +
> +    /// Fetch the GPU MMU fault information from the hardware registers.
> +    fn get_fault_info(&self) -> Option<regs::FaultInfo> {
> +        let data = self.dev.data();
> +
> +        let res = match data.resources() {
> +            Some(res) => res,
> +            None => {
> +                dev_err!(self.dev, "  Failed to acquire resources\n");
> +                return None;
> +            }
> +        };
> +
> +        let info = res.get_fault_info();
> +        if info.is_some() {
> +            dev_err!(self.dev, "  Fault info: {:#x?}\n", info.as_ref().unwrap());
> +        }
> +        info
> +    }
> +
> +    /// Resume the GPU firmware after it halts (due to a timeout, fault, or request).
> +    fn recover(&self) {
> +        self.initdata.fw_status.with(|raw, _inner| {
> +            let halt_count = raw.flags.halt_count.load(Ordering::Relaxed);
> +            let mut halted = raw.flags.halted.load(Ordering::Relaxed);
> +            dev_err!(self.dev, "  Halt count: {}\n", halt_count);
> +            dev_err!(self.dev, "  Halted: {}\n", halted);
> +
> +            if halted == 0 {
> +                let timeout = time::ktime_get() + Duration::from_millis(HALT_ENTER_TIMEOUT_MS);
> +                while time::ktime_get() < timeout {
> +                    halted = raw.flags.halted.load(Ordering::Relaxed);
> +                    if halted != 0 {
> +                        break;
> +                    }
> +                    mem::sync();
> +                }
> +                halted = raw.flags.halted.load(Ordering::Relaxed);
> +            }
> +
> +            if debug_enabled(DebugFlags::NoGpuRecovery) {
> +                dev_crit!(self.dev, "  GPU recovery is disabled, wedging forever!\n");
> +            } else if halted != 0 {
> +                dev_err!(self.dev, "  Attempting recovery...\n");
> +                raw.flags.halted.store(0, Ordering::SeqCst);
> +                raw.flags.resume.store(1, Ordering::SeqCst);
> +            } else {
> +                dev_err!(self.dev, "  Cannot recover.\n");
> +            }
> +        });
> +    }
> +
> +    /// Return the packed GPU enabled core masks.
> +    // Only used for some versions
> +    #[allow(dead_code)]
> +    pub(crate) fn core_masks_packed(&self) -> &[u32] {
> +        self.dyncfg.id.core_masks_packed.as_slice()
> +    }
> +
> +    /// Kick a submission pipe for a submitted job to tell the firmware to start processing it.
> +    pub(crate) fn run_job(&self, job: workqueue::JobSubmission::ver<'_>) -> Result {
> +        mod_dev_dbg!(self.dev, "GPU: run_job\n");
> +
> +        let pipe_type = job.pipe_type();
> +        mod_dev_dbg!(self.dev, "GPU: run_job: pipe_type={:?}\n", pipe_type);
> +
> +        let pipes = match pipe_type {
> +            PipeType::Vertex => &self.pipes.vtx,
> +            PipeType::Fragment => &self.pipes.frag,
> +            PipeType::Compute => &self.pipes.comp,
> +        };
> +
> +        let index: usize = job.priority() as usize;
> +        let mut pipe = pipes.get(index).ok_or(EIO)?.lock();
> +
> +        mod_dev_dbg!(self.dev, "GPU: run_job: run()\n");
> +        job.run(&mut pipe);
> +        mod_dev_dbg!(self.dev, "GPU: run_job: ring doorbell\n");
> +
> +        let mut guard = self.rtkit.lock();
> +        let rtk = guard.as_mut().unwrap();
> +        rtk.send_message(
> +            EP_DOORBELL,
> +            MSG_TX_DOORBELL | pipe_type as u64 | ((index as u64) << 2),
> +        )?;
> +        mod_dev_dbg!(self.dev, "GPU: run_job: done\n");
> +
> +        Ok(())
> +    }
> +
> +    pub(crate) fn is_crashed(&self) -> bool {
> +        self.crashed.load(Ordering::Relaxed)
> +    }
> +
> +    pub(crate) fn start_op(self: &Arc<GpuManager::ver>) -> Result<OpGuard> {
> +        if self.is_crashed() {
> +            return Err(ENODEV);
> +        }
> +
> +        let val = self
> +            .initdata
> +            .globals
> +            .with(|raw, _inner| raw.pending_submissions.fetch_add(1, Ordering::Acquire));
> +
> +        mod_dev_dbg!(self.dev, "OP start (pending: {})\n", val + 1);
> +        self.kick_firmware()?;
> +        Ok(OpGuard(self.clone()))
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl GpuManager for GpuManager::ver {
> +    fn as_any(&self) -> &dyn Any {
> +        self
> +    }
> +
> +    fn arc_as_any(self: Arc<Self>) -> Arc<dyn Any + Sync + Send> {
> +        self as Arc<dyn Any + Sync + Send>
> +    }
> +
> +    fn init(&self) -> Result {
> +        self.tx_channels.lock().device_control.send(
> +            &fw::channels::DeviceControlMsg::ver::Initialize(Default::default()),
> +        );
> +
> +        let initdata = self.initdata.gpu_va().get();
> +        let mut guard = self.rtkit.lock();
> +        let rtk = guard.as_mut().unwrap();
> +
> +        rtk.boot()?;
> +        rtk.start_endpoint(EP_FIRMWARE)?;
> +        rtk.start_endpoint(EP_DOORBELL)?;
> +        rtk.send_message(EP_FIRMWARE, MSG_INIT | (initdata & INIT_DATA_MASK))?;
> +        rtk.send_message(EP_DOORBELL, MSG_TX_DOORBELL | DOORBELL_DEVCTRL)?;
> +        core::mem::drop(guard);
> +
> +        self.kick_firmware()?;
> +        Ok(())
> +    }
> +
> +    fn update_globals(&self) {
> +        let mut timeout: u32 = 2;
> +        if debug_enabled(DebugFlags::WaitForPowerOff) {
> +            timeout = 0;
> +        } else if debug_enabled(DebugFlags::KeepGpuPowered) {
> +            timeout = 5000;
> +        }
> +
> +        self.initdata.globals.with(|raw, _inner| {
> +            raw.idle_off_delay_ms.store(timeout, Ordering::Relaxed);
> +        });
> +    }
> +
> +    fn alloc(&self) -> Guard<'_, Mutex<KernelAllocators>> {
> +        let mut guard = self.alloc.lock();
> +        let (garbage_count, garbage_bytes) = guard.private.garbage();
> +        if garbage_bytes > 1024 * 1024 {
> +            mod_dev_dbg!(
> +                self.dev,
> +                "Collecting kalloc garbage ({} objects, {} bytes)\n",
> +                garbage_count,
> +                garbage_bytes
> +            );
> +            if self.flush_fw_cache().is_err() {
> +                dev_err!(self.dev, "Failed to flush FW cache\n");
> +            } else {
> +                guard.private.collect_garbage(garbage_count);
> +            }
> +        }
> +
> +        guard
> +    }
> +
> +    fn new_vm(&self, file_id: u64) -> Result<mmu::Vm> {
> +        self.uat.new_vm(self.ids.vm.next(), file_id)
> +    }
> +
> +    fn bind_vm(&self, vm: &mmu::Vm) -> Result<mmu::VmBind> {
> +        self.uat.bind(vm)
> +    }
> +
> +    fn new_queue(
> +        &self,
> +        vm: mmu::Vm,
> +        ualloc: Arc<Mutex<alloc::DefaultAllocator>>,
> +        ualloc_priv: Arc<Mutex<alloc::DefaultAllocator>>,
> +        priority: u32,
> +        caps: u32,
> +    ) -> Result<Box<dyn queue::Queue>> {
> +        let mut kalloc = self.alloc();
> +        let id = self.ids.queue.next();
> +        Ok(Box::try_new(queue::Queue::ver::new(
> +            &self.dev,
> +            vm,
> +            &mut kalloc,
> +            ualloc,
> +            ualloc_priv,
> +            self.event_manager.clone(),
> +            &self.buffer_mgr,
> +            id,
> +            priority,
> +            caps,
> +        )?)?)
> +    }
> +
> +    fn kick_firmware(&self) -> Result {
> +        if self.is_crashed() {
> +            return Err(ENODEV);
> +        }
> +
> +        let mut guard = self.rtkit.lock();
> +        let rtk = guard.as_mut().unwrap();
> +        rtk.send_message(EP_DOORBELL, MSG_TX_DOORBELL | DOORBELL_KICKFW)?;
> +
> +        Ok(())
> +    }
> +
> +    fn invalidate_context(
> +        &self,
> +        context: &fw::types::GpuObject<fw::workqueue::GpuContextData>,
> +    ) -> Result {
> +        mod_dev_dbg!(
> +            self.dev,
> +            "Invalidating GPU context @ {:?}\n",
> +            context.weak_pointer()
> +        );
> +
> +        if self.is_crashed() {
> +            return Err(ENODEV);
> +        }
> +
> +        let mut guard = self.alloc.lock();
> +        let (garbage_count, _) = guard.private.garbage();
> +
> +        let dc = context.with(
> +            |raw, _inner| fw::channels::DeviceControlMsg::ver::DestroyContext {
> +                unk_4: 0,
> +                ctx_23: raw.unk_23,
> +                __pad0: Default::default(),
> +                unk_c: 0,
> +                unk_10: 0,
> +                ctx_0: raw.unk_0,
> +                ctx_1: raw.unk_1,
> +                ctx_4: raw.unk_4,
> +                __pad1: Default::default(),
> +                unk_18: 0,
> +                gpu_context: Some(context.weak_pointer()),
> +                __pad2: Default::default(),
> +            },
> +        );
> +
> +        mod_dev_dbg!(self.dev, "Context invalidation command: {:?}\n", &dc);
> +
> +        let mut txch = self.tx_channels.lock();
> +
> +        let token = txch.device_control.send(&dc);
> +
> +        {
> +            let mut guard = self.rtkit.lock();
> +            let rtk = guard.as_mut().unwrap();
> +            rtk.send_message(EP_DOORBELL, MSG_TX_DOORBELL | DOORBELL_DEVCTRL)?;
> +        }
> +
> +        txch.device_control.wait_for(token)?;
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "GPU context invalidated: {:?}\n",
> +            context.weak_pointer()
> +        );
> +
> +        // The invalidation does a cache flush, so it is okay to collect garbage
> +        guard.private.collect_garbage(garbage_count);
> +
> +        Ok(())
> +    }
> +
> +    fn flush_fw_cache(&self) -> Result {
> +        mod_dev_dbg!(self.dev, "Flushing coprocessor data cache\n");
> +
> +        if self.is_crashed() {
> +            return Err(ENODEV);
> +        }
> +
> +        // ctx_0 == 0xff or ctx_1 == 0xff cause no effect on context,
> +        // but this command does a full cache flush too, so abuse it
> +        // for that.
> +
> +        let dc = fw::channels::DeviceControlMsg::ver::DestroyContext {
> +            unk_4: 0,
> +            ctx_23: 0,
> +            __pad0: Default::default(),
> +            unk_c: 0,
> +            unk_10: 0,
> +            ctx_0: 0xff,
> +            ctx_1: 0xff,
> +            ctx_4: 0,
> +            __pad1: Default::default(),
> +            unk_18: 0,
> +            gpu_context: None,
> +            __pad2: Default::default(),
> +        };
> +
> +        let mut txch = self.tx_channels.lock();
> +
> +        let token = txch.device_control.send(&dc);
> +        {
> +            let mut guard = self.rtkit.lock();
> +            let rtk = guard.as_mut().unwrap();
> +            rtk.send_message(EP_DOORBELL, MSG_TX_DOORBELL | DOORBELL_DEVCTRL)?;
> +        }
> +
> +        txch.device_control.wait_for(token)?;
> +        Ok(())
> +    }
> +
> +    fn ids(&self) -> &SequenceIDs {
> +        &self.ids
> +    }
> +
> +    fn handle_timeout(&self, counter: u32, event_slot: u32) {
> +        dev_err!(self.dev, " (\\________/) \n");
> +        dev_err!(self.dev, "  |        |  \n");
> +        dev_err!(self.dev, "'.| \\  , / |.'\n");
> +        dev_err!(self.dev, "--| / (( \\ |--\n");
> +        dev_err!(self.dev, ".'|  _-_-  |'.\n");
> +        dev_err!(self.dev, "  |________|  \n");
> +        dev_err!(self.dev, "** GPU timeout nya~!!!!! **\n");
> +        dev_err!(self.dev, "  Event slot: {}\n", event_slot);
> +        dev_err!(self.dev, "  Timeout count: {}\n", counter);
> +
> +        // If we have fault info, consider it a fault.
> +        let error = match self.get_fault_info() {
> +            Some(info) => workqueue::WorkError::Fault(info),
> +            None => workqueue::WorkError::Timeout,
> +        };
> +        self.mark_pending_events(Some(event_slot), error);
> +        self.recover();
> +    }
> +
> +    fn handle_fault(&self) {
> +        dev_err!(self.dev, " (\\________/) \n");
> +        dev_err!(self.dev, "  |        |  \n");
> +        dev_err!(self.dev, "'.| \\  , / |.'\n");
> +        dev_err!(self.dev, "--| / (( \\ |--\n");
> +        dev_err!(self.dev, ".'|  _-_-  |'.\n");
> +        dev_err!(self.dev, "  |________|  \n");
> +        dev_err!(self.dev, "GPU fault nya~!!!!!\n");
> +        let error = match self.get_fault_info() {
> +            Some(info) => workqueue::WorkError::Fault(info),
> +            None => workqueue::WorkError::Unknown,
> +        };
> +        self.mark_pending_events(None, error);
> +        self.recover();
> +    }
> +
> +    fn wait_for_poweroff(&self, timeout: usize) -> Result {
> +        self.initdata.runtime_pointers.hwdata_a.with(|raw, _inner| {
> +            for _i in 0..timeout {
> +                if raw.pwr_status.load(Ordering::Relaxed) == 4 {
> +                    return Ok(());
> +                }
> +                coarse_sleep(Duration::from_millis(1));
> +            }
> +            Err(ETIMEDOUT)
> +        })
> +    }
> +
> +    fn fwctl(&self, msg: fw::channels::FwCtlMsg) -> Result {
> +        if self.is_crashed() {
> +            return Err(ENODEV);
> +        }
> +
> +        let mut fwctl = self.fwctl_channel.lock();
> +        let token = fwctl.send(&msg);
> +        {
> +            let mut guard = self.rtkit.lock();
> +            let rtk = guard.as_mut().unwrap();
> +            rtk.send_message(EP_DOORBELL, MSG_FWCTL)?;
> +        }
> +        fwctl.wait_for(token)?;
> +        Ok(())
> +    }
> +
> +    fn get_cfg(&self) -> &'static hw::HwConfig {
> +        self.cfg
> +    }
> +
> +    fn get_dyncfg(&self) -> &hw::DynConfig {
> +        &self.dyncfg
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl GpuManagerPriv for GpuManager::ver {
> +    fn end_op(&self) {
> +        let val = self
> +            .initdata
> +            .globals
> +            .with(|raw, _inner| raw.pending_submissions.fetch_sub(1, Ordering::Release));
> +
> +        mod_dev_dbg!(self.dev, "OP end (pending: {})\n", val - 1);
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/hw/mod.rs b/drivers/gpu/drm/asahi/hw/mod.rs
> new file mode 100644
> index 000000000000..a92bb70aeae8
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/hw/mod.rs
> @@ -0,0 +1,522 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Per-SoC hardware configuration structures
> +//!
> +//! This module contains the definitions used to store per-GPU and per-SoC configuration data.
> +
> +use crate::driver::AsahiDevice;
> +use crate::fw::types::*;
> +use alloc::vec::Vec;
> +use kernel::c_str;
> +use kernel::device::RawDevice;
> +use kernel::prelude::*;
> +
> +const MAX_POWERZONES: usize = 5;
> +
> +pub(crate) mod t600x;
> +pub(crate) mod t8103;
> +pub(crate) mod t8112;
> +
> +/// GPU generation enumeration. Note: Part of the UABI.
> +#[derive(Debug, PartialEq, Copy, Clone)]
> +#[repr(u32)]
> +pub(crate) enum GpuGen {
> +    G13 = 13,
> +    G14 = 14,
> +}
> +
> +/// GPU variant enumeration. Note: Part of the UABI.
> +#[derive(Debug, PartialEq, Copy, Clone)]
> +#[repr(u32)]
> +pub(crate) enum GpuVariant {
> +    P = 'P' as u32,
> +    G = 'G' as u32,
> +    S = 'S' as u32,
> +    C = 'C' as u32,
> +    D = 'D' as u32,
> +}
> +
> +/// GPU revision enumeration. Note: Part of the UABI.
> +#[derive(Debug, PartialEq, Copy, Clone)]
> +#[repr(u32)]
> +pub(crate) enum GpuRevision {
> +    A0 = 0x00,
> +    A1 = 0x01,
> +    B0 = 0x10,
> +    B1 = 0x11,
> +    C0 = 0x20,
> +    C1 = 0x21,
> +}
> +
> +/// GPU core type enumeration. Note: Part of the firmware ABI.
> +#[derive(Debug, Copy, Clone)]
> +#[repr(u32)]
> +pub(crate) enum GpuCore {
> +    // Unknown = 0,
> +    // G5P = 1,
> +    // G5G = 2,
> +    // G9P = 3,
> +    // G9G = 4,
> +    // G10P = 5,
> +    // G11P = 6,
> +    // G11M = 7,
> +    // G11G = 8,
> +    // G12P = 9,
> +    // G13P = 10,
> +    G13G = 11,
> +    G13S = 12,
> +    G13C = 13,
> +    // G14P = 14,
> +    G14G = 15,
> +}
> +
> +/// GPU revision ID. Note: Part of the firmware ABI.
> +#[derive(Debug, PartialEq, Copy, Clone)]
> +#[repr(u32)]
> +pub(crate) enum GpuRevisionID {
> +    // Unknown = 0,
> +    A0 = 1,
> +    A1 = 2,
> +    B0 = 3,
> +    B1 = 4,
> +    C0 = 5,
> +    C1 = 6,
> +}
> +
> +/// GPU driver/hardware features, from the UABI.
> +pub(crate) mod feat {
> +    /// Backwards-compatible features.
> +    pub(crate) mod compat {}
> +
> +    /// Backwards-incompatible features.
> +    pub(crate) mod incompat {
> +        use kernel::bindings;
> +
> +        /// Hardware requires Z/S compression to be mandatorily enabled.
> +        pub(crate) const MANDATORY_ZS_COMPRESSION: u64 =
> +            bindings::drm_asahi_feat_incompat_DRM_ASAHI_FEAT_MANDATORY_ZS_COMPRESSION as u64;
> +    }
> +}
> +
> +/// A single performance state of the GPU.
> +#[derive(Debug)]
> +pub(crate) struct PState {
> +    /// Voltage in millivolts, per GPU cluster.
> +    pub(crate) volt_mv: Vec<u32>,
> +    /// Frequency in hertz.
> +    pub(crate) freq_hz: u32,
> +    /// Maximum power consumption of the GPU at this pstate, in milliwatts.
> +    pub(crate) pwr_mw: u32,
> +}
> +
> +/// A power zone definition (we have no idea what this is but Apple puts them in the DT).
> +#[allow(missing_docs)]
> +#[derive(Debug, Copy, Clone)]
> +pub(crate) struct PowerZone {
> +    pub(crate) target: u32,
> +    pub(crate) target_offset: u32,
> +    pub(crate) filter_tc: u32,
> +}
> +
> +/// An MMIO mapping used by the firmware.
> +#[derive(Debug, Copy, Clone)]
> +pub(crate) struct IOMapping {
> +    /// Base physical address of the mapping.
> +    pub(crate) base: usize,
> +    /// Size of the mapping.
> +    pub(crate) size: usize,
> +    /// Range size of the mapping (for arrays?)
> +    pub(crate) range_size: usize,
> +    /// Whether the mapping should be writable.
> +    pub(crate) writable: bool,
> +}
> +
> +impl IOMapping {
> +    /// Convenience constructor for a new IOMapping.
> +    pub(crate) const fn new(
> +        base: usize,
> +        size: usize,
> +        range_size: usize,
> +        writable: bool,
> +    ) -> IOMapping {
> +        IOMapping {
> +            base,
> +            size,
> +            range_size,
> +            writable,
> +        }
> +    }
> +}
> +
> +/// Unknown HwConfigA fields that vary from SoC to SoC.
> +#[allow(missing_docs)]
> +#[derive(Debug, Copy, Clone)]
> +pub(crate) struct HwConfigA {
> +    pub(crate) unk_87c: i32,
> +    pub(crate) unk_8cc: u32,
> +    pub(crate) unk_e24: u32,
> +}
> +
> +/// Unknown HwConfigB fields that vary from SoC to SoC.
> +#[allow(missing_docs)]
> +#[derive(Debug, Copy, Clone)]
> +pub(crate) struct HwConfigB {
> +    pub(crate) unk_4e0: u64,
> +    pub(crate) unk_534: u32,
> +    pub(crate) unk_ab8: u32,
> +    pub(crate) unk_abc: u32,
> +    pub(crate) unk_b30: u32,
> +}
> +
> +/// Render command configs that vary from SoC to SoC.
> +#[derive(Debug, Copy, Clone)]
> +pub(crate) struct HwRenderConfig {
> +    /// Vertex/tiling-related configuration register (lsb: disable clustering)
> +    pub(crate) tiling_control: u32,
> +}
> +
> +/// Static hardware configuration for a given SoC model.
> +#[derive(Debug)]
> +pub(crate) struct HwConfig {
> +    /// Chip ID in hex format (e.g. 0x8103 for t8103).
> +    pub(crate) chip_id: u32,
> +    /// GPU generation.
> +    pub(crate) gpu_gen: GpuGen,
> +    /// GPU variant type.
> +    pub(crate) gpu_variant: GpuVariant,
> +    /// GPU core type ID (as known by the firmware).
> +    pub(crate) gpu_core: GpuCore,
> +    /// Compatible feature bitmask for this GPU.
> +    pub(crate) gpu_feat_compat: u64,
> +    /// Incompatible feature bitmask for this GPU.
> +    pub(crate) gpu_feat_incompat: u64,
> +
> +    /// Base clock used used for timekeeping.
> +    pub(crate) base_clock_hz: u32,
> +    /// Output address space for the UAT on this SoC.
> +    pub(crate) uat_oas: usize,
> +    /// Maximum number of clusters on this SoC.
> +    pub(crate) max_num_clusters: u32,
> +    /// Maximum number of cores per cluster for this GPU.
> +    pub(crate) max_num_cores: u32,
> +    /// Maximum number of frags per cluster for this GPU.
> +    pub(crate) max_num_frags: u32,
> +    /// Maximum number of GPs per cluster for this GPU.
> +    pub(crate) max_num_gps: u32,
> +
> +    /// Required size of the first preemption buffer.
> +    pub(crate) preempt1_size: usize,
> +    /// Required size of the second preemption buffer.
> +    pub(crate) preempt2_size: usize,
> +    /// Required size of the third preemption buffer.
> +    pub(crate) preempt3_size: usize,
> +
> +    /// Rendering-relevant configuration.
> +    pub(crate) render: HwRenderConfig,
> +
> +    /// Misc HWDataA field values.
> +    pub(crate) da: HwConfigA,
> +    /// Misc HWDataB field values.
> +    pub(crate) db: HwConfigB,
> +    /// HwDataShared1.table.
> +    pub(crate) shared1_tab: &'static [i32],
> +    /// HwDataShared1.unk_a4.
> +    pub(crate) shared1_a4: u32,
> +    /// HwDataShared2.table.
> +    pub(crate) shared2_tab: &'static [i32],
> +    /// HwDataShared2.unk_508.
> +    pub(crate) shared2_unk_508: u32,
> +    /// Constant related to SRAM voltages.
> +    pub(crate) sram_k: F32,
> +    /// Unknown per-cluster coefficients 1.
> +    pub(crate) unk_coef_a: &'static [&'static [F32]],
> +    /// Unknown per-cluster coefficients 2.
> +    pub(crate) unk_coef_b: &'static [&'static [F32]],
> +    /// Unknown table in Global struct.
> +    pub(crate) global_tab: Option<&'static [u8]>,
> +
> +    /// Temperature sensor list (8 bits per sensor).
> +    pub(crate) fast_die0_sensor_mask: u64,
> +    /// Temperature sensor list (alternate).
> +    pub(crate) fast_die0_sensor_mask_alt: u64,
> +    /// Temperature sensor present bitmask.
> +    pub(crate) fast_die0_sensor_present: u32,
> +    /// Required MMIO mappings for this GPU/firmware.
> +    pub(crate) io_mappings: &'static [Option<IOMapping>],
> +}
> +
> +/// Dynamic (fetched from hardware/DT) configuration.
> +#[derive(Debug)]
> +pub(crate) struct DynConfig {
> +    /// Base physical address of the UAT TTB (from DT reserved memory region).
> +    pub(crate) uat_ttb_base: u64,
> +    /// GPU ID configuration read from hardware.
> +    pub(crate) id: GpuIdConfig,
> +    /// Power calibration configuration for this specific chip/device.
> +    pub(crate) pwr: PwrConfig,
> +}
> +
> +/// Specific GPU ID configuration fetched from SGX MMIO registers.
> +#[derive(Debug)]
> +pub(crate) struct GpuIdConfig {
> +    /// GPU generation (should match static config).
> +    pub(crate) gpu_gen: GpuGen,
> +    /// GPU variant type (should match static config).
> +    pub(crate) gpu_variant: GpuVariant,
> +    /// GPU silicon revision.
> +    pub(crate) gpu_rev: GpuRevision,
> +    /// GPU silicon revision ID (firmware enum).
> +    pub(crate) gpu_rev_id: GpuRevisionID,
> +    /// Maximum number of dies supported.
> +    pub(crate) max_dies: u32,
> +    /// Total number of GPU clusters.
> +    pub(crate) num_clusters: u32,
> +    /// Maximum number of GPU cores per cluster.
> +    pub(crate) num_cores: u32,
> +    /// Number of frags per cluster.
> +    pub(crate) num_frags: u32,
> +    /// Number of GPs per cluster.
> +    pub(crate) num_gps: u32,
> +    /// Total number of active cores for the whole GPU.
> +    pub(crate) total_active_cores: u32,
> +    /// Mask of active cores per cluster.
> +    pub(crate) core_masks: Vec<u32>,
> +    /// Packed mask of all active cores.
> +    pub(crate) core_masks_packed: Vec<u32>,
> +}
> +
> +/// Configurable GPU power settings from the device tree.
> +#[derive(Debug)]
> +pub(crate) struct PwrConfig {
> +    /// GPU performance state list.
> +    pub(crate) perf_states: Vec<PState>,
> +    /// GPU power zone list.
> +    pub(crate) power_zones: Vec<PowerZone>,
> +
> +    /// Core leakage coefficient per cluster.
> +    pub(crate) core_leak_coef: Vec<F32>,
> +    /// SRAM leakage coefficient per cluster.
> +    pub(crate) sram_leak_coef: Vec<F32>,
> +
> +    /// Maximum total power of the GPU in milliwatts.
> +    pub(crate) max_power_mw: u32,
> +    /// Maximum frequency of the GPU in megahertz.
> +    pub(crate) max_freq_mhz: u32,
> +
> +    /// Minimum performance state to start at.
> +    pub(crate) perf_base_pstate: u32,
> +    /// Maximum enabled performance state.
> +    pub(crate) perf_max_pstate: u32,
> +
> +    /// Minimum voltage for the SRAM power domain in microvolts.
> +    pub(crate) min_sram_microvolt: u32,
> +
> +    // Most of these fields are just named after Apple ADT property names and we don't fully
> +    // understand them. They configure various power-related PID loops and filters.
> +    /// Average power filter time constant in milliseconds.
> +    pub(crate) avg_power_filter_tc_ms: u32,
> +    /// Average power filter PID integral gain?
> +    pub(crate) avg_power_ki_only: F32,
> +    /// Average power filter PID proportional gain?
> +    pub(crate) avg_power_kp: F32,
> +    pub(crate) avg_power_min_duty_cycle: u32,
> +    /// Average power target filter time constant in periods.
> +    pub(crate) avg_power_target_filter_tc: u32,
> +    /// "Fast die0" (temperature?) PID integral gain.
> +    pub(crate) fast_die0_integral_gain: F32,
> +    /// "Fast die0" (temperature?) PID proportional gain.
> +    pub(crate) fast_die0_proportional_gain: F32,
> +    pub(crate) fast_die0_prop_tgt_delta: u32,
> +    pub(crate) fast_die0_release_temp: u32,
> +    /// Delay from the fender (?) becoming idle to powerdown
> +    pub(crate) fender_idle_off_delay_ms: u32,
> +    /// Timeout from firmware early wake to sleep if no work was submitted (?)
> +    pub(crate) fw_early_wake_timeout_ms: u32,
> +    /// Delay from the GPU becoming idle to powerdown
> +    pub(crate) idle_off_delay_ms: u32,
> +    /// Percent?
> +    pub(crate) perf_boost_ce_step: u32,
> +    /// Minimum utilization before performance state is increased in %.
> +    pub(crate) perf_boost_min_util: u32,
> +    pub(crate) perf_filter_drop_threshold: u32,
> +    /// Performance PID filter time constant? (periods?)
> +    pub(crate) perf_filter_time_constant: u32,
> +    /// Performance PID filter time constant 2? (periods?)
> +    pub(crate) perf_filter_time_constant2: u32,
> +    /// Performance PID integral gain.
> +    pub(crate) perf_integral_gain: F32,
> +    /// Performance PID integral gain 2 (?).
> +    pub(crate) perf_integral_gain2: F32,
> +    pub(crate) perf_integral_min_clamp: u32,
> +    /// Performance PID proportional gain.
> +    pub(crate) perf_proportional_gain: F32,
> +    /// Performance PID proportional gain 2 (?).
> +    pub(crate) perf_proportional_gain2: F32,
> +    pub(crate) perf_reset_iters: u32,
> +    /// Target GPU utilization for the performance controller in %.
> +    pub(crate) perf_tgt_utilization: u32,
> +    /// Power sampling period in milliseconds.
> +    pub(crate) power_sample_period: u32,
> +    /// PPM (?) filter time constant in milliseconds.
> +    pub(crate) ppm_filter_time_constant_ms: u32,
> +    /// PPM (?) filter PID integral gain.
> +    pub(crate) ppm_ki: F32,
> +    /// PPM (?) filter PID proportional gain.
> +    pub(crate) ppm_kp: F32,
> +    /// Power consumption filter time constant (periods?)
> +    pub(crate) pwr_filter_time_constant: u32,
> +    /// Power consumption filter PID integral gain.
> +    pub(crate) pwr_integral_gain: F32,
> +    pub(crate) pwr_integral_min_clamp: u32,
> +    pub(crate) pwr_min_duty_cycle: u32,
> +    pub(crate) pwr_proportional_gain: F32,
> +}
> +
> +impl PwrConfig {
> +    /// Load the GPU power configuration from the device tree.
> +    pub(crate) fn load(dev: &AsahiDevice, cfg: &HwConfig) -> Result<PwrConfig> {
> +        let mut perf_states = Vec::new();
> +
> +        let node = dev.of_node().ok_or(EIO)?;
> +        let opps = node
> +            .parse_phandle(c_str!("operating-points-v2"), 0)
> +            .ok_or(EIO)?;
> +
> +        let mut max_power_mw: u32 = 0;
> +        let mut max_freq_mhz: u32 = 0;
> +
> +        macro_rules! prop {
> +            ($prop:expr, $default:expr) => {{
> +                node.get_opt_property(c_str!($prop))
> +                    .map_err(|e| {
> +                        dev_err!(dev, "Error reading property {}: {:?}\n", $prop, e);
> +                        e
> +                    })?
> +                    .unwrap_or($default)
> +            }};
> +            ($prop:expr) => {{
> +                node.get_property(c_str!($prop)).map_err(|e| {
> +                    dev_err!(dev, "Error reading property {}: {:?}\n", $prop, e);
> +                    e
> +                })?
> +            }};
> +        }
> +
> +        for opp in opps.children() {
> +            let freq_hz: u64 = opp.get_property(c_str!("opp-hz"))?;
> +            let mut volt_uv: Vec<u32> = opp.get_property(c_str!("opp-microvolt"))?;
> +            let pwr_uw: u32 = opp.get_property(c_str!("opp-microwatt"))?;
> +
> +            if volt_uv.len() != cfg.max_num_clusters as usize {
> +                dev_err!(
> +                    dev,
> +                    "Invalid opp-microvolt length (expected {}, got {})\n",
> +                    cfg.max_num_clusters,
> +                    volt_uv.len()
> +                );
> +                return Err(EINVAL);
> +            }
> +
> +            volt_uv.iter_mut().for_each(|a| *a /= 1000);
> +            let volt_mv = volt_uv;
> +
> +            let pwr_mw = pwr_uw / 1000;
> +            max_power_mw = max_power_mw.max(pwr_mw);
> +
> +            let freq_mhz: u32 = (freq_hz / 1_000_000).try_into()?;
> +            max_freq_mhz = max_freq_mhz.max(freq_mhz);
> +
> +            perf_states.try_push(PState {
> +                freq_hz: freq_hz.try_into()?,
> +                volt_mv,
> +                pwr_mw,
> +            })?;
> +        }
> +
> +        let pz_data = prop!("apple,power-zones", Vec::new());
> +
> +        if pz_data.len() > 3 * MAX_POWERZONES || pz_data.len() % 3 != 0 {
> +            dev_err!(dev, "Invalid apple,power-zones value\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let pz_count = pz_data.len() / 3;
> +        let mut power_zones = Vec::new();
> +        for i in (0..pz_count).step_by(3) {
> +            power_zones.try_push(PowerZone {
> +                target: pz_data[i],
> +                target_offset: pz_data[i + 1],
> +                filter_tc: pz_data[i + 2],
> +            })?;
> +        }
> +
> +        let core_leak_coef: Vec<F32> = prop!("apple,core-leak-coef");
> +        let sram_leak_coef: Vec<F32> = prop!("apple,sram-leak-coef");
> +
> +        if core_leak_coef.len() != cfg.max_num_clusters as usize {
> +            dev_err!(dev, "Invalid apple,core-leak-coef\n");
> +            return Err(EINVAL);
> +        }
> +        if sram_leak_coef.len() != cfg.max_num_clusters as usize {
> +            dev_err!(dev, "Invalid apple,sram_leak_coef\n");
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(PwrConfig {
> +            core_leak_coef,
> +            sram_leak_coef,
> +
> +            max_power_mw,
> +            max_freq_mhz,
> +
> +            perf_base_pstate: prop!("apple,perf-base-pstate", 1),
> +            perf_max_pstate: perf_states.len() as u32 - 1,
> +            min_sram_microvolt: prop!("apple,min-sram-microvolt"),
> +
> +            avg_power_filter_tc_ms: prop!("apple,avg-power-filter-tc-ms"),
> +            avg_power_ki_only: prop!("apple,avg-power-ki-only"),
> +            avg_power_kp: prop!("apple,avg-power-kp"),
> +            avg_power_min_duty_cycle: prop!("apple,avg-power-min-duty-cycle"),
> +            avg_power_target_filter_tc: prop!("apple,avg-power-target-filter-tc"),
> +            fast_die0_integral_gain: prop!("apple,fast-die0-integral-gain"),
> +            fast_die0_proportional_gain: prop!("apple,fast-die0-proportional-gain"),
> +            fast_die0_prop_tgt_delta: prop!("apple,fast-die0-prop-tgt-delta", 0),
> +            fast_die0_release_temp: prop!("apple,fast-die0-release-temp", 80),
> +            fender_idle_off_delay_ms: prop!("apple,fender-idle-off-delay-ms", 40),
> +            fw_early_wake_timeout_ms: prop!("apple,fw-early-wake-timeout-ms", 5),
> +            idle_off_delay_ms: prop!("apple,idle-off-delay-ms", 2),
> +            perf_boost_ce_step: prop!("apple,perf-boost-ce-step", 25),
> +            perf_boost_min_util: prop!("apple,perf-boost-min-util", 100),
> +            perf_filter_drop_threshold: prop!("apple,perf-filter-drop-threshold"),
> +            perf_filter_time_constant2: prop!("apple,perf-filter-time-constant2"),
> +            perf_filter_time_constant: prop!("apple,perf-filter-time-constant"),
> +            perf_integral_gain2: prop!("apple,perf-integral-gain2"),
> +            perf_integral_gain: prop!("apple,perf-integral-gain", f32!(7.8956833)),
> +            perf_integral_min_clamp: prop!("apple,perf-integral-min-clamp"),
> +            perf_proportional_gain2: prop!("apple,perf-proportional-gain2"),
> +            perf_proportional_gain: prop!("apple,perf-proportional-gain", f32!(14.707963)),
> +            perf_reset_iters: prop!("apple,perf-reset-iters", 6),
> +            perf_tgt_utilization: prop!("apple,perf-tgt-utilization"),
> +            power_sample_period: prop!("apple,power-sample-period"),
> +            ppm_filter_time_constant_ms: prop!("apple,ppm-filter-time-constant-ms"),
> +            ppm_ki: prop!("apple,ppm-ki"),
> +            ppm_kp: prop!("apple,ppm-kp"),
> +            pwr_filter_time_constant: prop!("apple,pwr-filter-time-constant", 313),
> +            pwr_integral_gain: prop!("apple,pwr-integral-gain", f32!(0.0202129)),
> +            pwr_integral_min_clamp: prop!("apple,pwr-integral-min-clamp", 0),
> +            pwr_min_duty_cycle: prop!("apple,pwr-min-duty-cycle"),
> +            pwr_proportional_gain: prop!("apple,pwr-proportional-gain", f32!(5.2831855)),
> +
> +            perf_states,
> +            power_zones,
> +        })
> +    }
> +
> +    pub(crate) fn min_frequency_khz(&self) -> u32 {
> +        self.perf_states[self.perf_base_pstate as usize].freq_hz / 1000
> +    }
> +
> +    pub(crate) fn max_frequency_khz(&self) -> u32 {
> +        self.perf_states[self.perf_max_pstate as usize].freq_hz / 1000
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/hw/t600x.rs b/drivers/gpu/drm/asahi/hw/t600x.rs
> new file mode 100644
> index 000000000000..8a8267a7e18a
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/hw/t600x.rs
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Hardware configuration for t600x (M1 Pro/Max/Ultra) platforms.
> +
> +use crate::f32;
> +
> +use super::*;
> +
> +const fn iomaps(mcc_count: usize, has_die1: bool) -> [Option<IOMapping>; 20] {
> +    [
> +        Some(IOMapping::new(0x404d00000, 0x1c000, 0x1c000, true)), // Fender
> +        Some(IOMapping::new(0x20e100000, 0x4000, 0x4000, false)),  // AICTimer
> +        Some(IOMapping::new(0x28e104000, 0x4000, 0x4000, true)),   // AICSWInt
> +        Some(IOMapping::new(0x404000000, 0x20000, 0x20000, true)), // RGX
> +        None,                                                      // UVD
> +        None,                                                      // unused
> +        None,                                                      // DisplayUnderrunWA
> +        Some(IOMapping::new(0x28e494000, 0x1000, 0x1000, false)),  // AnalogTempSensorControllerRegs
> +        None,                                                      // PMPDoorbell
> +        Some(IOMapping::new(0x404d80000, 0x8000, 0x8000, true)),   // MetrologySensorRegs
> +        Some(IOMapping::new(0x204d61000, 0x1000, 0x1000, true)),   // GMGIFAFRegs
> +        Some(IOMapping::new(
> +            0x200000000,
> +            mcc_count * 0xd8000,
> +            0xd6400,
> +            true,
> +        )), // MCache registers
> +        None,                                                      // AICBankedRegisters
> +        None,                                                      // PMGRScratch
> +        Some(IOMapping::new(0x2643c4000, 0x1000, 0x1000, true)), // NIA Special agent idle register die 0
> +        if has_die1 {
> +            // NIA Special agent idle register die 1
> +            Some(IOMapping::new(0x22643c4000, 0x1000, 0x1000, true))
> +        } else {
> +            None
> +        },
> +        None,                                                     // CRE registers
> +        None,                                                     // Streaming codec registers
> +        Some(IOMapping::new(0x28e3d0000, 0x1000, 0x1000, true)),  // ?
> +        Some(IOMapping::new(0x28e3c0000, 0x1000, 0x1000, false)), // ?
> +    ]
> +}
> +
> +pub(crate) const HWCONFIG_T6002: super::HwConfig = HwConfig {
> +    chip_id: 0x6002,
> +    gpu_gen: GpuGen::G13,
> +    gpu_variant: GpuVariant::D,
> +    gpu_core: GpuCore::G13C,
> +    gpu_feat_compat: 0,
> +    gpu_feat_incompat: feat::incompat::MANDATORY_ZS_COMPRESSION,
> +
> +    base_clock_hz: 24_000_000,
> +    uat_oas: 42,
> +    max_num_clusters: 8,
> +    max_num_cores: 8,
> +    max_num_frags: 8,
> +    max_num_gps: 4,
> +
> +    preempt1_size: 0x540,
> +    preempt2_size: 0x280,
> +    preempt3_size: 0x20,
> +
> +    render: HwRenderConfig {
> +        tiling_control: 0xa540,
> +    },
> +
> +    da: HwConfigA {
> +        unk_87c: 900,
> +        unk_8cc: 11000,
> +        unk_e24: 125,
> +    },
> +    db: HwConfigB {
> +        unk_4e0: 4,
> +        unk_534: 1,
> +        unk_ab8: 0x2084,
> +        unk_abc: 0x80,
> +        unk_b30: 0,
> +    },
> +    shared1_tab: &[
> +        0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
> +        0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
> +    ],
> +    shared1_a4: 0xffff,
> +    shared2_tab: &[-1, -1, -1, -1, 0x2aa, 0xaaa, -1, -1, 0, 0],
> +    shared2_unk_508: 0xcc00001,
> +    sram_k: f32!(1.02),
> +    unk_coef_a: &[
> +        &f32!([9.838]),
> +        &f32!([9.819]),
> +        &f32!([9.826]),
> +        &f32!([9.799]),
> +        &f32!([9.799]),
> +        &f32!([9.826]),
> +        &f32!([9.819]),
> +        &f32!([9.838]),
> +    ],
> +    unk_coef_b: &[
> +        &f32!([13.0]),
> +        &f32!([13.0]),
> +        &f32!([13.0]),
> +        &f32!([13.0]),
> +        &f32!([13.0]),
> +        &f32!([13.0]),
> +        &f32!([13.0]),
> +        &f32!([13.0]),
> +    ],
> +    global_tab: Some(&[
> +        0, 1, 2, 1, 1, 90, 75, 1, 1, 1, 2, 90, 75, 1, 1, 1, 1, 90, 75, 1, 1,
> +    ]),
> +    fast_die0_sensor_mask: 0x8080808080808080,
> +    fast_die0_sensor_mask_alt: 0x9090909090909090,
> +    fast_die0_sensor_present: 0xff,
> +    io_mappings: &iomaps(16, true),
> +};
> +
> +pub(crate) const HWCONFIG_T6001: super::HwConfig = HwConfig {
> +    chip_id: 0x6001,
> +    gpu_variant: GpuVariant::C,
> +    gpu_core: GpuCore::G13C,
> +
> +    max_num_clusters: 4,
> +    fast_die0_sensor_mask: 0x80808080,
> +    fast_die0_sensor_mask_alt: 0x90909090,
> +    fast_die0_sensor_present: 0x0f,
> +    io_mappings: &iomaps(8, false),
> +    ..HWCONFIG_T6002
> +};
> +
> +pub(crate) const HWCONFIG_T6000: super::HwConfig = HwConfig {
> +    chip_id: 0x6000,
> +    gpu_variant: GpuVariant::S,
> +    gpu_core: GpuCore::G13S,
> +
> +    max_num_clusters: 2,
> +    fast_die0_sensor_mask: 0x8080,
> +    fast_die0_sensor_mask_alt: 0x9090,
> +    fast_die0_sensor_present: 0x03,
> +    io_mappings: &iomaps(4, false),
> +    ..HWCONFIG_T6001
> +};
> diff --git a/drivers/gpu/drm/asahi/hw/t8103.rs b/drivers/gpu/drm/asahi/hw/t8103.rs
> new file mode 100644
> index 000000000000..3d38b088a0f5
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/hw/t8103.rs
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Hardware configuration for t8103 platforms (M1).
> +
> +use crate::f32;
> +
> +use super::*;
> +
> +pub(crate) const HWCONFIG: super::HwConfig = HwConfig {
> +    chip_id: 0x8103,
> +    gpu_gen: GpuGen::G13,
> +    gpu_variant: GpuVariant::G,
> +    gpu_core: GpuCore::G13G,
> +    gpu_feat_compat: 0,
> +    gpu_feat_incompat: 0,
> +
> +    base_clock_hz: 24_000_000,
> +    uat_oas: 40,
> +    max_num_clusters: 1,
> +    max_num_cores: 8,
> +    max_num_frags: 8,
> +    max_num_gps: 4,
> +
> +    preempt1_size: 0x540,
> +    preempt2_size: 0x280,
> +    preempt3_size: 0x20,
> +
> +    render: HwRenderConfig {
> +        // bit 0: disable clustering (always)
> +        tiling_control: 0xa041,
> +    },
> +
> +    da: HwConfigA {
> +        unk_87c: -220,
> +        unk_8cc: 9880,
> +        unk_e24: 112,
> +    },
> +    db: HwConfigB {
> +        unk_4e0: 0,
> +        unk_534: 0,
> +        unk_ab8: 0x48,
> +        unk_abc: 0x8,
> +        unk_b30: 0,
> +    },
> +    shared1_tab: &[
> +        -1, 0x7282, 0x50ea, 0x370a, 0x25be, 0x1c1f, 0x16fb, -1, -1, -1, -1, -1, -1, -1, -1, -1,
> +    ],
> +    shared1_a4: 0xffff,
> +    shared2_tab: &[0x800, 0x1555, -1, -1, -1, -1, -1, -1, 0, 0],
> +    shared2_unk_508: 0xc00007,
> +    sram_k: f32!(1.02),
> +    unk_coef_a: &[],
> +    unk_coef_b: &[],
> +    global_tab: None,
> +    fast_die0_sensor_mask: 0x12,
> +    fast_die0_sensor_mask_alt: 0x12,
> +    fast_die0_sensor_present: 0x01,
> +    io_mappings: &[
> +        Some(IOMapping::new(0x204d00000, 0x1c000, 0x1c000, true)), // Fender
> +        Some(IOMapping::new(0x20e100000, 0x4000, 0x4000, false)),  // AICTimer
> +        Some(IOMapping::new(0x23b104000, 0x4000, 0x4000, true)),   // AICSWInt
> +        Some(IOMapping::new(0x204000000, 0x20000, 0x20000, true)), // RGX
> +        None,                                                      // UVD
> +        None,                                                      // unused
> +        None,                                                      // DisplayUnderrunWA
> +        Some(IOMapping::new(0x23b2e8000, 0x1000, 0x1000, false)),  // AnalogTempSensorControllerRegs
> +        Some(IOMapping::new(0x23bc00000, 0x1000, 0x1000, true)),   // PMPDoorbell
> +        Some(IOMapping::new(0x204d80000, 0x5000, 0x5000, true)),   // MetrologySensorRegs
> +        Some(IOMapping::new(0x204d61000, 0x1000, 0x1000, true)),   // GMGIFAFRegs
> +        Some(IOMapping::new(0x200000000, 0xd6400, 0xd6400, true)), // MCache registers
> +        None,                                                      // AICBankedRegisters
> +        Some(IOMapping::new(0x23b738000, 0x1000, 0x1000, true)),   // PMGRScratch
> +        None, // NIA Special agent idle register die 0
> +        None, // NIA Special agent idle register die 1
> +        None, // CRE registers
> +        None, // Streaming codec registers
> +        None, //
> +        None, //
> +    ],
> +};
> diff --git a/drivers/gpu/drm/asahi/hw/t8112.rs b/drivers/gpu/drm/asahi/hw/t8112.rs
> new file mode 100644
> index 000000000000..5624dca130be
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/hw/t8112.rs
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Hardware configuration for t8112 platforms (M2).
> +
> +use crate::f32;
> +
> +use super::*;
> +
> +pub(crate) const HWCONFIG: super::HwConfig = HwConfig {
> +    chip_id: 0x8112,
> +    gpu_gen: GpuGen::G14,
> +    gpu_variant: GpuVariant::G,
> +    gpu_core: GpuCore::G14G,
> +    gpu_feat_compat: 0,
> +    gpu_feat_incompat: 0,
> +
> +    base_clock_hz: 24_000_000,
> +    uat_oas: 40,
> +    max_num_clusters: 1,
> +    max_num_cores: 10,
> +    max_num_frags: 10,
> +    max_num_gps: 4,
> +
> +    preempt1_size: 0x540,
> +    preempt2_size: 0x280,
> +    preempt3_size: 0x20,
> +
> +    render: HwRenderConfig {
> +        // TODO: this is unused here, may be present in newer FW
> +        tiling_control: 0xa041,
> +    },
> +
> +    da: HwConfigA {
> +        unk_87c: 900,
> +        unk_8cc: 11000,
> +        unk_e24: 125,
> +    },
> +    db: HwConfigB {
> +        unk_4e0: 4,
> +        unk_534: 0,
> +        unk_ab8: 0x2048,
> +        unk_abc: 0x4000,
> +        unk_b30: 1,
> +    },
> +    shared1_tab: &[
> +        0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
> +        0xffff, 0xffff, 0xffff, 0xffff, 0xffff,
> +    ],
> +    shared1_a4: 0,
> +    shared2_tab: &[-1, -1, -1, -1, -1, -1, -1, -1, 0xaa5aa, 0],
> +    shared2_unk_508: 0xc00000,
> +    sram_k: f32!(1.02),
> +    // 13.2: last coef changed from 6.6 to 5.3, assuming that was a fix we can backport
> +    unk_coef_a: &[&f32!([0.0, 0.0, 0.0, 0.0, 5.3, 0.0, 5.3, /*6.6*/ 5.3])],
> +    unk_coef_b: &[&f32!([0.0, 0.0, 0.0, 0.0, 5.3, 0.0, 5.3, /*6.6*/ 5.3])],
> +    global_tab: None,
> +    fast_die0_sensor_mask: 0x6800,
> +    fast_die0_sensor_mask_alt: 0x6800,
> +    fast_die0_sensor_present: 0x02,
> +    io_mappings: &[
> +        Some(IOMapping::new(0x204d00000, 0x14000, 0x14000, true)), // Fender
> +        Some(IOMapping::new(0x20e100000, 0x4000, 0x4000, false)),  // AICTimer
> +        Some(IOMapping::new(0x23b0c4000, 0x4000, 0x4000, true)),   // AICSWInt
> +        Some(IOMapping::new(0x204000000, 0x20000, 0x20000, true)), // RGX
> +        None,                                                      // UVD
> +        None,                                                      // unused
> +        None,                                                      // DisplayUnderrunWA
> +        Some(IOMapping::new(0x23b2c0000, 0x1000, 0x1000, false)),  // AnalogTempSensorControllerRegs
> +        None,                                                      // PMPDoorbell
> +        Some(IOMapping::new(0x204d80000, 0x8000, 0x8000, true)),   // MetrologySensorRegs
> +        Some(IOMapping::new(0x204d61000, 0x1000, 0x1000, true)),   // GMGIFAFRegs
> +        Some(IOMapping::new(0x200000000, 0xd6400, 0xd6400, true)), // MCache registers
> +        None,                                                      // AICBankedRegisters
> +        None,                                                      // PMGRScratch
> +        None, // NIA Special agent idle register die 0
> +        None, // NIA Special agent idle register die 1
> +        Some(IOMapping::new(0x204e00000, 0x10000, 0x10000, true)), // CRE registers
> +        Some(IOMapping::new(0x27d050000, 0x4000, 0x4000, true)), // Streaming codec registers
> +        Some(IOMapping::new(0x23b3d0000, 0x1000, 0x1000, true)), //
> +        Some(IOMapping::new(0x23b3c0000, 0x1000, 0x1000, true)), //
> +    ],
> +};
> diff --git a/drivers/gpu/drm/asahi/initdata.rs b/drivers/gpu/drm/asahi/initdata.rs
> new file mode 100644
> index 000000000000..472c42169130
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/initdata.rs
> @@ -0,0 +1,777 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +#![allow(clippy::unusual_byte_groupings)]
> +
> +//! GPU initialization data builder.
> +//!
> +//! The root of all interaction between the GPU firmware and the host driver is a complex set of
> +//! nested structures that we call InitData. This includes both GPU hardware/firmware configuration
> +//! and the pointers to the ring buffers and global data fields that are used for communication at
> +//! runtime.
> +//!
> +//! Many of these structures are poorly understood, so there are lots of hardcoded unknown values
> +//! derived from observing the InitData structures that macOS generates.
> +
> +use crate::fw::initdata::*;
> +use crate::fw::types::*;
> +use crate::{box_in_place, f32, place};
> +use crate::{gpu, hw, mmu};
> +use kernel::error::Result;
> +use kernel::macros::versions;
> +
> +/// Builder helper for the global GPU InitData.
> +#[versions(AGX)]
> +pub(crate) struct InitDataBuilder<'a> {
> +    alloc: &'a mut gpu::KernelAllocators,
> +    cfg: &'a hw::HwConfig,
> +    dyncfg: &'a hw::DynConfig,
> +}
> +
> +#[versions(AGX)]
> +impl<'a> InitDataBuilder::ver<'a> {
> +    /// Create a new InitData builder
> +    pub(crate) fn new(
> +        alloc: &'a mut gpu::KernelAllocators,
> +        cfg: &'a hw::HwConfig,
> +        dyncfg: &'a hw::DynConfig,
> +    ) -> InitDataBuilder::ver<'a> {
> +        InitDataBuilder::ver { alloc, cfg, dyncfg }
> +    }
> +
> +    /// Create the HwDataShared1 structure, which is used in two places in InitData.
> +    #[inline(never)]
> +    fn hw_shared1(cfg: &hw::HwConfig) -> raw::HwDataShared1 {
> +        let mut ret = raw::HwDataShared1 {
> +            unk_a4: cfg.shared1_a4,
> +            ..Default::default()
> +        };
> +        for (i, val) in cfg.shared1_tab.iter().enumerate() {
> +            ret.table[i] = *val;
> +        }
> +        ret
> +    }
> +
> +    fn init_curve(
> +        curve: &mut raw::HwDataShared2Curve,
> +        unk_0: u32,
> +        unk_4: u32,
> +        t1: &[i16],
> +        t2: &[i16],
> +        t3: &[&[i32]],
> +    ) {
> +        curve.unk_0 = unk_0;
> +        curve.unk_4 = unk_4;
> +        (*curve.t1)[..t1.len()].copy_from_slice(t1);
> +        (*curve.t1)[t1.len()..].fill(t1[0]);
> +        (*curve.t2)[..t2.len()].copy_from_slice(t2);
> +        (*curve.t2)[t2.len()..].fill(t2[0]);
> +        for (i, a) in curve.t3.iter_mut().enumerate() {
> +            a.fill(0x3ffffff);
> +            if i < t3.len() {
> +                let b = t3[i];
> +                (**a)[..b.len()].copy_from_slice(b);
> +            }
> +        }
> +    }
> +
> +    /// Create the HwDataShared2 structure, which is used in two places in InitData.
> +    #[inline(never)]
> +    fn hw_shared2(cfg: &hw::HwConfig) -> Result<Box<raw::HwDataShared2>> {
> +        let mut ret = box_in_place!(raw::HwDataShared2 {
> +            unk_28: Array::new([0xff; 16]),
> +            t8112: Default::default(),
> +            unk_508: cfg.shared2_unk_508,
> +            ..Default::default()
> +        })?;
> +
> +        for (i, val) in cfg.shared2_tab.iter().enumerate() {
> +            ret.table[i] = *val;
> +        }
> +
> +        if cfg.chip_id == 0x8112 {
> +            ret.t8112.unk_14 = 0x6000000;
> +            Self::init_curve(&mut ret.t8112.curve1, 0, 0x20000000, &[-1], &[0x0f07], &[]);
> +            Self::init_curve(
> +                &mut ret.t8112.curve2,
> +                7,
> +                0x80000000,
> +                &[-1, 25740, 17429, 12550, 9597, 7910, 6657, 5881, 5421],
> +                &[
> +                    0x0f07, 0x04c0, 0x06c0, 0x08c0, 0x0ac0, 0x0c40, 0x0dc0, 0x0ec0, 0x0f80,
> +                ],
> +                &[
> +                    &[0x3ffffff, 107, 101, 94, 87, 82, 77, 73, 71],
> +                    &[
> +                        0x3ffffff, 38240, 36251, 33562, 31368, 29379, 27693, 26211, 25370,
> +                    ],
> +                    &[
> +                        0x3ffffff, 123933, 117485, 108771, 101661, 95217, 89751, 84948, 82222,
> +                    ],
> +                ],
> +            );
> +        }
> +
> +        Ok(ret)
> +    }
> +
> +    /// Create the HwDataShared3 structure, which is used in two places in InitData.
> +    #[inline(never)]
> +    fn hw_shared3(cfg: &hw::HwConfig) -> Result<Box<raw::HwDataShared3>> {
> +        let mut ret = box_in_place!(raw::HwDataShared3 {
> +            ..Default::default()
> +        })?;
> +
> +        if cfg.chip_id == 0x8112 {
> +            ret.unk_0 = 1;
> +            ret.unk_4 = 500;
> +            ret.unk_8 = 5;
> +            ret.table.copy_from_slice(&[
> +                10700, 10700, 10700, 10700, 10700, 6000, 1000, 1000, 1000, 10700, 10700, 10700,
> +                10700, 10700, 10700, 10700,
> +            ]);
> +            ret.unk_4c = 1;
> +        }
> +
> +        Ok(ret)
> +    }
> +
> +    /// Create an unknown T81xx-specific data structure.
> +    fn t81xx_data(dyncfg: &'a hw::DynConfig) -> raw::T81xxData {
> +        raw::T81xxData {
> +            unk_d8c: 0x80000000,
> +            unk_d90: 4,
> +            unk_d9c: f32!(0.6),
> +            unk_da4: f32!(0.4),
> +            unk_dac: f32!(0.38552),
> +            unk_db8: f32!(65536.0),
> +            unk_dbc: f32!(13.56),
> +            max_pstate_scaled: 100 * dyncfg.pwr.perf_max_pstate,
> +            ..Default::default()
> +        }
> +    }
> +
> +    /// Create the HwDataA structure. This mostly contains power-related configuration.
> +    #[inline(never)]
> +    fn hwdata_a(&mut self) -> Result<GpuObject<HwDataA::ver>> {
> +        self.alloc
> +            .private
> +            .new_inplace(Default::default(), |_inner, ptr| {
> +                let pwr = &self.dyncfg.pwr;
> +                let period_ms = pwr.power_sample_period;
> +                let period_s = F32::from(period_ms) / f32!(1000.0);
> +                let ppm_filter_tc_periods = pwr.ppm_filter_time_constant_ms / period_ms;
> +                #[ver(V >= V13_0B4)]
> +                let ppm_filter_tc_ms_rounded = ppm_filter_tc_periods * period_ms;
> +                let ppm_filter_a = f32!(1.0) / ppm_filter_tc_periods.into();
> +                let perf_filter_a = f32!(1.0) / pwr.perf_filter_time_constant.into();
> +                let perf_filter_a2 = f32!(1.0) / pwr.perf_filter_time_constant2.into();
> +                let avg_power_target_filter_a = f32!(1.0) / pwr.avg_power_target_filter_tc.into();
> +                let avg_power_filter_tc_periods = pwr.avg_power_filter_tc_ms / period_ms;
> +                #[ver(V >= V13_0B4)]
> +                let avg_power_filter_tc_ms_rounded = avg_power_filter_tc_periods * period_ms;
> +                let avg_power_filter_a = f32!(1.0) / avg_power_filter_tc_periods.into();
> +                let pwr_filter_a = f32!(1.0) / pwr.pwr_filter_time_constant.into();
> +
> +                let base_ps = pwr.perf_base_pstate;
> +                let base_ps_scaled = 100 * base_ps;
> +                let max_ps = pwr.perf_max_pstate;
> +                let max_ps_scaled = 100 * max_ps;
> +                let boost_ps_count = max_ps - base_ps;
> +
> +                let base_clock_khz = self.cfg.base_clock_hz / 1000;
> +                let clocks_per_period = base_clock_khz * period_ms;
> +
> +                let raw = place!(
> +                    ptr,
> +                    raw::HwDataA::ver {
> +                        clocks_per_period: clocks_per_period,
> +                        #[ver(V >= V13_0B4)]
> +                        clocks_per_period_2: clocks_per_period,
> +                        pwr_status: AtomicU32::new(4),
> +                        unk_10: f32!(1.0),
> +                        actual_pstate: 1,
> +                        tgt_pstate: 1,
> +                        base_pstate_scaled: base_ps_scaled,
> +                        unk_40: 1,
> +                        max_pstate_scaled: max_ps_scaled,
> +                        min_pstate_scaled: 100,
> +                        unk_64c: 625,
> +                        pwr_filter_a_neg: f32!(1.0) - pwr_filter_a,
> +                        pwr_filter_a: pwr_filter_a,
> +                        pwr_integral_gain: pwr.pwr_integral_gain,
> +                        pwr_integral_min_clamp: pwr.pwr_integral_min_clamp.into(),
> +                        max_power_1: pwr.max_power_mw.into(),
> +                        pwr_proportional_gain: pwr.pwr_proportional_gain,
> +                        pwr_pstate_related_k: -F32::from(max_ps_scaled) / pwr.max_power_mw.into(),
> +                        pwr_pstate_max_dc_offset: pwr.pwr_min_duty_cycle as i32
> +                            - max_ps_scaled as i32,
> +                        max_pstate_scaled_2: max_ps_scaled,
> +                        max_power_2: pwr.max_power_mw,
> +                        max_pstate_scaled_3: max_ps_scaled,
> +                        ppm_filter_tc_periods_x4: ppm_filter_tc_periods * 4,
> +                        ppm_filter_a_neg: f32!(1.0) - ppm_filter_a,
> +                        ppm_filter_a: ppm_filter_a,
> +                        ppm_ki_dt: pwr.ppm_ki * period_s,
> +                        unk_6fc: f32!(65536.0),
> +                        ppm_kp: pwr.ppm_kp,
> +                        pwr_min_duty_cycle: pwr.pwr_min_duty_cycle,
> +                        max_pstate_scaled_4: max_ps_scaled,
> +                        unk_71c: f32!(0.0),
> +                        max_power_3: pwr.max_power_mw,
> +                        cur_power_mw_2: 0x0,
> +                        ppm_filter_tc_ms: pwr.ppm_filter_time_constant_ms,
> +                        #[ver(V >= V13_0B4)]
> +                        ppm_filter_tc_clks: ppm_filter_tc_ms_rounded * base_clock_khz,
> +                        perf_tgt_utilization: pwr.perf_tgt_utilization,
> +                        perf_boost_min_util: pwr.perf_boost_min_util,
> +                        perf_boost_ce_step: pwr.perf_boost_ce_step,
> +                        perf_reset_iters: pwr.perf_reset_iters,
> +                        unk_774: 6,
> +                        unk_778: 1,
> +                        perf_filter_drop_threshold: pwr.perf_filter_drop_threshold,
> +                        perf_filter_a_neg: f32!(1.0) - perf_filter_a,
> +                        perf_filter_a2_neg: f32!(1.0) - perf_filter_a2,
> +                        perf_filter_a: perf_filter_a,
> +                        perf_filter_a2: perf_filter_a2,
> +                        perf_ki: pwr.perf_integral_gain,
> +                        perf_ki2: pwr.perf_integral_gain2,
> +                        perf_integral_min_clamp: pwr.perf_integral_min_clamp.into(),
> +                        unk_79c: f32!(95.0),
> +                        perf_kp: pwr.perf_proportional_gain,
> +                        perf_kp2: pwr.perf_proportional_gain2,
> +                        boost_state_unk_k: F32::from(boost_ps_count) / f32!(0.95),
> +                        base_pstate_scaled_2: base_ps_scaled,
> +                        max_pstate_scaled_5: max_ps_scaled,
> +                        base_pstate_scaled_3: base_ps_scaled,
> +                        perf_tgt_utilization_2: pwr.perf_tgt_utilization,
> +                        base_pstate_scaled_4: base_ps_scaled,
> +                        unk_7fc: f32!(65536.0),
> +                        pwr_min_duty_cycle_2: pwr.pwr_min_duty_cycle.into(),
> +                        max_pstate_scaled_6: max_ps_scaled.into(),
> +                        max_freq_mhz: pwr.max_freq_mhz,
> +                        pwr_min_duty_cycle_3: pwr.pwr_min_duty_cycle,
> +                        min_pstate_scaled_4: f32!(100.0),
> +                        max_pstate_scaled_7: max_ps_scaled,
> +                        unk_alpha_neg: f32!(0.8),
> +                        unk_alpha: f32!(0.2),
> +                        fast_die0_sensor_mask: U64(self.cfg.fast_die0_sensor_mask),
> +                        fast_die0_release_temp_cc: 100 * pwr.fast_die0_release_temp,
> +                        unk_87c: self.cfg.da.unk_87c,
> +                        unk_880: 0x4,
> +                        unk_894: f32!(1.0),
> +
> +                        fast_die0_ki_dt: pwr.fast_die0_integral_gain * period_s,
> +                        unk_8a8: f32!(65536.0),
> +                        fast_die0_kp: pwr.fast_die0_proportional_gain,
> +                        pwr_min_duty_cycle_4: pwr.pwr_min_duty_cycle,
> +                        max_pstate_scaled_8: max_ps_scaled,
> +                        max_pstate_scaled_9: max_ps_scaled,
> +                        fast_die0_prop_tgt_delta: 100 * pwr.fast_die0_prop_tgt_delta,
> +                        unk_8cc: self.cfg.da.unk_8cc,
> +                        max_pstate_scaled_10: max_ps_scaled,
> +                        max_pstate_scaled_11: max_ps_scaled,
> +                        unk_c2c: 1,
> +                        power_zone_count: pwr.power_zones.len() as u32,
> +                        max_power_4: pwr.max_power_mw,
> +                        max_power_5: pwr.max_power_mw,
> +                        max_power_6: pwr.max_power_mw,
> +                        avg_power_target_filter_a_neg: f32!(1.0) - avg_power_target_filter_a,
> +                        avg_power_target_filter_a: avg_power_target_filter_a,
> +                        avg_power_target_filter_tc_x4: 4 * pwr.avg_power_target_filter_tc,
> +                        avg_power_target_filter_tc_xperiod: period_ms
> +                            * pwr.avg_power_target_filter_tc,
> +                        #[ver(V >= V13_0B4)]
> +                        avg_power_target_filter_tc_clks: period_ms
> +                            * pwr.avg_power_target_filter_tc
> +                            * base_clock_khz,
> +                        avg_power_filter_tc_periods_x4: 4 * avg_power_filter_tc_periods,
> +                        avg_power_filter_a_neg: f32!(1.0) - avg_power_filter_a,
> +                        avg_power_filter_a: avg_power_filter_a,
> +                        avg_power_ki_dt: pwr.avg_power_ki_only * period_s,
> +                        unk_d20: f32!(65536.0),
> +                        avg_power_kp: pwr.avg_power_kp,
> +                        avg_power_min_duty_cycle: pwr.avg_power_min_duty_cycle,
> +                        max_pstate_scaled_12: max_ps_scaled,
> +                        max_pstate_scaled_13: max_ps_scaled,
> +                        max_power_7: pwr.max_power_mw.into(),
> +                        max_power_8: pwr.max_power_mw,
> +                        avg_power_filter_tc_ms: pwr.avg_power_filter_tc_ms,
> +                        #[ver(V >= V13_0B4)]
> +                        avg_power_filter_tc_clks: avg_power_filter_tc_ms_rounded * base_clock_khz,
> +                        max_pstate_scaled_14: max_ps_scaled,
> +                        t81xx_data: match self.cfg.chip_id {
> +                            0x8103 | 0x8112 => Self::t81xx_data(self.dyncfg),
> +                            _ => Default::default(),
> +                        },
> +                        #[ver(V >= V13_0B4)]
> +                        unk_e10_0: raw::HwDataA130Extra {
> +                            unk_38: 4,
> +                            unk_3c: 8000,
> +                            unk_40: 2500,
> +                            unk_48: 0xffffffff,
> +                            unk_4c: 50,
> +                            unk_54: 50,
> +                            unk_58: 0x1,
> +                            unk_60: f32!(0.8888889),
> +                            unk_64: f32!(0.6666667),
> +                            unk_68: f32!(0.11111111),
> +                            unk_6c: f32!(0.33333333),
> +                            unk_70: f32!(-0.4),
> +                            unk_74: f32!(-0.8),
> +                            unk_7c: f32!(65536.0),
> +                            unk_80: f32!(-5.0),
> +                            unk_84: f32!(-10.0),
> +                            unk_8c: 40,
> +                            max_pstate_scaled_1: max_ps_scaled,
> +                            unk_9c: f32!(8000.0),
> +                            unk_a0: 1400,
> +                            unk_a8: 72,
> +                            unk_ac: 24,
> +                            unk_b0: 1728000,
> +                            unk_b8: 576000,
> +                            unk_c4: f32!(65536.0),
> +                            unk_114: f32!(65536.0),
> +                            unk_124: 40,
> +                            max_pstate_scaled_2: max_ps_scaled,
> +                            ..Default::default()
> +                        },
> +                        fast_die0_sensor_mask_2: U64(self.cfg.fast_die0_sensor_mask),
> +                        unk_e24: self.cfg.da.unk_e24,
> +                        unk_e28: 1,
> +                        fast_die0_sensor_mask_alt: U64(self.cfg.fast_die0_sensor_mask_alt),
> +                        #[ver(V < V13_0B4)]
> +                        fast_die0_sensor_present: U64(self.cfg.fast_die0_sensor_present as u64),
> +                        unk_163c: 1,
> +                        unk_3644: 0,
> +                        hws1: Self::hw_shared1(self.cfg),
> +                        hws2: *Self::hw_shared2(self.cfg)?,
> +                        hws3: *Self::hw_shared3(self.cfg)?,
> +                        unk_3ce8: 1,
> +                        ..Default::default()
> +                    }
> +                );
> +
> +                for i in 0..self.dyncfg.pwr.perf_states.len() {
> +                    raw.sram_k[i] = self.cfg.sram_k;
> +                }
> +
> +                for (i, coef) in pwr.core_leak_coef.iter().enumerate() {
> +                    raw.core_leak_coef[i] = *coef;
> +                }
> +
> +                for (i, coef) in pwr.sram_leak_coef.iter().enumerate() {
> +                    raw.sram_leak_coef[i] = *coef;
> +                }
> +
> +                for i in 0..self.dyncfg.id.num_clusters as usize {
> +                    if let Some(coef_a) = self.cfg.unk_coef_a.get(i) {
> +                        (*raw.unk_coef_a1[i])[..coef_a.len()].copy_from_slice(coef_a);
> +                        (*raw.unk_coef_a2[i])[..coef_a.len()].copy_from_slice(coef_a);
> +                    }
> +                    if let Some(coef_b) = self.cfg.unk_coef_b.get(i) {
> +                        (*raw.unk_coef_b1[i])[..coef_b.len()].copy_from_slice(coef_b);
> +                        (*raw.unk_coef_b2[i])[..coef_b.len()].copy_from_slice(coef_b);
> +                    }
> +                }
> +
> +                for (i, pz) in pwr.power_zones.iter().enumerate() {
> +                    raw.power_zones[i].target = pz.target;
> +                    raw.power_zones[i].target_off = pz.target - pz.target_offset;
> +                    raw.power_zones[i].filter_tc_x4 = 4 * pz.filter_tc;
> +                    raw.power_zones[i].filter_tc_xperiod = period_ms * pz.filter_tc;
> +                    let filter_a = f32!(1.0) / pz.filter_tc.into();
> +                    raw.power_zones[i].filter_a = filter_a;
> +                    raw.power_zones[i].filter_a_neg = f32!(1.0) - filter_a;
> +                    #[ver(V >= V13_0B4)]
> +                    raw.power_zones[i].unk_10 = 1320000000;
> +                }
> +
> +                Ok(raw)
> +            })
> +    }
> +
> +    /// Create the HwDataB structure. This mostly contains GPU-related configuration.
> +    #[inline(never)]
> +    fn hwdata_b(&mut self) -> Result<GpuObject<HwDataB::ver>> {
> +        self.alloc
> +            .private
> +            .new_inplace(Default::default(), |_inner, ptr| {
> +                let raw = place!(
> +                    ptr,
> +                    raw::HwDataB::ver {
> +                        // Userspace VA map related
> +                        #[ver(V < V13_0B4)]
> +                        unk_0: U64(0x13_00000000),
> +                        unk_8: U64(0x14_00000000),
> +                        #[ver(V < V13_0B4)]
> +                        unk_10: U64(0x1_00000000),
> +                        unk_18: U64(0xffc00000),
> +                        unk_20: U64(0x11_00000000),
> +                        unk_28: U64(0x11_00000000),
> +                        // userspace address?
> +                        unk_30: U64(0x6f_ffff8000),
> +                        // unmapped?
> +                        unkptr_38: U64(0xffffffa0_11800000),
> +                        // TODO: yuv matrices
> +                        chip_id: self.cfg.chip_id,
> +                        unk_454: 0x1,
> +                        unk_458: 0x1,
> +                        unk_460: 0x1,
> +                        unk_464: 0x1,
> +                        unk_468: 0x1,
> +                        unk_47c: 0x1,
> +                        unk_484: 0x1,
> +                        unk_48c: 0x1,
> +                        base_clock_khz: self.cfg.base_clock_hz / 1000,
> +                        power_sample_period: self.dyncfg.pwr.power_sample_period,
> +                        unk_49c: 0x1,
> +                        unk_4a0: 0x1,
> +                        unk_4a4: 0x1,
> +                        unk_4c0: 0x1f,
> +                        unk_4e0: U64(self.cfg.db.unk_4e0),
> +                        unk_4f0: 0x1,
> +                        unk_4f4: 0x1,
> +                        unk_504: 0x31,
> +                        unk_524: 0x1, // use_secure_cache_flush
> +                        unk_534: self.cfg.db.unk_534,
> +                        num_frags: self.dyncfg.id.num_frags * self.dyncfg.id.num_clusters,
> +                        unk_554: 0x1,
> +                        uat_ttb_base: U64(self.dyncfg.uat_ttb_base),
> +                        gpu_core_id: self.cfg.gpu_core as u32,
> +                        gpu_rev_id: self.dyncfg.id.gpu_rev_id as u32,
> +                        num_cores: self.dyncfg.id.num_cores * self.dyncfg.id.num_clusters,
> +                        max_pstate: self.dyncfg.pwr.perf_states.len() as u32 - 1,
> +                        #[ver(V < V13_0B4)]
> +                        num_pstates: self.dyncfg.pwr.perf_states.len() as u32,
> +                        #[ver(V < V13_0B4)]
> +                        min_sram_volt: self.dyncfg.pwr.min_sram_microvolt / 1000,
> +                        #[ver(V < V13_0B4)]
> +                        unk_ab8: self.cfg.db.unk_ab8,
> +                        #[ver(V < V13_0B4)]
> +                        unk_abc: self.cfg.db.unk_abc,
> +                        #[ver(V < V13_0B4)]
> +                        unk_ac0: 0x1020,
> +
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ae4: Array::new([0x0, 0x3, 0x7, 0x7]),
> +                        #[ver(V < V13_0B4)]
> +                        unk_ae4: Array::new([0x0, 0xf, 0x3f, 0x3f]),
> +                        unk_b10: 0x1,
> +                        unk_b24: 0x1,
> +                        unk_b28: 0x1,
> +                        unk_b2c: 0x1,
> +                        unk_b30: self.cfg.db.unk_b30,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_b38_0: 1,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_b38_4: 1,
> +                        unk_b38: Array::new([0xffffffff; 12]),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_c3c: 0x19,
> +                        ..Default::default()
> +                    }
> +                );
> +
> +                let base_ps = self.dyncfg.pwr.perf_base_pstate as usize;
> +                let max_ps = self.dyncfg.pwr.perf_max_pstate as usize;
> +                let base_freq = self.dyncfg.pwr.perf_states[base_ps].freq_hz;
> +                let max_freq = self.dyncfg.pwr.perf_states[max_ps].freq_hz;
> +
> +                for (i, ps) in self.dyncfg.pwr.perf_states.iter().enumerate() {
> +                    raw.frequencies[i] = ps.freq_hz / 1000000;
> +                    for (j, mv) in ps.volt_mv.iter().enumerate() {
> +                        let sram_mv = (*mv).max(self.dyncfg.pwr.min_sram_microvolt / 1000);
> +                        raw.voltages[i][j] = *mv;
> +                        raw.voltages_sram[i][j] = sram_mv;
> +                    }
> +                    raw.sram_k[i] = self.cfg.sram_k;
> +                    raw.rel_max_powers[i] = ps.pwr_mw * 100 / self.dyncfg.pwr.max_power_mw;
> +                    raw.rel_boost_freqs[i] = if i > base_ps {
> +                        (ps.freq_hz - base_freq) / ((max_freq - base_freq) / 100)
> +                    } else {
> +                        0
> +                    };
> +                }
> +
> +                Ok(raw)
> +            })
> +    }
> +
> +    /// Create the Globals structure, which contains global firmware config including more power
> +    /// configuration data and globals used to exchange state between the firmware and driver.
> +    #[inline(never)]
> +    fn globals(&mut self) -> Result<GpuObject<Globals::ver>> {
> +        self.alloc
> +            .shared
> +            .new_inplace(Default::default(), |_inner, ptr| {
> +                let pwr = &self.dyncfg.pwr;
> +                let period_ms = pwr.power_sample_period;
> +                let period_s = F32::from(period_ms) / f32!(1000.0);
> +                let avg_power_filter_tc_periods = pwr.avg_power_filter_tc_ms / period_ms;
> +
> +                let max_ps = pwr.perf_max_pstate;
> +                let max_ps_scaled = 100 * max_ps;
> +
> +                let raw = place!(
> +                    ptr,
> +                    raw::Globals::ver {
> +                        //ktrace_enable: 0xffffffff,
> +                        ktrace_enable: 0,
> +                        #[ver(V >= V13_2)]
> +                        unk_24_0: 3000,
> +                        unk_24: 0,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_28_0: 0, // debug
> +                        unk_28: 1,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_2c_0: 0,
> +                        unk_2c: 1,
> +                        unk_30: 0,
> +                        unk_34: 120,
> +                        sub: raw::GlobalsSub::ver {
> +                            unk_54: 0xffff,
> +                            unk_56: 40,
> +                            unk_58: 0xffff,
> +                            unk_5e: U32(1),
> +                            unk_66: U32(1),
> +                            ..Default::default()
> +                        },
> +                        unk_8900: 1,
> +                        pending_submissions: AtomicU32::new(0),
> +                        max_power: pwr.max_power_mw,
> +                        max_pstate_scaled: max_ps_scaled,
> +                        max_pstate_scaled_2: max_ps_scaled,
> +                        max_pstate_scaled_3: max_ps_scaled,
> +                        power_zone_count: pwr.power_zones.len() as u32,
> +                        avg_power_filter_tc_periods: avg_power_filter_tc_periods,
> +                        avg_power_ki_dt: pwr.avg_power_ki_only * period_s,
> +                        avg_power_kp: pwr.avg_power_kp,
> +                        avg_power_min_duty_cycle: pwr.avg_power_min_duty_cycle,
> +                        avg_power_target_filter_tc: pwr.avg_power_target_filter_tc,
> +                        unk_89bc: self.cfg.da.unk_8cc,
> +                        fast_die0_release_temp: 100 * pwr.fast_die0_release_temp,
> +                        unk_89c4: self.cfg.da.unk_87c,
> +                        fast_die0_prop_tgt_delta: 100 * pwr.fast_die0_prop_tgt_delta,
> +                        fast_die0_kp: pwr.fast_die0_proportional_gain,
> +                        fast_die0_ki_dt: pwr.fast_die0_integral_gain * period_s,
> +                        unk_89e0: 1,
> +                        max_power_2: pwr.max_power_mw,
> +                        ppm_kp: pwr.ppm_kp,
> +                        ppm_ki_dt: pwr.ppm_ki * period_s,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_89f4_8: 1,
> +                        unk_89f4: 0,
> +                        hws1: Self::hw_shared1(self.cfg),
> +                        hws2: *Self::hw_shared2(self.cfg)?,
> +                        hws3: *Self::hw_shared3(self.cfg)?,
> +                        unk_900c: 1,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_9010_0: 1,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_903c: 1,
> +                        #[ver(V < V13_0B4)]
> +                        unk_903c: 0,
> +                        fault_control: *crate::fault_control.read(),
> +                        do_init: 1,
> +                        unk_11020: 40,
> +                        unk_11024: 10,
> +                        unk_11028: 250,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_1102c_0: 1,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_1102c_4: 1,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_1102c_8: 100,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_1102c_c: 1,
> +                        idle_off_delay_ms: AtomicU32::new(pwr.idle_off_delay_ms),
> +                        fender_idle_off_delay_ms: pwr.fender_idle_off_delay_ms,
> +                        fw_early_wake_timeout_ms: pwr.fw_early_wake_timeout_ms,
> +                        unk_118e0: 40,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_118e4_0: 50,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_11edc: 0,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_11efc: 0,
> +                        ..Default::default()
> +                    }
> +                );
> +
> +                for (i, pz) in pwr.power_zones.iter().enumerate() {
> +                    raw.power_zones[i].target = pz.target;
> +                    raw.power_zones[i].target_off = pz.target - pz.target_offset;
> +                    raw.power_zones[i].filter_tc = pz.filter_tc;
> +                }
> +
> +                if let Some(tab) = self.cfg.global_tab.as_ref() {
> +                    for (i, x) in tab.iter().enumerate() {
> +                        raw.unk_118ec[i] = *x;
> +                    }
> +                    raw.unk_118e8 = 1;
> +                }
> +
> +                Ok(raw)
> +            })
> +    }
> +
> +    /// Create the RuntimePointers structure, which contains pointers to most of the other
> +    /// structures including the ring buffer channels, statistics structures, and HwDataA/HwDataB.
> +    #[inline(never)]
> +    fn runtime_pointers(&mut self) -> Result<GpuObject<RuntimePointers::ver>> {
> +        let hwa = self.hwdata_a()?;
> +        let hwb = self.hwdata_b()?;
> +
> +        let pointers: Box<RuntimePointers::ver> = box_in_place!(RuntimePointers::ver {
> +            stats: Stats::ver {
> +                vtx: self.alloc.private.new_default::<GpuGlobalStatsVtx::ver>()?,
> +                frag: self.alloc.private.new_inplace(
> +                    Default::default(),
> +                    |_inner, ptr: &mut MaybeUninit<raw::GpuGlobalStatsFrag::ver>| {
> +                        Ok(place!(
> +                            ptr,
> +                            raw::GpuGlobalStatsFrag::ver {
> +                                stats: raw::GpuStatsFrag::ver {
> +                                    cur_stamp_id: -1,
> +                                    unk_118: -1,
> +                                    ..Default::default()
> +                                },
> +                                ..Default::default()
> +                            }
> +                        ))
> +                    },
> +                )?,
> +                comp: self.alloc.private.new_default::<GpuStatsComp>()?,
> +            },
> +
> +            hwdata_a: hwa,
> +            unkptr_190: self.alloc.private.array_empty(0x80)?,
> +            unkptr_198: self.alloc.private.array_empty(0xc0)?,
> +            hwdata_b: hwb,
> +
> +            unkptr_1b8: self.alloc.private.array_empty(0x1000)?,
> +            unkptr_1c0: self.alloc.private.array_empty(0x300)?,
> +            unkptr_1c8: self.alloc.private.array_empty(0x1000)?,
> +
> +            buffer_mgr_ctl: self.alloc.gpu.array_empty(127)?,
> +        })?;
> +
> +        self.alloc.private.new_boxed(pointers, |inner, ptr| {
> +            Ok(place!(
> +                ptr,
> +                raw::RuntimePointers::ver {
> +                    pipes: Default::default(),
> +                    device_control: Default::default(),
> +                    event: Default::default(),
> +                    fw_log: Default::default(),
> +                    ktrace: Default::default(),
> +                    stats: Default::default(),
> +
> +                    stats_vtx: inner.stats.vtx.gpu_pointer(),
> +                    stats_frag: inner.stats.frag.gpu_pointer(),
> +                    stats_comp: inner.stats.comp.gpu_pointer(),
> +
> +                    hwdata_a: inner.hwdata_a.gpu_pointer(),
> +                    unkptr_190: inner.unkptr_190.gpu_pointer(),
> +                    unkptr_198: inner.unkptr_198.gpu_pointer(),
> +                    hwdata_b: inner.hwdata_b.gpu_pointer(),
> +                    hwdata_b_2: inner.hwdata_b.gpu_pointer(),
> +
> +                    fwlog_buf: None,
> +
> +                    unkptr_1b8: inner.unkptr_1b8.gpu_pointer(),
> +                    unkptr_1c0: inner.unkptr_1c0.gpu_pointer(),
> +                    unkptr_1c8: inner.unkptr_1c8.gpu_pointer(),
> +
> +                    buffer_mgr_ctl: inner.buffer_mgr_ctl.gpu_pointer(),
> +                    buffer_mgr_ctl_2: inner.buffer_mgr_ctl.gpu_pointer(),
> +
> +                    __pad0: Default::default(),
> +                    unk_160: U64(0),
> +                    unk_168: U64(0),
> +                    unk_1d0: 0,
> +                    unk_1d4: 0,
> +                    unk_1d8: Default::default(),
> +
> +                    __pad1: Default::default(),
> +                    gpu_scratch: raw::RuntimeScratch {
> +                        unk_6b38: 0xff,
> +                        ..Default::default()
> +                    },
> +                }
> +            ))
> +        })
> +    }
> +
> +    /// Create the FwStatus structure, which is used to coordinate the firmware halt state between
> +    /// the firmware and the driver.
> +    #[inline(never)]
> +    fn fw_status(&mut self) -> Result<GpuObject<FwStatus>> {
> +        self.alloc
> +            .shared
> +            .new_object(Default::default(), |_inner| Default::default())
> +    }
> +
> +    /// Create one UatLevelInfo structure, which describes one level of translation for the UAT MMU.
> +    #[inline(never)]
> +    fn uat_level_info(
> +        cfg: &hw::HwConfig,
> +        index_shift: usize,
> +        num_entries: usize,
> +    ) -> raw::UatLevelInfo {
> +        raw::UatLevelInfo {
> +            index_shift: index_shift as _,
> +            unk_1: 14,
> +            unk_2: 14,
> +            unk_3: 8,
> +            unk_4: 0x4000,
> +            num_entries: num_entries as _,
> +            unk_8: U64(1),
> +            unk_10: U64(((1u64 << cfg.uat_oas) - 1) & !(mmu::UAT_PGMSK as u64)),
> +            index_mask: U64(((num_entries - 1) << index_shift) as u64),
> +        }
> +    }
> +
> +    /// Build the top-level InitData object.
> +    #[inline(never)]
> +    pub(crate) fn build(&mut self) -> Result<Box<GpuObject<InitData::ver>>> {
> +        let inner: Box<InitData::ver> = box_in_place!(InitData::ver {
> +            unk_buf: self.alloc.shared_ro.array_empty(0x4000)?,
> +            runtime_pointers: self.runtime_pointers()?,
> +            globals: self.globals()?,
> +            fw_status: self.fw_status()?,
> +        })?;
> +
> +        Ok(Box::try_new(self.alloc.shared_ro.new_boxed(
> +            inner,
> +            |inner, ptr| {
> +                Ok(place!(
> +                    ptr,
> +                    raw::InitData::ver {
> +                        #[ver(V >= V13_0B4)]
> +                        ver_info: Array::new([1, 1, 16, 1]),
> +                        unk_buf: inner.unk_buf.gpu_pointer(),
> +                        unk_8: 0,
> +                        unk_c: 0,
> +                        runtime_pointers: inner.runtime_pointers.gpu_pointer(),
> +                        globals: inner.globals.gpu_pointer(),
> +                        fw_status: inner.fw_status.gpu_pointer(),
> +                        uat_page_size: 0x4000,
> +                        uat_page_bits: 14,
> +                        uat_num_levels: 3,
> +                        uat_level_info: Array::new([
> +                            Self::uat_level_info(self.cfg, 36, 8),
> +                            Self::uat_level_info(self.cfg, 25, 2048),
> +                            Self::uat_level_info(self.cfg, 14, 2048),
> +                        ]),
> +                        __pad0: Default::default(),
> +                        host_mapped_fw_allocations: 1,
> +                        unk_ac: 0,
> +                        unk_b0: 0,
> +                        unk_b4: 0,
> +                        unk_b8: 0,
> +                    }
> +                ))
> +            },
> +        )?)?)
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/mem.rs b/drivers/gpu/drm/asahi/mem.rs
> new file mode 100644
> index 000000000000..491d4f8a4016
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/mem.rs
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! ARM64 low level memory operations.
> +//!
> +//! This GPU uses CPU-side `tlbi` outer-shareable instructions to manage its TLBs.
> +//! Yes, really. Even though the VA address spaces are unrelated.
> +//!
> +//! Right now we pick our own ASIDs and don't coordinate with the CPU. This might result
> +//! in needless TLB shootdowns on the CPU side... TODO: fix this.
> +
> +use core::arch::asm;
> +use core::cmp::min;
> +
> +use crate::debug::*;
> +use crate::mmu;
> +
> +type Asid = u8;
> +
> +/// Invalidate the entire GPU TLB.
> +#[inline(always)]
> +pub(crate) fn tlbi_all() {
> +    unsafe {
> +        asm!(".arch armv8.4-a", "tlbi vmalle1os",);
> +    }
> +}
> +
> +/// Invalidate all TLB entries for a given ASID.
> +#[inline(always)]
> +pub(crate) fn tlbi_asid(asid: Asid) {
> +    if debug_enabled(DebugFlags::ConservativeTlbi) {
> +        tlbi_all();
> +        sync();
> +        return;
> +    }
> +
> +    unsafe {
> +        asm!(
> +            ".arch armv8.4-a",
> +            "tlbi aside1os, {x}",
> +            x = in(reg) ((asid as u64) << 48)
> +        );
> +    }
> +}
> +
> +/// Invalidate a single page for a given ASID.
> +#[inline(always)]
> +pub(crate) fn tlbi_page(asid: Asid, va: usize) {
> +    if debug_enabled(DebugFlags::ConservativeTlbi) {
> +        tlbi_all();
> +        sync();
> +        return;
> +    }
> +
> +    let val: u64 = ((asid as u64) << 48) | ((va as u64 >> 12) & 0xffffffffffc);
> +    unsafe {
> +        asm!(
> +            ".arch armv8.4-a",
> +            "tlbi vae1os, {x}",
> +            x = in(reg) val
> +        );
> +    }
> +}
> +
> +/// Invalidate a range of pages for a given ASID.
> +#[inline(always)]
> +pub(crate) fn tlbi_range(asid: Asid, va: usize, len: usize) {
> +    if debug_enabled(DebugFlags::ConservativeTlbi) {
> +        tlbi_all();
> +        sync();
> +        return;
> +    }
> +
> +    if len == 0 {
> +        return;
> +    }
> +
> +    let start_pg = va >> mmu::UAT_PGBIT;
> +    let end_pg = (va + len + mmu::UAT_PGMSK) >> mmu::UAT_PGBIT;
> +
> +    let mut val: u64 = ((asid as u64) << 48) | (2 << 46) | (start_pg as u64 & 0x1fffffffff);
> +    let pages = end_pg - start_pg;
> +
> +    if pages == 1 {
> +        tlbi_page(asid, va);
> +        return;
> +    }
> +
> +    // Page count is always in units of 2
> +    let num = ((pages + 1) >> 1) as u64;
> +    // base: 5 bits
> +    // exp: 2 bits
> +    // pages = (base + 1) << (5 * exp + 1)
> +    // 0:00000 ->                     2 pages = 2 << 0
> +    // 0:11111 ->                32 * 2 pages = 2 << 5
> +    // 1:00000 ->            1 * 32 * 2 pages = 2 << 5
> +    // 1:11111 ->           32 * 32 * 2 pages = 2 << 10
> +    // 2:00000 ->       1 * 32 * 32 * 2 pages = 2 << 10
> +    // 2:11111 ->      32 * 32 * 32 * 2 pages = 2 << 15
> +    // 3:00000 ->  1 * 32 * 32 * 32 * 2 pages = 2 << 15
> +    // 3:11111 -> 32 * 32 * 32 * 32 * 2 pages = 2 << 20
> +    let exp = min(3, (64 - num.leading_zeros()) / 5);
> +    let bits = 5 * exp;
> +    let mut base = (num + (1 << bits) - 1) >> bits;
> +
> +    val |= (exp as u64) << 44;
> +
> +    while base > 32 {
> +        unsafe {
> +            asm!(
> +                ".arch armv8.4-a",
> +                "tlbi rvae1os, {x}",
> +                x = in(reg) val | (31 << 39)
> +            );
> +        }
> +        base -= 32;
> +    }
> +
> +    unsafe {
> +        asm!(
> +            ".arch armv8.4-a",
> +            "tlbi rvae1os, {x}",
> +            x = in(reg) val | ((base - 1) << 39)
> +        );
> +    }
> +}
> +
> +/// Issue a memory barrier (`dsb sy`).
> +#[inline(always)]
> +pub(crate) fn sync() {
> +    unsafe {
> +        asm!("dsb sy");
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/microseq.rs b/drivers/gpu/drm/asahi/microseq.rs
> new file mode 100644
> index 000000000000..dca94ebc53a1
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/microseq.rs
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! GPU Micro operation sequence builder
> +//!
> +//! As part of a single job submisssion to the GPU, the GPU firmware interprets a sequence of
> +//! commands that we call a "microsequence". These are responsible for setting up the job execution,
> +//! timestamping the process, waiting for completion, tearing up any resources, and signaling
> +//! completion to the driver via the event stamp mechanism.
> +//!
> +//! Although the microsequences used by the macOS driver are usually quite uniform and simple, the
> +//! firmware actually implements enough operations to make this interpreter Turing-complete (!).
> +//! Most of those aren't implemented yet, since we don't need them, but they could come in handy in
> +//! the future to do strange things or work around firmware bugs...
> +//!
> +//! This module simply implements a collection of microsequence operations that can be appended to
> +//! and later concatenated into one buffer, ready for firmware execution.
> +
> +use crate::fw::microseq;
> +pub(crate) use crate::fw::microseq::*;
> +use crate::fw::types::*;
> +use kernel::prelude::*;
> +
> +/// MicroSequence object type, which is just an opaque byte array.
> +pub(crate) type MicroSequence = GpuArray<u8>;
> +
> +/// MicroSequence builder.
> +pub(crate) struct Builder {
> +    ops: Vec<u8>,
> +}
> +
> +impl Builder {
> +    /// Create a new Builder object
> +    pub(crate) fn new() -> Builder {
> +        Builder { ops: Vec::new() }
> +    }
> +
> +    /// Get the relative offset from the current pointer to a given target offset.
> +    ///
> +    /// Used for relative jumps.
> +    pub(crate) fn offset_to(&self, target: i32) -> i32 {
> +        target - self.ops.len() as i32
> +    }
> +
> +    /// Add an operation to the end of the sequence.
> +    pub(crate) fn add<T: microseq::Operation>(&mut self, op: T) -> Result<i32> {
> +        let off = self.ops.len();
> +        let p: *const T = &op;
> +        let p: *const u8 = p as *const u8;
> +        let s: &[u8] = unsafe { core::slice::from_raw_parts(p, core::mem::size_of::<T>()) };
> +        self.ops.try_extend_from_slice(s)?;
> +        Ok(off as i32)
> +    }
> +
> +    /// Collect all submitted operations into a finalized GPU object.
> +    pub(crate) fn build(self, alloc: &mut Allocator) -> Result<MicroSequence> {
> +        let mut array = alloc.array_empty::<u8>(self.ops.len())?;
> +
> +        array.as_mut_slice().clone_from_slice(self.ops.as_slice());
> +        Ok(array)
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/mmu.rs b/drivers/gpu/drm/asahi/mmu.rs
> new file mode 100644
> index 000000000000..226ca0b7c1d7
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/mmu.rs
> @@ -0,0 +1,1249 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! GPU UAT (MMU) management
> +//!
> +//! AGX GPUs use an MMU called the UAT, which is largely compatible with the ARM64 page table
> +//! format. This module manages the global MMU structures, including a shared handoff structure
> +//! that is used to coordinate VM management operations with the firmware, the TTBAT which points
> +//! to currently active GPU VM contexts, as well as the individual `Vm` operations to map and
> +//! unmap buffer objects into a single user or kernel address space.
> +//!
> +//! The actual page table management is delegated to the common kernel `io_pgtable` code.
> +
> +use core::fmt::Debug;
> +use core::mem::size_of;
> +use core::ptr::{addr_of_mut, NonNull};
> +use core::sync::atomic::{fence, AtomicU32, AtomicU64, AtomicU8, Ordering};
> +use core::time::Duration;
> +
> +use kernel::{
> +    bindings, c_str, delay, device,
> +    drm::mm,
> +    error::{to_result, Result},
> +    io_pgtable,
> +    io_pgtable::{prot, AppleUAT, IoPageTable},
> +    prelude::*,
> +    sync::{smutex::Mutex, Guard},
> +    sync::{Arc, LockClassKey, UniqueArc},
> +    time,
> +    types::ForeignOwnable,
> +};
> +
> +use crate::debug::*;
> +use crate::no_debug;
> +use crate::{driver, fw, gem, hw, mem, slotalloc};
> +
> +const DEBUG_CLASS: DebugFlags = DebugFlags::Mmu;
> +
> +/// PPL magic number for the handoff region
> +const PPL_MAGIC: u64 = 0x4b1d000000000002;
> +
> +/// Number of supported context entries in the TTBAT
> +const UAT_NUM_CTX: usize = 64;
> +/// First context available for users
> +const UAT_USER_CTX_START: usize = 1;
> +/// Number of available user contexts
> +const UAT_USER_CTX: usize = UAT_NUM_CTX - UAT_USER_CTX_START;
> +
> +/// Number of bits in a page offset.
> +pub(crate) const UAT_PGBIT: usize = 14;
> +/// UAT page size.
> +pub(crate) const UAT_PGSZ: usize = 1 << UAT_PGBIT;
> +/// UAT page offset mask.
> +pub(crate) const UAT_PGMSK: usize = UAT_PGSZ - 1;
> +
> +type Pte = AtomicU64;
> +
> +/// Number of PTEs per page.
> +const UAT_NPTE: usize = UAT_PGSZ / size_of::<Pte>();
> +
> +/// UAT input address space (user)
> +pub(crate) const UAT_IAS: usize = 39;
> +/// "Fake" kernel UAT input address space (one page level lower)
> +pub(crate) const UAT_IAS_KERN: usize = 36;
> +
> +/// Lower/user base VA
> +const IOVA_USER_BASE: usize = UAT_PGSZ;
> +/// Lower/user top VA
> +const IOVA_USER_TOP: usize = (1 << UAT_IAS) - 1;
> +/// Upper/kernel base VA
> +// const IOVA_TTBR1_BASE: usize = 0xffffff8000000000;
> +/// Driver-managed kernel base VA
> +const IOVA_KERN_BASE: usize = 0xffffffa000000000;
> +/// Driver-managed kernel top VA
> +const IOVA_KERN_TOP: usize = 0xffffffafffffffff;
> +
> +const TTBR_VALID: u64 = 0x1; // BIT(0)
> +const TTBR_ASID_SHIFT: usize = 48;
> +
> +const PTE_TABLE: u64 = 0x3; // BIT(0) | BIT(1)
> +
> +// Mapping protection types
> +
> +// Note: prot::CACHE means "cache coherency", which for UAT means *uncached*,
> +// since uncached mappings from the GFX ASC side are cache coherent with the AP cache.
> +// Not having that flag means *cached noncoherent*.
> +
> +/// Firmware MMIO R/W
> +pub(crate) const PROT_FW_MMIO_RW: u32 =
> +    prot::PRIV | prot::READ | prot::WRITE | prot::CACHE | prot::MMIO;
> +/// Firmware MMIO R/O
> +pub(crate) const PROT_FW_MMIO_RO: u32 = prot::PRIV | prot::READ | prot::CACHE | prot::MMIO;
> +/// Firmware shared (uncached) RW
> +pub(crate) const PROT_FW_SHARED_RW: u32 = prot::PRIV | prot::READ | prot::WRITE | prot::CACHE;
> +/// Firmware shared (uncached) RO
> +pub(crate) const PROT_FW_SHARED_RO: u32 = prot::PRIV | prot::READ | prot::CACHE;
> +/// Firmware private (cached) RW
> +pub(crate) const PROT_FW_PRIV_RW: u32 = prot::PRIV | prot::READ | prot::WRITE;
> +/*
> +/// Firmware private (cached) RO
> +pub(crate) const PROT_FW_PRIV_RO: u32 = prot::PRIV | prot::READ;
> +*/
> +/// Firmware/GPU shared (uncached) RW
> +pub(crate) const PROT_GPU_FW_SHARED_RW: u32 = prot::READ | prot::WRITE | prot::CACHE;
> +/// Firmware/GPU shared (private) RW
> +pub(crate) const PROT_GPU_FW_PRIV_RW: u32 = prot::READ | prot::WRITE;
> +/// GPU shared/coherent RW
> +pub(crate) const PROT_GPU_SHARED_RW: u32 = prot::READ | prot::WRITE | prot::CACHE | prot::NOEXEC;
> +/// GPU shared/coherent RO
> +pub(crate) const PROT_GPU_SHARED_RO: u32 = prot::READ | prot::CACHE | prot::NOEXEC;
> +/// GPU shared/coherent WO
> +pub(crate) const PROT_GPU_SHARED_WO: u32 = prot::WRITE | prot::CACHE | prot::NOEXEC;
> +/*
> +/// GPU private/noncoherent RW
> +pub(crate) const PROT_GPU_PRIV_RW: u32 = prot::READ | prot::WRITE | prot::NOEXEC;
> +/// GPU private/noncoherent RO
> +pub(crate) const PROT_GPU_PRIV_RO: u32 = prot::READ | prot::NOEXEC;
> +*/
> +
> +type PhysAddr = bindings::phys_addr_t;
> +
> +/// A pre-allocated memory region for UAT management
> +struct UatRegion {
> +    base: PhysAddr,
> +    map: NonNull<core::ffi::c_void>,
> +}
> +
> +/// It's safe to share UAT region records across threads.
> +unsafe impl Send for UatRegion {}
> +unsafe impl Sync for UatRegion {}
> +
> +/// Handoff region flush info structure
> +#[repr(C)]
> +struct FlushInfo {
> +    state: AtomicU64,
> +    addr: AtomicU64,
> +    size: AtomicU64,
> +}
> +
> +/// UAT Handoff region layout
> +#[repr(C)]
> +struct Handoff {
> +    magic_ap: AtomicU64,
> +    magic_fw: AtomicU64,
> +
> +    lock_ap: AtomicU8,
> +    lock_fw: AtomicU8,
> +    // Implicit padding: 2 bytes
> +    turn: AtomicU32,
> +    cur_slot: AtomicU32,
> +    // Implicit padding: 4 bytes
> +    flush: [FlushInfo; UAT_NUM_CTX + 1],
> +
> +    unk2: AtomicU8,
> +    // Implicit padding: 7 bytes
> +    unk3: AtomicU64,
> +}
> +
> +const HANDOFF_SIZE: usize = size_of::<Handoff>();
> +
> +/// One VM slot in the TTBAT
> +#[repr(C)]
> +struct SlotTTBS {
> +    ttb0: AtomicU64,
> +    ttb1: AtomicU64,
> +}
> +
> +const SLOTS_SIZE: usize = UAT_NUM_CTX * size_of::<SlotTTBS>();
> +
> +// We need at least page 0 (ttb0)
> +const PAGETABLES_SIZE: usize = UAT_PGSZ;
> +
> +/// Inner data for a Vm instance. This is reference-counted by the outer Vm object.
> +struct VmInner {
> +    dev: driver::AsahiDevice,
> +    is_kernel: bool,
> +    min_va: usize,
> +    max_va: usize,
> +    page_table: AppleUAT<Uat>,
> +    mm: mm::Allocator<(), MappingInner>,
> +    uat_inner: Arc<UatInner>,
> +    active_users: usize,
> +    binding: Option<slotalloc::Guard<SlotInner>>,
> +    bind_token: Option<slotalloc::SlotToken>,
> +    id: u64,
> +}
> +
> +impl VmInner {
> +    /// Returns the slot index, if this VM is bound.
> +    fn slot(&self) -> Option<u32> {
> +        if self.is_kernel {
> +            // The GFX ASC does not care about the ASID. Pick an arbitrary one.
> +            // TODO: This needs to be a persistently reserved ASID once we integrate
> +            // with the ARM64 kernel ASID machinery to avoid overlap.
> +            Some(0)
> +        } else {
> +            // We don't check whether we lost the slot, which could cause unnecessary
> +            // invalidations against another Vm. However, this situation should be very
> +            // rare (e.g. a Vm lost its slot, which means 63 other Vms bound in the
> +            // interim, and then it gets killed / drops its mappings without doing any
> +            // final rendering). Anything doing active maps/unmaps is probably also
> +            // rendering and therefore likely bound.
> +            self.bind_token
> +                .as_ref()
> +                .map(|token| (token.last_slot() + UAT_USER_CTX_START as u32))
> +        }
> +    }
> +
> +    /// Returns the translation table base for this Vm
> +    fn ttb(&self) -> u64 {
> +        self.page_table.cfg().ttbr
> +    }
> +
> +    /// Map an IOVA to the shifted address the underlying io_pgtable uses.
> +    fn map_iova(&self, iova: usize, size: usize) -> Result<usize> {
> +        if iova < self.min_va || (iova + size - 1) > self.max_va {
> +            Err(EINVAL)
> +        } else if self.is_kernel {
> +            Ok(iova - self.min_va)
> +        } else {
> +            Ok(iova)
> +        }
> +    }
> +
> +    /// Map a contiguous range of virtual->physical pages.
> +    fn map_pages(
> +        &mut self,
> +        mut iova: usize,
> +        mut paddr: usize,
> +        pgsize: usize,
> +        pgcount: usize,
> +        prot: u32,
> +    ) -> Result<usize> {
> +        let mut left = pgcount;
> +        while left > 0 {
> +            let mapped_iova = self.map_iova(iova, pgsize * left)?;
> +            let mapped = self
> +                .page_table
> +                .map_pages(mapped_iova, paddr, pgsize, left, prot)?;
> +            assert!(mapped <= left * pgsize);
> +
> +            left -= mapped / pgsize;
> +            paddr += mapped;
> +            iova += mapped;
> +        }
> +        Ok(pgcount * pgsize)
> +    }
> +
> +    /// Unmap a contiguous range of pages.
> +    fn unmap_pages(&mut self, mut iova: usize, pgsize: usize, pgcount: usize) -> Result<usize> {
> +        let mut left = pgcount;
> +        while left > 0 {
> +            let mapped_iova = self.map_iova(iova, pgsize * left)?;
> +            let unmapped = self.page_table.unmap_pages(mapped_iova, pgsize, left);
> +            assert!(unmapped <= left * pgsize);
> +
> +            left -= unmapped / pgsize;
> +            iova += unmapped;
> +        }
> +
> +        Ok(pgcount * pgsize)
> +    }
> +
> +    /// Map an `mm::Node` representing an mapping in VA space.
> +    fn map_node(&mut self, node: &mm::Node<(), MappingInner>, prot: u32) -> Result {
> +        let mut iova = node.start() as usize;
> +        let sgt = node.sgt.as_ref().ok_or(EINVAL)?;
> +
> +        for range in sgt.iter() {
> +            let addr = range.dma_address();
> +            let len = range.dma_len();
> +
> +            if (addr | len | iova) & UAT_PGMSK != 0 {
> +                dev_err!(
> +                    self.dev,
> +                    "MMU: Mapping {:#x}:{:#x} -> {:#x} is not page-aligned\n",
> +                    addr,
> +                    len,
> +                    iova
> +                );
> +                return Err(EINVAL);
> +            }
> +
> +            mod_dev_dbg!(
> +                self.dev,
> +                "MMU: map: {:#x}:{:#x} -> {:#x}\n",
> +                addr,
> +                len,
> +                iova
> +            );
> +
> +            self.map_pages(iova, addr, UAT_PGSZ, len >> UAT_PGBIT, prot)?;
> +
> +            iova += len;
> +        }
> +        Ok(())
> +    }
> +}
> +
> +/// Shared reference to a virtual memory address space ([`Vm`]).
> +#[derive(Clone)]
> +pub(crate) struct Vm {
> +    id: u64,
> +    file_id: u64,
> +    inner: Arc<Mutex<VmInner>>,
> +}
> +no_debug!(Vm);
> +
> +/// Slot data for a [`Vm`] slot (nothing, we only care about the indices).
> +pub(crate) struct SlotInner();
> +
> +impl slotalloc::SlotItem for SlotInner {
> +    type Data = ();
> +}
> +
> +/// Represents a single user of a binding of a [`Vm`] to a slot.
> +///
> +/// The number of users is counted, and the slot will be freed when it drops to 0.
> +#[derive(Debug)]
> +pub(crate) struct VmBind(Vm, u32);
> +
> +impl VmBind {
> +    /// Returns the slot that this `Vm` is bound to.
> +    pub(crate) fn slot(&self) -> u32 {
> +        self.1
> +    }
> +}
> +
> +impl Drop for VmBind {
> +    fn drop(&mut self) {
> +        let mut inner = self.0.inner.lock();
> +
> +        assert_ne!(inner.active_users, 0);
> +        inner.active_users -= 1;
> +        mod_pr_debug!("MMU: slot {} active users {}\n", self.1, inner.active_users);
> +        if inner.active_users == 0 {
> +            inner.binding = None;
> +        }
> +    }
> +}
> +
> +impl Clone for VmBind {
> +    fn clone(&self) -> VmBind {
> +        let mut inner = self.0.inner.lock();
> +
> +        inner.active_users += 1;
> +        mod_pr_debug!("MMU: slot {} active users {}\n", self.1, inner.active_users);
> +        VmBind(self.0.clone(), self.1)
> +    }
> +}
> +
> +/// Inner data required for an object mapping into a [`Vm`].
> +pub(crate) struct MappingInner {
> +    owner: Arc<Mutex<VmInner>>,
> +    uat_inner: Arc<UatInner>,
> +    prot: u32,
> +    mapped_size: usize,
> +    sgt: Option<gem::SGTable>,
> +}
> +
> +/// An object mapping into a [`Vm`], which reserves the address range from use by other mappings.
> +pub(crate) struct Mapping(mm::Node<(), MappingInner>);
> +
> +impl Mapping {
> +    /// Returns the IOVA base of this mapping
> +    pub(crate) fn iova(&self) -> usize {
> +        self.0.start() as usize
> +    }
> +
> +    /// Returns the size of this mapping in bytes
> +    pub(crate) fn size(&self) -> usize {
> +        self.0.mapped_size
> +    }
> +
> +    /// Remap a cached mapping as uncached, then synchronously flush that range of VAs from the
> +    /// coprocessor cache. This is required to safely unmap cached/private mappings.
> +    fn remap_uncached_and_flush(&mut self) {
> +        let mut owner = self.0.owner.lock();
> +        mod_dev_dbg!(
> +            owner.dev,
> +            "MMU: remap as uncached {:#x}:{:#x}\n",
> +            self.iova(),
> +            self.size()
> +        );
> +
> +        // The IOMMU API does not allow us to remap things in-place...
> +        // just do an unmap and map again for now.
> +        // Do not try to unmap guard page (-1)
> +        if owner
> +            .unmap_pages(self.iova(), UAT_PGSZ, self.size() >> UAT_PGBIT)
> +            .is_err()
> +        {
> +            dev_err!(
> +                owner.dev,
> +                "MMU: unmap for remap {:#x}:{:#x} failed\n",
> +                self.iova(),
> +                self.size()
> +            );
> +        }
> +
> +        let prot = self.0.prot | prot::CACHE;
> +        if owner.map_node(&self.0, prot).is_err() {
> +            dev_err!(
> +                owner.dev,
> +                "MMU: remap {:#x}:{:#x} failed\n",
> +                self.iova(),
> +                self.size()
> +            );
> +        }
> +
> +        // If we don't have (and have never had) a VM slot, just return
> +        let slot = match owner.slot() {
> +            None => return,
> +            Some(slot) => slot,
> +        };
> +
> +        let flush_slot = if owner.is_kernel {
> +            // If this is a kernel mapping, always flush on index 64
> +            UAT_NUM_CTX as u32
> +        } else {
> +            // Otherwise, check if this slot is the active one, otherwise return
> +            // Also check that we actually own this slot
> +            let ttb = owner.ttb() | TTBR_VALID | (slot as u64) << TTBR_ASID_SHIFT;
> +
> +            let uat_inner = self.0.uat_inner.lock();
> +            uat_inner.handoff().lock();
> +            let cur_slot = uat_inner.handoff().current_slot();
> +            let ttb_cur = uat_inner.ttbs()[slot as usize].ttb0.load(Ordering::Relaxed);
> +            uat_inner.handoff().unlock();
> +            if cur_slot == Some(slot) && ttb_cur == ttb {
> +                slot
> +            } else {
> +                return;
> +            }
> +        };
> +
> +        // FIXME: There is a race here, though it'll probably never happen in practice.
> +        // In theory, it's possible for the ASC to finish using our slot, whatever command
> +        // it was processing to complete, the slot to be lost to another context, and the ASC
> +        // to begin using it again with a different page table, thus faulting when it gets a
> +        // flush request here. In practice, the chance of this happening is probably vanishingly
> +        // small, as all 62 other slots would have to be recycled or in use before that slot can
> +        // be reused, and the ASC using user contexts at all is very rare.
> +
> +        // Still, the locking around UAT/Handoff/TTBs should probably be redesigned to better
> +        // model the interactions with the firmware and avoid these races.
> +        // Possibly TTB changes should be tied to slot locks:
> +
> +        // Flush:
> +        //  - Can early check handoff here (no need to lock).
> +        //      If user slot and it doesn't match the active ASC slot,
> +        //      we can elide the flush as the ASC guarantees it flushes
> +        //      TLBs/caches when it switches context. We just need a
> +        //      barrier to ensure ordering.
> +        //  - Lock TTB slot
> +        //      - If user ctx:
> +        //          - Lock handoff AP-side
> +        //              - Lock handoff dekker
> +        //                  - Check TTB & handoff cur ctx
> +        //      - Perform flush if necessary
> +        //          - This implies taking the fwring lock
> +        //
> +        // TTB change:
> +        //  - lock TTB slot
> +        //      - lock handoff AP-side
> +        //          - lock handoff dekker
> +        //              change TTB
> +
> +        // Lock this flush slot, and write the range to it
> +        let flush = self.0.uat_inner.lock_flush(flush_slot);
> +        let pages = self.size() >> UAT_PGBIT;
> +        flush.begin_flush(self.iova() as u64, self.size() as u64);
> +        if pages >= 0x10000 {
> +            dev_err!(owner.dev, "MMU: Flush too big ({:#x} pages))\n", pages);
> +        }
> +
> +        let cmd = fw::channels::FwCtlMsg {
> +            addr: fw::types::U64(self.iova() as u64),
> +            unk_8: 0,
> +            slot: flush_slot,
> +            page_count: pages as u16,
> +            unk_12: 2, // ?
> +        };
> +
> +        // Tell the firmware to do a cache flush
> +        if let Err(e) = owner.dev.data().gpu.fwctl(cmd) {
> +            dev_err!(
> +                owner.dev,
> +                "MMU: ASC cache flush {:#x}:{:#x} failed (err: {:?})\n",
> +                self.iova(),
> +                self.size(),
> +                e
> +            );
> +        }
> +
> +        // Finish the flush
> +        flush.end_flush();
> +
> +        // Slot is unlocked here
> +    }
> +}
> +
> +impl Drop for Mapping {
> +    fn drop(&mut self) {
> +        // This is the main unmap function for UAT mappings.
> +        // The sequence of operations here is finicky, due to the interaction
> +        // between cached GFX ASC mappings and the page tables. These mappings
> +        // always have to be flushed from the cache before being unmapped.
> +
> +        // For uncached mappings, just unmapping and flushing the TLB is sufficient.
> +
> +        // For cached mappings, this is the required sequence:
> +        // 1. Remap it as uncached
> +        // 2. Flush the TLB range
> +        // 3. If kernel VA mapping OR user VA mapping and handoff.current_slot() == slot:
> +        //    a. Take a lock for this slot
> +        //    b. Write the flush range to the right context slot in handoff area
> +        //    c. Issue a cache invalidation request via FwCtl queue
> +        //    d. Poll for completion via queue
> +        //    e. Check for completion flag in the handoff area
> +        //    f. Drop the lock
> +        // 4. Unmap
> +        // 5. Flush the TLB range again
> +
> +        // prot::CACHE means "cache coherent" which means *uncached* here.
> +        if self.0.prot & prot::CACHE == 0 {
> +            self.remap_uncached_and_flush();
> +        }
> +
> +        let mut owner = self.0.owner.lock();
> +        mod_dev_dbg!(
> +            owner.dev,
> +            "MMU: unmap {:#x}:{:#x}\n",
> +            self.iova(),
> +            self.size()
> +        );
> +
> +        if owner
> +            .unmap_pages(self.iova(), UAT_PGSZ, self.size() >> UAT_PGBIT)
> +            .is_err()
> +        {
> +            dev_err!(
> +                owner.dev,
> +                "MMU: unmap {:#x}:{:#x} failed\n",
> +                self.iova(),
> +                self.size()
> +            );
> +        }
> +
> +        if let Some(asid) = owner.slot() {
> +            mem::tlbi_range(asid as u8, self.iova(), self.size());
> +            mod_dev_dbg!(
> +                owner.dev,
> +                "MMU: flush range: asid={:#x} start={:#x} len={:#x}\n",
> +                asid,
> +                self.iova(),
> +                self.size()
> +            );
> +            mem::sync();
> +        }
> +    }
> +}
> +
> +/// Shared UAT global data structures
> +struct UatShared {
> +    handoff_rgn: UatRegion,
> +    ttbs_rgn: UatRegion,
> +}
> +
> +impl UatShared {
> +    /// Returns the handoff region area
> +    fn handoff(&self) -> &Handoff {
> +        // SAFETY: pointer is non-null per the type invariant
> +        unsafe { (self.handoff_rgn.map.as_ptr() as *mut Handoff).as_ref() }.unwrap()
> +    }
> +
> +    /// Returns the TTBAT area
> +    fn ttbs(&self) -> &[SlotTTBS; UAT_NUM_CTX] {
> +        // SAFETY: pointer is non-null per the type invariant
> +        unsafe { (self.ttbs_rgn.map.as_ptr() as *mut [SlotTTBS; UAT_NUM_CTX]).as_ref() }.unwrap()
> +    }
> +}
> +
> +// SAFETY: Nothing here is unsafe to send across threads.
> +unsafe impl Send for UatShared {}
> +
> +/// Inner data for the top-level UAT instance.
> +struct UatInner {
> +    shared: Mutex<UatShared>,
> +    handoff_flush: [Mutex<HandoffFlush>; UAT_NUM_CTX + 1],
> +}
> +
> +impl UatInner {
> +    /// Take the lock on the shared data and return the guard.
> +    fn lock(&self) -> Guard<'_, Mutex<UatShared>> {
> +        self.shared.lock()
> +    }
> +
> +    /// Take a lock on a handoff flush slot and return the guard.
> +    fn lock_flush(&self, slot: u32) -> Guard<'_, Mutex<HandoffFlush>> {
> +        self.handoff_flush[slot as usize].lock()
> +    }
> +}
> +
> +/// Top-level UAT manager object
> +pub(crate) struct Uat {
> +    dev: driver::AsahiDevice,
> +    cfg: &'static hw::HwConfig,
> +    pagetables_rgn: UatRegion,
> +
> +    inner: Arc<UatInner>,
> +    slots: slotalloc::SlotAllocator<SlotInner>,
> +
> +    kernel_vm: Vm,
> +    _kernel_lower_vm: Vm,
> +}
> +
> +impl Drop for UatRegion {
> +    fn drop(&mut self) {
> +        // SAFETY: the pointer is valid by the type invariant
> +        unsafe { bindings::memunmap(self.map.as_ptr()) };
> +    }
> +}
> +
> +impl Handoff {
> +    /// Lock the handoff region from firmware access
> +    fn lock(&self) {
> +        self.lock_ap.store(1, Ordering::Relaxed);
> +        fence(Ordering::SeqCst);
> +
> +        while self.lock_fw.load(Ordering::Relaxed) != 0 {
> +            if self.turn.load(Ordering::Relaxed) != 0 {
> +                self.lock_ap.store(0, Ordering::Relaxed);
> +                while self.turn.load(Ordering::Relaxed) != 0 {}
> +                self.lock_ap.store(1, Ordering::Relaxed);
> +                fence(Ordering::SeqCst);
> +            }
> +        }
> +        fence(Ordering::Acquire);
> +    }
> +
> +    /// Unlock the handoff region, allowing firmware access
> +    fn unlock(&self) {
> +        self.turn.store(1, Ordering::Relaxed);
> +        self.lock_ap.store(0, Ordering::Release);
> +    }
> +
> +    /// Returns the current Vm slot mapped by the firmware for lower/unprivileged access, if any.
> +    fn current_slot(&self) -> Option<u32> {
> +        let slot = self.cur_slot.load(Ordering::Relaxed);
> +        if slot == 0 || slot == u32::MAX {
> +            None
> +        } else {
> +            Some(slot)
> +        }
> +    }
> +
> +    /// Initialize the handoff region
> +    fn init(&self) -> Result {
> +        self.magic_ap.store(PPL_MAGIC, Ordering::Relaxed);
> +        self.cur_slot.store(0, Ordering::Relaxed);
> +        self.unk3.store(0, Ordering::Relaxed);
> +        fence(Ordering::SeqCst);
> +
> +        let timeout = time::ktime_get() + Duration::from_millis(1000);
> +
> +        self.lock();
> +        while time::ktime_get() < timeout {
> +            if self.magic_fw.load(Ordering::Relaxed) == PPL_MAGIC {
> +                break;
> +            } else {
> +                self.unlock();
> +                delay::coarse_sleep(Duration::from_millis(10));
> +                self.lock();
> +            }
> +        }
> +
> +        if self.magic_fw.load(Ordering::Relaxed) != PPL_MAGIC {
> +            self.unlock();
> +            pr_err!("Handoff: Failed to initialize (firmware not running?)\n");
> +            return Err(EIO);
> +        }
> +
> +        self.unlock();
> +
> +        for i in 0..=UAT_NUM_CTX {
> +            self.flush[i].state.store(0, Ordering::Relaxed);
> +            self.flush[i].addr.store(0, Ordering::Relaxed);
> +            self.flush[i].size.store(0, Ordering::Relaxed);
> +        }
> +        fence(Ordering::SeqCst);
> +        Ok(())
> +    }
> +}
> +
> +/// Represents a single flush info slot in the handoff region.
> +///
> +/// # Invariants
> +/// The pointer is valid and there is no aliasing HandoffFlush instance.
> +struct HandoffFlush(*const FlushInfo);
> +
> +// SAFETY: These pointers are safe to send across threads.
> +unsafe impl Send for HandoffFlush {}
> +
> +impl HandoffFlush {
> +    /// Set up a flush operation for the coprocessor
> +    fn begin_flush(&self, start: u64, size: u64) {
> +        let flush = unsafe { self.0.as_ref().unwrap() };
> +
> +        let state = flush.state.load(Ordering::Relaxed);
> +        if state != 0 {
> +            pr_err!("Handoff: expected flush state 0, got {}\n", state);
> +        }
> +        flush.addr.store(start, Ordering::Relaxed);
> +        flush.size.store(size, Ordering::Relaxed);
> +        flush.state.store(1, Ordering::Relaxed);
> +    }
> +
> +    /// Complete a flush operation for the coprocessor
> +    fn end_flush(&self) {
> +        let flush = unsafe { self.0.as_ref().unwrap() };
> +        let state = flush.state.load(Ordering::Relaxed);
> +        if state != 2 {
> +            pr_err!("Handoff: expected flush state 2, got {}\n", state);
> +        }
> +        flush.state.store(0, Ordering::Relaxed);
> +    }
> +}
> +
> +// We do not implement FlushOps, since we flush manually in this module after
> +// page table operations. Just provide dummy implementations.
> +impl io_pgtable::FlushOps for Uat {
> +    type Data = ();
> +
> +    fn tlb_flush_all(_data: <Self::Data as ForeignOwnable>::Borrowed<'_>) {}
> +    fn tlb_flush_walk(
> +        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
> +        _iova: usize,
> +        _size: usize,
> +        _granule: usize,
> +    ) {
> +    }
> +    fn tlb_add_page(
> +        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
> +        _iova: usize,
> +        _granule: usize,
> +    ) {
> +    }
> +}
> +
> +static LOCK_KEY: LockClassKey = LockClassKey::new();
> +
> +impl Vm {
> +    /// Create a new virtual memory address space
> +    fn new(
> +        dev: driver::AsahiDevice,
> +        uat_inner: Arc<UatInner>,
> +        cfg: &'static hw::HwConfig,
> +        is_kernel: bool,
> +        id: u64,
> +        file_id: u64,
> +    ) -> Result<Vm> {
> +        let page_table = AppleUAT::new(
> +            &dev,
> +            io_pgtable::Config {
> +                pgsize_bitmap: UAT_PGSZ,
> +                ias: if is_kernel { UAT_IAS_KERN } else { UAT_IAS },
> +                oas: cfg.uat_oas,
> +                coherent_walk: true,
> +                quirks: 0,
> +            },
> +            (),
> +        )?;
> +        let min_va = if is_kernel {
> +            IOVA_KERN_BASE
> +        } else {
> +            IOVA_USER_BASE
> +        };
> +        let max_va = if is_kernel {
> +            IOVA_KERN_TOP
> +        } else {
> +            IOVA_USER_TOP
> +        };
> +
> +        let mm = mm::Allocator::new(
> +            min_va as u64,
> +            (max_va - min_va + 1) as u64,
> +            (),
> +            c_str!("asahi Vm"),
> +            &LOCK_KEY,
> +        )?;
> +
> +        Ok(Vm {
> +            id,
> +            file_id,
> +            inner: Arc::try_new(Mutex::new(VmInner {
> +                dev,
> +                min_va,
> +                max_va,
> +                is_kernel,
> +                page_table,
> +                mm,
> +                uat_inner,
> +                binding: None,
> +                bind_token: None,
> +                active_users: 0,
> +                id,
> +            }))?,
> +        })
> +    }
> +
> +    /// Get the translation table base for this Vm
> +    fn ttb(&self) -> u64 {
> +        self.inner.lock().ttb()
> +    }
> +
> +    /// Map a GEM object (using its `SGTable`) into this Vm at a free address.
> +    pub(crate) fn map(&self, size: usize, sgt: gem::SGTable) -> Result<Mapping> {
> +        let mut inner = self.inner.lock();
> +
> +        let uat_inner = inner.uat_inner.clone();
> +        let node = inner.mm.insert_node(
> +            MappingInner {
> +                owner: self.inner.clone(),
> +                uat_inner,
> +                prot: PROT_FW_SHARED_RW,
> +                sgt: Some(sgt),
> +                mapped_size: size,
> +            },
> +            (size + UAT_PGSZ) as u64, // Add guard page
> +        )?;
> +
> +        inner.map_node(&node, PROT_FW_SHARED_RW)?;
> +        Ok(Mapping(node))
> +    }
> +
> +    /// Map a GEM object (using its `SGTable`) into this Vm at a free address in a given range.
> +    #[allow(clippy::too_many_arguments)]
> +    pub(crate) fn map_in_range(
> +        &self,
> +        size: usize,
> +        sgt: gem::SGTable,
> +        alignment: u64,
> +        start: u64,
> +        end: u64,
> +        prot: u32,
> +        guard: bool,
> +    ) -> Result<Mapping> {
> +        let mut inner = self.inner.lock();
> +
> +        let uat_inner = inner.uat_inner.clone();
> +        let node = inner.mm.insert_node_in_range(
> +            MappingInner {
> +                owner: self.inner.clone(),
> +                uat_inner,
> +                prot,
> +                sgt: Some(sgt),
> +                mapped_size: size,
> +            },
> +            (size + if guard { UAT_PGSZ } else { 0 }) as u64, // Add guard page
> +            alignment,
> +            0,
> +            start,
> +            end,
> +            mm::InsertMode::Best,
> +        )?;
> +
> +        inner.map_node(&node, prot)?;
> +        Ok(Mapping(node))
> +    }
> +
> +    /// Map a GEM object (using its `SGTable`) into this Vm at a specific address.
> +    #[allow(clippy::too_many_arguments)]
> +    pub(crate) fn map_at(
> +        &self,
> +        addr: u64,
> +        size: usize,
> +        sgt: gem::SGTable,
> +        prot: u32,
> +        guard: bool,
> +    ) -> Result<Mapping> {
> +        let mut inner = self.inner.lock();
> +
> +        let uat_inner = inner.uat_inner.clone();
> +        let node = inner.mm.reserve_node(
> +            MappingInner {
> +                owner: self.inner.clone(),
> +                uat_inner,
> +                prot,
> +                sgt: Some(sgt),
> +                mapped_size: size,
> +            },
> +            addr,
> +            (size + if guard { UAT_PGSZ } else { 0 }) as u64, // Add guard page
> +            0,
> +        )?;
> +
> +        inner.map_node(&node, prot)?;
> +        Ok(Mapping(node))
> +    }
> +
> +    /// Add a direct MMIO mapping to this Vm at a free address.
> +    pub(crate) fn map_io(&self, phys: usize, size: usize, rw: bool) -> Result<Mapping> {
> +        let prot = if rw { PROT_FW_MMIO_RW } else { PROT_FW_MMIO_RO };
> +        let mut inner = self.inner.lock();
> +
> +        let uat_inner = inner.uat_inner.clone();
> +        let node = inner.mm.insert_node(
> +            MappingInner {
> +                owner: self.inner.clone(),
> +                uat_inner,
> +                prot,
> +                sgt: None,
> +                mapped_size: size,
> +            },
> +            (size + UAT_PGSZ) as u64, // Add guard page
> +        )?;
> +
> +        let iova = node.start() as usize;
> +
> +        if (phys | size | iova) & UAT_PGMSK != 0 {
> +            dev_err!(
> +                inner.dev,
> +                "MMU: Mapping {:#x}:{:#x} -> {:#x} is not page-aligned\n",
> +                phys,
> +                size,
> +                iova
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        dev_info!(
> +            inner.dev,
> +            "MMU: IO map: {:#x}:{:#x} -> {:#x}\n",
> +            phys,
> +            size,
> +            iova
> +        );
> +
> +        inner.map_pages(iova, phys, UAT_PGSZ, size >> UAT_PGBIT, prot)?;
> +
> +        Ok(Mapping(node))
> +    }
> +
> +    /// Returns the unique ID of this Vm
> +    pub(crate) fn id(&self) -> u64 {
> +        self.id
> +    }
> +
> +    /// Returns the unique File ID of the owner of this Vm
> +    pub(crate) fn file_id(&self) -> u64 {
> +        self.file_id
> +    }
> +}
> +
> +impl Drop for VmInner {
> +    fn drop(&mut self) {
> +        assert_eq!(self.active_users, 0);
> +
> +        mod_pr_debug!(
> +            "VmInner::Drop [{}]: bind_token={:?}\n",
> +            self.id,
> +            self.bind_token
> +        );
> +
> +        // Make sure this VM is not mapped to a TTB if it was
> +        if let Some(token) = self.bind_token.take() {
> +            let idx = (token.last_slot() as usize) + UAT_USER_CTX_START;
> +            let ttb = self.ttb() | TTBR_VALID | (idx as u64) << TTBR_ASID_SHIFT;
> +
> +            let uat_inner = self.uat_inner.lock();
> +            uat_inner.handoff().lock();
> +            let handoff_cur = uat_inner.handoff().current_slot();
> +            let ttb_cur = uat_inner.ttbs()[idx].ttb0.load(Ordering::SeqCst);
> +            let inval = ttb_cur == ttb;
> +            if inval {
> +                if handoff_cur == Some(idx as u32) {
> +                    pr_err!(
> +                        "VmInner::drop owning slot {}, but it is currently in use by the ASC?\n",
> +                        idx
> +                    );
> +                }
> +                uat_inner.ttbs()[idx].ttb0.store(0, Ordering::SeqCst);
> +            }
> +            uat_inner.handoff().unlock();
> +            core::mem::drop(uat_inner);
> +
> +            // In principle we dropped all the Mappings already, but we might as
> +            // well play it safe and invalidate the whole ASID.
> +            if inval {
> +                mod_pr_debug!(
> +                    "VmInner::Drop [{}]: need inval for ASID {:#x}\n",
> +                    self.id,
> +                    idx
> +                );
> +                mem::tlbi_asid(idx as u8);
> +                mem::sync();
> +            }
> +        }
> +    }
> +}
> +
> +impl Uat {
> +    /// Map a bootloader-preallocated memory region
> +    fn map_region(
> +        dev: &dyn device::RawDevice,
> +        name: &CStr,
> +        size: usize,
> +        cached: bool,
> +    ) -> Result<UatRegion> {
> +        let rdev = dev.raw_device();
> +
> +        let mut res = core::mem::MaybeUninit::<bindings::resource>::uninit();
> +
> +        let res = unsafe {
> +            let idx = bindings::of_property_match_string(
> +                (*rdev).of_node,
> +                c_str!("memory-region-names").as_char_ptr(),
> +                name.as_char_ptr(),
> +            );
> +            to_result(idx)?;
> +
> +            let np = bindings::of_parse_phandle(
> +                (*rdev).of_node,
> +                c_str!("memory-region").as_char_ptr(),
> +                idx,
> +            );
> +            if np.is_null() {
> +                dev_err!(dev, "Missing {} region\n", name);
> +                return Err(EINVAL);
> +            }
> +            let ret = bindings::of_address_to_resource(np, 0, res.as_mut_ptr());
> +            bindings::of_node_put(np);
> +
> +            if ret < 0 {
> +                dev_err!(dev, "Failed to get {} region\n", name);
> +                to_result(ret)?
> +            }
> +
> +            res.assume_init()
> +        };
> +
> +        let rgn_size: usize = unsafe { bindings::resource_size(&res) } as usize;
> +
> +        if size > rgn_size {
> +            dev_err!(
> +                dev,
> +                "Region {} is too small (expected {}, got {})\n",
> +                name,
> +                size,
> +                rgn_size
> +            );
> +            return Err(ENOMEM);
> +        }
> +
> +        let flags = if cached {
> +            bindings::MEMREMAP_WB
> +        } else {
> +            bindings::MEMREMAP_WC
> +        };
> +        let map = unsafe { bindings::memremap(res.start, rgn_size, flags.into()) };
> +        let map = NonNull::new(map);
> +
> +        match map {
> +            None => {
> +                dev_err!(dev, "Failed to remap {} region\n", name);
> +                Err(ENOMEM)
> +            }
> +            Some(map) => Ok(UatRegion {
> +                base: res.start,
> +                map,
> +            }),
> +        }
> +    }
> +
> +    /// Returns a view into the root kernel (upper half) page table
> +    fn kpt0(&self) -> &[Pte; UAT_NPTE] {
> +        // SAFETY: pointer is non-null per the type invariant
> +        unsafe { (self.pagetables_rgn.map.as_ptr() as *mut [Pte; UAT_NPTE]).as_ref() }.unwrap()
> +    }
> +
> +    /// Returns a reference to the global kernel (upper half) `Vm`
> +    pub(crate) fn kernel_vm(&self) -> &Vm {
> +        &self.kernel_vm
> +    }
> +
> +    /// Returns the base physical address of the TTBAT region.
> +    pub(crate) fn ttb_base(&self) -> u64 {
> +        let inner = self.inner.lock();
> +
> +        inner.ttbs_rgn.base
> +    }
> +
> +    /// Binds a `Vm` to a slot, preferring the last used one.
> +    pub(crate) fn bind(&self, vm: &Vm) -> Result<VmBind> {
> +        let mut inner = vm.inner.lock();
> +
> +        if inner.binding.is_none() {
> +            assert_eq!(inner.active_users, 0);
> +
> +            let slot = self.slots.get(inner.bind_token)?;
> +            if slot.changed() {
> +                mod_pr_debug!("Vm Bind [{}]: bind_token={:?}\n", vm.id, slot.token(),);
> +                let idx = (slot.slot() as usize) + UAT_USER_CTX_START;
> +                let ttb = inner.ttb() | TTBR_VALID | (idx as u64) << TTBR_ASID_SHIFT;
> +
> +                let uat_inner = self.inner.lock();
> +                let ttbs = uat_inner.ttbs();
> +                uat_inner.handoff().lock();
> +                if uat_inner.handoff().current_slot() == Some(idx as u32) {
> +                    pr_err!(
> +                        "Vm::bind to slot {}, but it is currently in use by the ASC?\n",
> +                        idx
> +                    );
> +                }
> +                ttbs[idx].ttb0.store(ttb, Ordering::Relaxed);
> +                ttbs[idx].ttb1.store(0, Ordering::Relaxed);
> +                uat_inner.handoff().unlock();
> +                core::mem::drop(uat_inner);
> +
> +                // Make sure all TLB entries from the previous owner of this ASID are gone
> +                mem::tlbi_asid(idx as u8);
> +                mem::sync();
> +            }
> +
> +            inner.bind_token = Some(slot.token());
> +            inner.binding = Some(slot);
> +        }
> +
> +        inner.active_users += 1;
> +
> +        let slot = inner.binding.as_ref().unwrap().slot() + UAT_USER_CTX_START as u32;
> +        mod_pr_debug!("MMU: slot {} active users {}\n", slot, inner.active_users);
> +        Ok(VmBind(vm.clone(), slot))
> +    }
> +
> +    /// Creates a new `Vm` linked to this UAT.
> +    pub(crate) fn new_vm(&self, id: u64, file_id: u64) -> Result<Vm> {
> +        Vm::new(
> +            self.dev.clone(),
> +            self.inner.clone(),
> +            self.cfg,
> +            false,
> +            id,
> +            file_id,
> +        )
> +    }
> +
> +    /// Creates the reference-counted inner data for a new `Uat` instance.
> +    #[inline(never)]
> +    fn make_inner(dev: &driver::AsahiDevice) -> Result<Arc<UatInner>> {
> +        let handoff_rgn = Self::map_region(dev, c_str!("handoff"), HANDOFF_SIZE, false)?;
> +        let ttbs_rgn = Self::map_region(dev, c_str!("ttbs"), SLOTS_SIZE, false)?;
> +
> +        dev_info!(dev, "MMU: Initializing kernel page table\n");
> +
> +        let mut inner = UniqueArc::<UatInner>::try_new_uninit()?;
> +        let ptr = inner.as_mut_ptr();
> +
> +        Ok(unsafe {
> +            let handoff = &(handoff_rgn.map.as_ptr() as *mut Handoff).as_ref().unwrap();
> +
> +            for i in 0..UAT_NUM_CTX + 1 {
> +                addr_of_mut!((*ptr).handoff_flush[i])
> +                    .write(Mutex::new(HandoffFlush(&handoff.flush[i])));
> +            }
> +
> +            addr_of_mut!((*ptr).shared).write(Mutex::new(UatShared {
> +                handoff_rgn,
> +                ttbs_rgn,
> +            }));
> +
> +            inner.assume_init()
> +        }
> +        .into())
> +    }
> +
> +    /// Creates a new `Uat` instance given the relevant hardware config.
> +    #[inline(never)]
> +    pub(crate) fn new(dev: &driver::AsahiDevice, cfg: &'static hw::HwConfig) -> Result<Self> {
> +        dev_info!(dev, "MMU: Initializing...\n");
> +
> +        let inner = Self::make_inner(dev)?;
> +
> +        let pagetables_rgn = Self::map_region(dev, c_str!("pagetables"), PAGETABLES_SIZE, true)?;
> +
> +        dev_info!(dev, "MMU: Creating kernel page tables\n");
> +        let kernel_lower_vm = Vm::new(dev.clone(), inner.clone(), cfg, false, 1, 0)?;
> +        let kernel_vm = Vm::new(dev.clone(), inner.clone(), cfg, true, 0, 0)?;
> +
> +        dev_info!(dev, "MMU: Kernel page tables created\n");
> +
> +        let ttb0 = kernel_lower_vm.ttb();
> +        let ttb1 = kernel_vm.ttb();
> +
> +        let uat = Self {
> +            dev: dev.clone(),
> +            cfg,
> +            pagetables_rgn,
> +            kernel_vm,
> +            _kernel_lower_vm: kernel_lower_vm,
> +            inner,
> +            slots: slotalloc::SlotAllocator::new(UAT_USER_CTX as u32, (), |_inner, _slot| {
> +                SlotInner()
> +            })?,
> +        };
> +
> +        let inner = uat.inner.lock();
> +
> +        inner.handoff().init()?;
> +
> +        dev_info!(dev, "MMU: Initializing TTBs\n");
> +
> +        inner.handoff().lock();
> +
> +        let ttbs = inner.ttbs();
> +
> +        ttbs[0].ttb0.store(ttb0 | TTBR_VALID, Ordering::Relaxed);
> +        ttbs[0]
> +            .ttb1
> +            .store(uat.pagetables_rgn.base | TTBR_VALID, Ordering::Relaxed);
> +
> +        for ctx in &ttbs[1..] {
> +            ctx.ttb0.store(0, Ordering::Relaxed);
> +            ctx.ttb1.store(0, Ordering::Relaxed);
> +        }
> +
> +        inner.handoff().unlock();
> +
> +        core::mem::drop(inner);
> +
> +        uat.kpt0()[2].store(ttb1 | PTE_TABLE, Ordering::Relaxed);
> +
> +        dev_info!(dev, "MMU: initialized\n");
> +
> +        Ok(uat)
> +    }
> +}
> +
> +impl Drop for Uat {
> +    fn drop(&mut self) {
> +        // Unmap what we mapped
> +        self.kpt0()[2].store(0, Ordering::Relaxed);
> +
> +        // Make sure we flush the TLBs
> +        fence(Ordering::SeqCst);
> +        mem::tlbi_all();
> +        mem::sync();
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/object.rs b/drivers/gpu/drm/asahi/object.rs
> new file mode 100644
> index 000000000000..449899b88181
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/object.rs
> @@ -0,0 +1,704 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Asahi GPU object model
> +//!
> +//! The AGX GPU includes a coprocessor that uses a large number of shared memory structures to
> +//! communicate with the driver. These structures contain GPU VA pointers to each other, which are
> +//! directly dereferenced by the firmware and are expected to always be valid for the usage
> +//! lifetime of the containing struct (which is an implicit contract, not explicitly managed).
> +//! Any faults cause an unrecoverable firmware crash, requiring a full system reboot.
> +//!
> +//! In order to manage this complexity safely, we implement a GPU object model using Rust's type
> +//! system to enforce GPU object lifetime relationships. GPU objects represent an allocated piece
> +//! of memory of a given type, mapped to the GPU (and usually also the CPU). On the CPU side,
> +//! these objects are associated with a pure Rust structure that contains the objects it depends
> +//! on (or references to them). This allows us to map Rust lifetimes into the GPU object model
> +//! system. Then, GPU VA pointers also inherit those lifetimes, which means the Rust borrow checker
> +//! can ensure that all pointers are assigned an address that is guaranteed to outlive the GPU
> +//! object it points to.
> +//!
> +//! Since the firmware object model does have self-referencing pointers (and there is of course no
> +//! underlying revocability mechanism to make it safe), we must have an escape hatch. GPU pointers
> +//! can be weak pointers, which do not enforce lifetimes. In those cases, it is the user's
> +//! responsibility to ensure that lifetime requirements are met.
> +//!
> +//! In other words, the model is necessarily leaky and there is no way to fully map Rust safety to
> +//! GPU firmware object safety. The goal of the model is to make it easy to model the lifetimes of
> +//! GPU objects and have the compiler help in avoiding mistakes, rather than to guarantee safety
> +//! 100% of the time as would be the case for CPU-side Rust code.
> +
> +// TODO: There is a fundamental soundness issue with sharing memory with the GPU (that even affects
> +// C code too). Since the GPU is free to mutate that memory at any time, normal reference invariants
> +// cannot be enforced on the CPU side. For example, the compiler could perform an optimization that
> +// assumes that a given memory location does not change between two reads, and causes UB otherwise,
> +// and then the GPU could mutate that memory out from under the CPU.
> +//
> +// For cases where we *expect* this to happen, we use atomic types, which avoid this issue. However,
> +// doing so for every single field of every type is a non-starter. Right now, there seems to be no
> +// good solution for this that does not come with significant performance or ergonomics downsides.
> +//
> +// In *practice* we are almost always only writing GPU memory, and only reading from atomics, so the
> +// chances of this actually triggering UB (e.g. a security issue that can be triggered from the GPU
> +// side) due to a compiler optimization are very slim.
> +//
> +// Further discussion: https://github.com/rust-lang/unsafe-code-guidelines/issues/152
> +
> +use kernel::{error::code::*, prelude::*};
> +
> +use alloc::boxed::Box;
> +use core::fmt;
> +use core::fmt::Debug;
> +use core::fmt::Formatter;
> +use core::marker::PhantomData;
> +use core::mem::MaybeUninit;
> +use core::num::NonZeroU64;
> +use core::ops::{Deref, DerefMut, Index, IndexMut};
> +use core::{mem, ptr, slice};
> +
> +use crate::alloc::Allocation;
> +use crate::debug::*;
> +use crate::fw::types::Zeroed;
> +
> +const DEBUG_CLASS: DebugFlags = DebugFlags::Object;
> +
> +/// A GPU-side strong pointer, which is a 64-bit non-zero VA with an associated lifetime.
> +///
> +/// In rare cases these pointers are not aligned, so this is `packed(1)`.
> +#[repr(C, packed(1))]
> +pub(crate) struct GpuPointer<'a, T: ?Sized>(NonZeroU64, PhantomData<&'a T>);
> +
> +impl<'a, T: ?Sized> GpuPointer<'a, T> {
> +    /// Logical OR the pointer with an arbitrary `u64`. This is used when GPU struct fields contain
> +    /// misc flag fields in the upper bits. The lifetime is retained. This is GPU-unsafe in
> +    /// principle, but we assert that only non-implemented address bits are touched, which is safe
> +    /// for pointers used by the GPU (not by firmware).
> +    pub(crate) fn or(&self, other: u64) -> GpuPointer<'a, T> {
> +        // This will fail for kernel-half pointers, which should not be ORed.
> +        assert_eq!(self.0.get() & other, 0);
> +        // Assert that we only touch the high bits.
> +        assert_eq!(other & 0xffffffffff, 0);
> +        GpuPointer(self.0 | other, PhantomData)
> +    }
> +
> +    /// Add an arbitrary offset to the pointer. This is not safe (from the GPU perspective), and
> +    /// should only be used via the `inner_ptr` macro to get pointers to inner fields, hence we mark
> +    /// it `unsafe` to discourage direct use.
> +    // NOTE: The third argument is a type inference hack.
> +    pub(crate) unsafe fn offset<U>(&self, off: usize, _: *const U) -> GpuPointer<'a, U> {
> +        GpuPointer::<'a, U>(
> +            NonZeroU64::new(self.0.get() + (off as u64)).unwrap(),
> +            PhantomData,
> +        )
> +    }
> +}
> +
> +impl<'a, T: ?Sized> Debug for GpuPointer<'a, T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +        let val = self.0;
> +        f.write_fmt(format_args!("{:#x} ({})", val, core::any::type_name::<T>()))
> +    }
> +}
> +
> +/// Take a pointer to a sub-field within a structure pointed to by a GpuPointer, keeping the
> +/// lifetime.
> +#[macro_export]
> +macro_rules! inner_ptr {
> +    ($gpuva:expr, $($f:tt)*) => ({
> +        // This mirrors kernel::offset_of(), except we use type inference to avoid having to know
> +        // the type of the pointer explicitly.
> +        fn uninit_from<'a, T: GpuStruct>(_: GpuPointer<'a, T>) -> core::mem::MaybeUninit<T::Raw<'static>> {
> +            core::mem::MaybeUninit::uninit()
> +        }
> +        let tmp = uninit_from($gpuva);
> +        let outer = tmp.as_ptr();
> +        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
> +        // we don't actually read from `outer` (which would be UB) nor create an intermediate
> +        // reference.
> +        let p: *const _ = unsafe { core::ptr::addr_of!((*outer).$($f)*) };
> +        let inner = p as *const u8;
> +        // SAFETY: The two pointers are within the same allocation block.
> +        let off = unsafe { inner.offset_from(outer as *const u8) };
> +        // SAFETY: The resulting pointer is guaranteed to point to valid memory within the outer
> +        // object.
> +        unsafe { $gpuva.offset(off.try_into().unwrap(), p) }
> +    })
> +}
> +
> +/// A GPU-side weak pointer, which is a 64-bit non-zero VA with no lifetime.
> +///
> +/// In rare cases these pointers are not aligned, so this is `packed(1)`.
> +#[repr(C, packed(1))]
> +pub(crate) struct GpuWeakPointer<T: ?Sized>(NonZeroU64, PhantomData<*const T>);
> +
> +/// SAFETY: GPU weak pointers are always safe to share between threads.
> +unsafe impl<T: ?Sized> Send for GpuWeakPointer<T> {}
> +unsafe impl<T: ?Sized> Sync for GpuWeakPointer<T> {}
> +
> +// Weak pointers can be copied/cloned regardless of their target type.
> +impl<T: ?Sized> Copy for GpuWeakPointer<T> {}
> +
> +impl<T: ?Sized> Clone for GpuWeakPointer<T> {
> +    fn clone(&self) -> Self {
> +        *self
> +    }
> +}
> +
> +impl<T: ?Sized> GpuWeakPointer<T> {
> +    /// Add an arbitrary offset to the pointer. This is not safe (from the GPU perspective), and
> +    /// should only be used via the `inner_ptr` macro to get pointers to inner fields, hence we mark
> +    /// it `unsafe` to discourage direct use.
> +    // NOTE: The third argument is a type inference hack.
> +    pub(crate) unsafe fn offset<U>(&self, off: usize, _: *const U) -> GpuWeakPointer<U> {
> +        GpuWeakPointer::<U>(
> +            NonZeroU64::new(self.0.get() + (off as u64)).unwrap(),
> +            PhantomData,
> +        )
> +    }
> +
> +    /// Upgrade a weak pointer into a strong pointer. This is not considered safe from the GPU
> +    /// perspective.
> +    pub(crate) unsafe fn upgrade<'a>(&self) -> GpuPointer<'a, T> {
> +        GpuPointer(self.0, PhantomData)
> +    }
> +}
> +
> +impl<T: ?Sized> Debug for GpuWeakPointer<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +        let val = self.0;
> +        f.write_fmt(format_args!("{:#x} ({})", val, core::any::type_name::<T>()))
> +    }
> +}
> +
> +/// Take a pointer to a sub-field within a structure pointed to by a GpuWeakPointer.
> +#[macro_export]
> +macro_rules! inner_weak_ptr {
> +    ($gpuva:expr, $($f:tt)*) => ({
> +        // See inner_ptr()
> +        fn uninit_from<T: GpuStruct>(_: GpuWeakPointer<T>) -> core::mem::MaybeUninit<T::Raw<'static>> {
> +            core::mem::MaybeUninit::uninit()
> +        }
> +        let tmp = uninit_from($gpuva);
> +        let outer = tmp.as_ptr();
> +        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
> +        // we don't actually read from `outer` (which would be UB) nor create an intermediate
> +        // reference.
> +        let p: *const _ = unsafe { core::ptr::addr_of!((*outer).$($f)*) };
> +        let inner = p as *const u8;
> +        // SAFETY: The two pointers are within the same allocation block.
> +        let off = unsafe { inner.offset_from(outer as *const u8) };
> +        // SAFETY: The resulting pointer is guaranteed to point to valid memory within the outer
> +        // object.
> +        unsafe { $gpuva.offset(off.try_into().unwrap(), p) }
> +    })
> +}
> +
> +/// Types that implement this trait represent a GPU structure from the CPU side.
> +///
> +/// The `Raw` type represents the actual raw structure definition on the GPU side.
> +///
> +/// Types implementing [`GpuStruct`] must have fields owning any objects (or strong references
> +/// to them) that GPU pointers in the `Raw` structure point to. This mechanism is used to enforce
> +/// lifetimes.
> +pub(crate) trait GpuStruct: 'static {
> +    /// The type of the GPU-side structure definition representing the firmware struct layout.
> +    type Raw<'a>;
> +}
> +
> +/// An instance of a GPU object in memory.
> +///
> +/// # Invariants
> +/// `raw` must point to a valid mapping of the `T::Raw` type associated with the `alloc` allocation.
> +/// `gpu_ptr` must be the GPU address of the same object.
> +pub(crate) struct GpuObject<T: GpuStruct, U: Allocation<T>> {
> +    raw: *mut T::Raw<'static>,
> +    alloc: U,
> +    gpu_ptr: GpuWeakPointer<T>,
> +    inner: Box<T>,
> +}
> +
> +impl<T: GpuStruct, U: Allocation<T>> GpuObject<T, U> {
> +    /// Create a new GpuObject given an allocator and the inner data (a type implementing
> +    /// GpuStruct).
> +    ///
> +    /// The caller passes a closure that constructs the `T::Raw` type given a reference to the
> +    /// `GpuStruct`. This is the mechanism used to enforce lifetimes.
> +    pub(crate) fn new(
> +        alloc: U,
> +        inner: T,
> +        callback: impl for<'a> FnOnce(&'a T) -> T::Raw<'a>,
> +    ) -> Result<Self> {
> +        let size = mem::size_of::<T::Raw<'static>>();
> +        if size > 0x1000 {
> +            dev_crit!(
> +                alloc.device(),
> +                "Allocating {} of size {:#x}, with new, please use new_boxed!\n",
> +                core::any::type_name::<T>(),
> +                size
> +            );
> +        }
> +        if alloc.size() < size {
> +            return Err(ENOMEM);
> +        }
> +        let gpu_ptr =
> +            GpuWeakPointer::<T>(NonZeroU64::new(alloc.gpu_ptr()).ok_or(EINVAL)?, PhantomData);
> +        mod_dev_dbg!(
> +            alloc.device(),
> +            "Allocating {} @ {:#x}\n",
> +            core::any::type_name::<T>(),
> +            alloc.gpu_ptr()
> +        );
> +        let p = alloc.ptr().ok_or(EINVAL)?.as_ptr() as *mut T::Raw<'static>;
> +        let mut raw = callback(&inner);
> +        // SAFETY: `p` is guaranteed to be valid per the Allocation invariant, and the type is
> +        // identical to the type of `raw` other than the lifetime.
> +        unsafe { p.copy_from(&mut raw as *mut _ as *mut u8 as *mut _, 1) };
> +        mem::forget(raw);
> +        Ok(Self {
> +            raw: p,
> +            gpu_ptr,
> +            alloc,
> +            inner: Box::try_new(inner)?,
> +        })
> +    }
> +
> +    /// Create a new GpuObject given an allocator and the boxed inner data (a type implementing
> +    /// GpuStruct).
> +    ///
> +    /// The caller passes a closure that initializes the `T::Raw` type given a reference to the
> +    /// `GpuStruct` and a `MaybeUninit<T::Raw>`. This is intended to be used with the place!()
> +    /// macro to avoid constructing the whole `T::Raw` object on the stack.
> +    pub(crate) fn new_boxed(
> +        alloc: U,
> +        inner: Box<T>,
> +        callback: impl for<'a> FnOnce(
> +            &'a T,
> +            &'a mut MaybeUninit<T::Raw<'a>>,
> +        ) -> Result<&'a mut T::Raw<'a>>,
> +    ) -> Result<Self> {
> +        if alloc.size() < mem::size_of::<T::Raw<'static>>() {
> +            return Err(ENOMEM);
> +        }
> +        let gpu_ptr =
> +            GpuWeakPointer::<T>(NonZeroU64::new(alloc.gpu_ptr()).ok_or(EINVAL)?, PhantomData);
> +        mod_dev_dbg!(
> +            alloc.device(),
> +            "Allocating {} @ {:#x}\n",
> +            core::any::type_name::<T>(),
> +            alloc.gpu_ptr()
> +        );
> +        let p = alloc.ptr().ok_or(EINVAL)?.as_ptr() as *mut MaybeUninit<T::Raw<'_>>;
> +        // SAFETY: `p` is guaranteed to be valid per the Allocation invariant.
> +        let raw = callback(&inner, unsafe { &mut *p })?;
> +        if p as *mut T::Raw<'_> != raw as *mut _ {
> +            dev_err!(
> +                alloc.device(),
> +                "Allocation callback returned a mismatched reference ({})\n",
> +                core::any::type_name::<T>(),
> +            );
> +            return Err(EINVAL);
> +        }
> +        Ok(Self {
> +            raw: p as *mut u8 as *mut T::Raw<'static>,
> +            gpu_ptr,
> +            alloc,
> +            inner,
> +        })
> +    }
> +
> +    /// Create a new GpuObject given an allocator and the inner data (a type implementing
> +    /// GpuStruct).
> +    ///
> +    /// The caller passes a closure that initializes the `T::Raw` type given a reference to the
> +    /// `GpuStruct` and a `MaybeUninit<T::Raw>`. This is intended to be used with the place!()
> +    /// macro to avoid constructing the whole `T::Raw` object on the stack.
> +    pub(crate) fn new_inplace(
> +        alloc: U,
> +        inner: T,
> +        callback: impl for<'a> FnOnce(
> +            &'a T,
> +            &'a mut MaybeUninit<T::Raw<'a>>,
> +        ) -> Result<&'a mut T::Raw<'a>>,
> +    ) -> Result<Self> {
> +        GpuObject::<T, U>::new_boxed(alloc, Box::try_new(inner)?, callback)
> +    }
> +
> +    /// Create a new GpuObject given an allocator, with callback-based initialization.
> +    ///
> +    /// This is used when the construction of the `T` type requires knowing the GPU VA address of
> +    /// the structure that is being constructed ahead of time. The first callback constructs a
> +    /// `Box<T>` given the pointer to the about-to-be-initialized GPU structure, and the second
> +    /// callback initializes that structure as in `new_boxed`.
> +    pub(crate) fn new_prealloc(
> +        alloc: U,
> +        inner_cb: impl FnOnce(GpuWeakPointer<T>) -> Result<Box<T>>,
> +        raw_cb: impl for<'a> FnOnce(
> +            &'a T,
> +            &'a mut MaybeUninit<T::Raw<'a>>,
> +        ) -> Result<&'a mut T::Raw<'a>>,
> +    ) -> Result<Self> {
> +        if alloc.size() < mem::size_of::<T::Raw<'static>>() {
> +            return Err(ENOMEM);
> +        }
> +        let gpu_ptr =
> +            GpuWeakPointer::<T>(NonZeroU64::new(alloc.gpu_ptr()).ok_or(EINVAL)?, PhantomData);
> +        mod_dev_dbg!(
> +            alloc.device(),
> +            "Allocating {} @ {:#x}\n",
> +            core::any::type_name::<T>(),
> +            alloc.gpu_ptr()
> +        );
> +        let inner = inner_cb(gpu_ptr)?;
> +        let p = alloc.ptr().ok_or(EINVAL)?.as_ptr() as *mut MaybeUninit<T::Raw<'_>>;
> +        // SAFETY: `p` is guaranteed to be valid per the Allocation invariant.
> +        let raw = raw_cb(&*inner, unsafe { &mut *p })?;
> +        if p as *mut T::Raw<'_> != raw as *mut _ {
> +            dev_err!(
> +                alloc.device(),
> +                "Allocation callback returned a mismatched reference ({})\n",
> +                core::any::type_name::<T>(),
> +            );
> +            return Err(EINVAL);
> +        }
> +        Ok(Self {
> +            raw: p as *mut u8 as *mut T::Raw<'static>,
> +            gpu_ptr,
> +            alloc,
> +            inner,
> +        })
> +    }
> +
> +    /// Returns the GPU VA of this object (as a raw [`NonZeroU64`])
> +    pub(crate) fn gpu_va(&self) -> NonZeroU64 {
> +        self.gpu_ptr.0
> +    }
> +
> +    /// Returns a strong GPU pointer to this object, with a lifetime.
> +    pub(crate) fn gpu_pointer(&self) -> GpuPointer<'_, T> {
> +        GpuPointer(self.gpu_ptr.0, PhantomData)
> +    }
> +
> +    /// Returns a weak GPU pointer to this object, with no lifetime.
> +    pub(crate) fn weak_pointer(&self) -> GpuWeakPointer<T> {
> +        GpuWeakPointer(self.gpu_ptr.0, PhantomData)
> +    }
> +
> +    /// Perform a mutation to the inner `Raw` data given a user-supplied callback.
> +    ///
> +    /// The callback gets a mutable reference to the `GpuStruct` type.
> +    pub(crate) fn with_mut<RetVal>(
> +        &mut self,
> +        callback: impl for<'a> FnOnce(&'a mut <T as GpuStruct>::Raw<'a>, &'a mut T) -> RetVal,
> +    ) -> RetVal {
> +        // SAFETY: `self.raw` is valid per the type invariant, and the second half is just
> +        // converting lifetimes.
> +        unsafe { callback(&mut *self.raw, &mut *(&mut *self.inner as *mut _)) }
> +    }
> +
> +    /// Access the inner `Raw` data given a user-supplied callback.
> +    ///
> +    /// The callback gets a reference to the `GpuStruct` type.
> +    pub(crate) fn with<RetVal>(
> +        &self,
> +        callback: impl for<'a> FnOnce(&'a <T as GpuStruct>::Raw<'a>, &'a T) -> RetVal,
> +    ) -> RetVal {
> +        // SAFETY: `self.raw` is valid per the type invariant, and the second half is just
> +        // converting lifetimes.
> +        unsafe { callback(&*self.raw, &*(&*self.inner as *const _)) }
> +    }
> +}
> +
> +impl<T: GpuStruct, U: Allocation<T>> Deref for GpuObject<T, U> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.inner
> +    }
> +}
> +
> +impl<T: GpuStruct, U: Allocation<T>> DerefMut for GpuObject<T, U> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.inner
> +    }
> +}
> +
> +impl<T: GpuStruct + Debug, U: Allocation<T>> Debug for GpuObject<T, U>
> +where
> +    <T as GpuStruct>::Raw<'static>: Debug,
> +{
> +    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +        f.debug_struct(core::any::type_name::<T>())
> +            // SAFETY: `self.raw` is valid per the type invariant.
> +            .field("raw", &format_args!("{:#X?}", unsafe { &*self.raw }))
> +            .field("inner", &format_args!("{:#X?}", &self.inner))
> +            .field("alloc", &format_args!("{:?}", &self.alloc))
> +            .finish()
> +    }
> +}
> +
> +impl<T: GpuStruct + Default, U: Allocation<T>> GpuObject<T, U>
> +where
> +    for<'a> <T as GpuStruct>::Raw<'a>: Default + Zeroed,
> +{
> +    /// Create a new GpuObject with default data. `T` must implement `Default` and `T::Raw` must
> +    /// implement `Zeroed`, since the GPU-side memory is initialized by zeroing.
> +    pub(crate) fn new_default(alloc: U) -> Result<Self> {
> +        GpuObject::<T, U>::new_inplace(alloc, Default::default(), |_inner, raw| {
> +            // SAFETY: `raw` is valid here, and `T::Raw` implements `Zeroed`.
> +            Ok(unsafe {
> +                ptr::write_bytes(raw, 0, 1);
> +                (*raw).assume_init_mut()
> +            })
> +        })
> +    }
> +}
> +
> +impl<T: GpuStruct, U: Allocation<T>> Drop for GpuObject<T, U> {
> +    fn drop(&mut self) {
> +        mod_dev_dbg!(
> +            self.alloc.device(),
> +            "Dropping {} @ {:?}\n",
> +            core::any::type_name::<T>(),
> +            self.gpu_pointer()
> +        );
> +    }
> +}
> +
> +// SAFETY: GpuObjects are Send as long as the GpuStruct itself is Send
> +unsafe impl<T: GpuStruct + Send, U: Allocation<T>> Send for GpuObject<T, U> {}
> +// SAFETY: GpuObjects are Send as long as the GpuStruct itself is Send
> +unsafe impl<T: GpuStruct + Sync, U: Allocation<T>> Sync for GpuObject<T, U> {}
> +
> +/// Trait used to erase the type of a GpuObject, used when we need to keep a list of heterogenous
> +/// objects around.
> +pub(crate) trait OpaqueGpuObject: Send + Sync {
> +    fn gpu_va(&self) -> NonZeroU64;
> +}
> +
> +impl<T: GpuStruct + Sync + Send, U: Allocation<T>> OpaqueGpuObject for GpuObject<T, U> {
> +    fn gpu_va(&self) -> NonZeroU64 {
> +        Self::gpu_va(self)
> +    }
> +}
> +
> +/// An array of raw GPU objects that is only accessible to the GPU (no CPU-side mapping required).
> +///
> +/// This must necessarily be uninitialized as far as the GPU is concerned, so it cannot be used
> +/// when initialization is required.
> +///
> +/// # Invariants
> +///
> +/// `alloc` is valid and at least as large as `len` times the size of one `T`.
> +/// `gpu_ptr` is valid and points to the allocation start.
> +pub(crate) struct GpuOnlyArray<T, U: Allocation<T>> {
> +    len: usize,
> +    alloc: U,
> +    gpu_ptr: NonZeroU64,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T, U: Allocation<T>> GpuOnlyArray<T, U> {
> +    /// Allocate a new GPU-only array with the given length.
> +    pub(crate) fn new(alloc: U, count: usize) -> Result<GpuOnlyArray<T, U>> {
> +        let bytes = count * mem::size_of::<T>();
> +        let gpu_ptr = NonZeroU64::new(alloc.gpu_ptr()).ok_or(EINVAL)?;
> +        if alloc.size() < bytes {
> +            return Err(ENOMEM);
> +        }
> +        Ok(Self {
> +            len: count,
> +            alloc,
> +            gpu_ptr,
> +            _p: PhantomData,
> +        })
> +    }
> +
> +    /// Returns the GPU VA of this arraw (as a raw [`NonZeroU64`])
> +    pub(crate) fn gpu_va(&self) -> NonZeroU64 {
> +        self.gpu_ptr
> +    }
> +
> +    /// Returns a strong GPU pointer to this array, with a lifetime.
> +    pub(crate) fn gpu_pointer(&self) -> GpuPointer<'_, &'_ [T]> {
> +        GpuPointer(self.gpu_ptr, PhantomData)
> +    }
> +
> +    /// Returns a weak GPU pointer to this array, with no lifetime.
> +    pub(crate) fn weak_pointer(&self) -> GpuWeakPointer<[T]> {
> +        GpuWeakPointer(self.gpu_ptr, PhantomData)
> +    }
> +
> +    /// Returns a pointer to an offset within the array (as a subslice).
> +    pub(crate) fn gpu_offset_pointer(&self, offset: usize) -> GpuPointer<'_, &'_ [T]> {
> +        if offset > self.len {
> +            panic!("Index {} out of bounds (len: {})", offset, self.len);
> +        }
> +        GpuPointer(
> +            NonZeroU64::new(self.gpu_ptr.get() + (offset * mem::size_of::<T>()) as u64).unwrap(),
> +            PhantomData,
> +        )
> +    }
> +
> +    /* Not used yet
> +    /// Returns a weak pointer to an offset within the array (as a subslice).
> +    pub(crate) fn weak_offset_pointer(&self, offset: usize) -> GpuWeakPointer<[T]> {
> +        if offset > self.len {
> +            panic!("Index {} out of bounds (len: {})", offset, self.len);
> +        }
> +        GpuWeakPointer(
> +            NonZeroU64::new(self.gpu_ptr.get() + (offset * mem::size_of::<T>()) as u64).unwrap(),
> +            PhantomData,
> +        )
> +    }
> +
> +    /// Returns a pointer to an element within the array.
> +    pub(crate) fn gpu_item_pointer(&self, index: usize) -> GpuPointer<'_, &'_ T> {
> +        if index >= self.len {
> +            panic!("Index {} out of bounds (len: {})", index, self.len);
> +        }
> +        GpuPointer(
> +            NonZeroU64::new(self.gpu_ptr.get() + (index * mem::size_of::<T>()) as u64).unwrap(),
> +            PhantomData,
> +        )
> +    }
> +    */
> +
> +    /// Returns a weak pointer to an element within the array.
> +    pub(crate) fn weak_item_pointer(&self, index: usize) -> GpuWeakPointer<T> {
> +        if index >= self.len {
> +            panic!("Index {} out of bounds (len: {})", index, self.len);
> +        }
> +        GpuWeakPointer(
> +            NonZeroU64::new(self.gpu_ptr.get() + (index * mem::size_of::<T>()) as u64).unwrap(),
> +            PhantomData,
> +        )
> +    }
> +
> +    /// Returns the length of the array.
> +    pub(crate) fn len(&self) -> usize {
> +        self.len
> +    }
> +}
> +
> +impl<T: Debug, U: Allocation<T>> Debug for GpuOnlyArray<T, U> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +        f.debug_struct(core::any::type_name::<T>())
> +            .field("len", &format_args!("{:#X?}", self.len()))
> +            .finish()
> +    }
> +}
> +
> +impl<T, U: Allocation<T>> Drop for GpuOnlyArray<T, U> {
> +    fn drop(&mut self) {
> +        mod_dev_dbg!(
> +            self.alloc.device(),
> +            "Dropping {} @ {:?}\n",
> +            core::any::type_name::<T>(),
> +            self.gpu_pointer()
> +        );
> +    }
> +}
> +
> +/// An array of raw GPU objects that is also CPU-accessible.
> +///
> +/// # Invariants
> +///
> +/// `raw` is valid and points to the CPU-side view of the array (which must have one).
> +pub(crate) struct GpuArray<T, U: Allocation<T>> {
> +    raw: *mut T,
> +    array: GpuOnlyArray<T, U>,
> +}
> +
> +/* Not used yet
> +impl<T: Copy, U: Allocation<T>> GpuArray<T, U> {
> +    /// Allocate a new GPU array, copying the contents from a slice.
> +    pub(crate) fn new(alloc: U, data: &[T]) -> Result<GpuArray<T, U>> {
> +        let p = alloc.ptr().ok_or(EINVAL)?.as_ptr();
> +        let inner = GpuOnlyArray::new(alloc, data.len())?;
> +        // SAFETY: `p` is valid per the Allocation type invariant, and GpuOnlyArray guarantees
> +        // that its size is at least as large as `data.len()`.
> +        unsafe { ptr::copy(data.as_ptr(), p, data.len()) };
> +        Ok(Self {
> +            raw: p,
> +            array: inner,
> +        })
> +    }
> +}
> +*/
> +
> +impl<T: Default, U: Allocation<T>> GpuArray<T, U> {
> +    /// Allocate a new GPU array, initializing each element to its default.
> +    pub(crate) fn empty(alloc: U, count: usize) -> Result<GpuArray<T, U>> {
> +        let p = alloc.ptr().ok_or(EINVAL)?.as_ptr() as *mut T;
> +        let inner = GpuOnlyArray::new(alloc, count)?;
> +        let mut pi = p;
> +        for _i in 0..count {
> +            // SAFETY: `pi` is valid per the Allocation type invariant, and GpuOnlyArray guarantees
> +            // that it can never iterate beyond the buffer length.
> +            unsafe {
> +                pi.write(Default::default());
> +                pi = pi.add(1);
> +            }
> +        }
> +        Ok(Self {
> +            raw: p,
> +            array: inner,
> +        })
> +    }
> +}
> +
> +impl<T, U: Allocation<T>> GpuArray<T, U> {
> +    /// Get a slice view of the array contents.
> +    pub(crate) fn as_slice(&self) -> &[T] {
> +        // SAFETY: self.raw / self.len are valid per the type invariant
> +        unsafe { slice::from_raw_parts(self.raw, self.len) }
> +    }
> +
> +    /// Get a mutable slice view of the array contents.
> +    pub(crate) fn as_mut_slice(&mut self) -> &mut [T] {
> +        // SAFETY: self.raw / self.len are valid per the type invariant
> +        unsafe { slice::from_raw_parts_mut(self.raw, self.len) }
> +    }
> +}
> +
> +impl<T, U: Allocation<T>> Deref for GpuArray<T, U> {
> +    type Target = GpuOnlyArray<T, U>;
> +
> +    fn deref(&self) -> &GpuOnlyArray<T, U> {
> +        &self.array
> +    }
> +}
> +
> +impl<T, U: Allocation<T>> Index<usize> for GpuArray<T, U> {
> +    type Output = T;
> +
> +    fn index(&self, index: usize) -> &T {
> +        if index >= self.len {
> +            panic!("Index {} out of bounds (len: {})", index, self.len);
> +        }
> +        // SAFETY: This is bounds checked above
> +        unsafe { &*(self.raw.add(index)) }
> +    }
> +}
> +
> +impl<T, U: Allocation<T>> IndexMut<usize> for GpuArray<T, U> {
> +    fn index_mut(&mut self, index: usize) -> &mut T {
> +        if index >= self.len {
> +            panic!("Index {} out of bounds (len: {})", index, self.len);
> +        }
> +        // SAFETY: This is bounds checked above
> +        unsafe { &mut *(self.raw.add(index)) }
> +    }
> +}
> +
> +// SAFETY: GpuArray are Send as long as the contained type itself is Send
> +unsafe impl<T: Send, U: Allocation<T>> Send for GpuArray<T, U> {}
> +// SAFETY: GpuArray are Sync as long as the contained type itself is Sync
> +unsafe impl<T: Sync, U: Allocation<T>> Sync for GpuArray<T, U> {}
> +
> +impl<T: Debug, U: Allocation<T>> Debug for GpuArray<T, U> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
> +        f.debug_struct(core::any::type_name::<T>())
> +            .field("array", &format_args!("{:#X?}", self.as_slice()))
> +            .finish()
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/place.rs b/drivers/gpu/drm/asahi/place.rs
> new file mode 100644
> index 000000000000..40c51f4fab8d
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/place.rs
> @@ -0,0 +1,343 @@
> +// SPDX-License-Identifier: Apache-2.0 OR MIT
> +
> +//! "Placement new" macro
> +//!
> +//! This cursed abomination of a declarative macro is used to emulate a "placement new" feature,
> +//! which allows initializing objects directly in a user-provided memory region without first
> +//! going through the stack.
> +//!
> +//! This driver needs to manage several large GPU objects of a fixed layout. Linux kernel stacks are
> +//! very small, so it is impossible to create these objects on the stack. While the compiler can
> +//! sometimes optimize away the stack copy and directly instantiate in target memory, this is not
> +//! guaranteed and not reliable. Therefore, we need some mechanism to ergonomically initialize
> +//! complex structures directly in a pre-allocated piece of memory.
> +//!
> +//! This issue also affects some driver-internal structs which are large/complex enough to overflow
> +//! the stack. While this can be solved by breaking them up into pieces and using `Box` more
> +//! liberally, this has performance implications and still isn't very nice. This macro can also be
> +//! used to solve this issue.
> +//!
> +//! # Further reading
> +//! https://github.com/rust-lang/rust/issues/27779#issuecomment-378416911
> +//! https://internals.rust-lang.org/t/removal-of-all-unstable-placement-features/7223
> +
> +/// Initialize a `MaybeUninit` in-place, without constructing the value on the stack first.
> +///
> +/// This macro is analogous to `MaybeUninit::write()`. In other words,
> +/// `place!(foo, bar)` is equivalent to `MaybeUninit::write(foo, bar)`, except that `bar` is not
> +/// constructed first, but rather its fields (if it is a structure constructor) are copied one by
> +/// one into the correct location in the `MaybeUninit`.
> +///
> +/// The macro supports most Rust initialization syntax including type paths, generic arguments,
> +/// and nested structures. Nested structures are themselves initialized in-place field by field.
> +/// `..Default::default()` is supported, but this macro converts it to `..Zeroed::zeroed()`, as it
> +/// initializes those structs by zero-initializing the underlying memory. Usage of
> +/// `..Default::default()` with a type not implementing `Zeroed` will result in a compile error.
> +///
> +/// Usage:
> +/// ```
> +/// let mut buf = MaybeUninit::uninit();
> +/// let mut_ref = place!(&mut buf, MyStruct {
> +///     b: true,
> +///     s: String::from("works"),
> +///     i: str::parse::<i32>("123").unwrap(),
> +///     v: vec![String::from("works")],
> +///     x: foo::MyOtherCoolStruct {
> +///         a: false,
> +///         b: String::from("Hello, world!"),
> +///     },
> +///     y: foo::MyOtherCoolStruct {
> +///         a: false,
> +///         b: String::from("Hello, world!"),
> +///     },
> +///     z: foo::MyCoolGenericStruct::<bool, String> {
> +///         a: false,
> +///         b: String::from("Hello, world!"),
> +///     },
> +/// };
> +/// // `mut_ref` is now a mutable reference to the `buf`, which is now safely initialized.
> +/// ```
> +///
> +/// Based on https://crates.io/crates/place by DianaNites, with contributions by Joshua Barretto.
> +#[macro_export]
> +macro_rules! place {
> +    // Top-level struct
> +    (@STRUCT $ptr:ident, _TOP, $typ:path, {$($typ_init:tt)*} { $($fields:tt)* }) => {{
> +        place!(@STRUCT_ZERO $ptr, {$($typ_init)*} { $($fields)* });
> +        place!(@STRUCT_CHECK $ptr, {$($typ_init)*} { $($fields)* } {
> +            place!(@FIELDS $ptr, $($fields)*);
> +        });
> +    }};
> +    // Nested structure
> +    (@STRUCT $ptr:ident, $f_struct:ident, $typ:path, {$($typ_init:tt)*} { $($fields:tt)* }) => {{
> +        use core::ptr::addr_of_mut;
> +        let buf = unsafe { addr_of_mut!((*$ptr).$f_struct) };
> +        place!(@STRUCT_ZERO buf, {$($typ_init)*} { $($fields)* });
> +        place!(@STRUCT_CHECK $ptr, {$($typ_init)*} { $($fields)* } {
> +            place!(@FIELDS buf, $($fields)*);
> +        });
> +    }};
> +
> +    // Zero-initialize structure if the initializer ends in ..default::Default()
> +    (@STRUCT_ZERO $ptr:ident, {$($typ_init:tt)*} { $($f:ident $(: $v:expr)?),* $(,)? }) => {};
> +    (@STRUCT_ZERO $ptr:ident, {$($typ_init:tt)*} { $($($f:ident $(: $v:expr)?),*,)? ..Default::default() }) => {{
> +        // Check that the structure actually implements Zeroed
> +        const _: () = {
> +            fn _check_default() {
> +                let _ = $($typ_init)* {
> +                    ..Zeroed::zeroed()
> +                };
> +            }
> +        };
> +        use core::ptr;
> +        unsafe { ptr::write_bytes($ptr, 0, 1) };
> +
> +    }};
> +
> +    // Check that all fields are specified
> +    (@STRUCT_CHECK $ptr:ident, {$($typ_init:tt)*} { $($($f:ident $(: $v:expr)?),*,)? ..Default::default() } {$($body:tt)*}) => {
> +        if false {
> +            #[allow(clippy::redundant_field_names)]
> +            let _x = $($typ_init)* {
> +                $($(
> +                    $f $(: $v)?
> +                ),*
> +                ,)?
> +                ..Zeroed::zeroed()
> +            };
> +        } else {
> +            {$($body)*}
> +        }
> +    };
> +    (@STRUCT_CHECK $ptr:ident, {$($typ_init:tt)*} { $($f:ident $(: $v:expr)?),* $(,)? } {$($body:tt)*}) => {
> +        if false {
> +            #[allow(clippy::redundant_field_names)]
> +            let _x = $($typ_init)* {
> +                $(
> +                    $f $(: $v)?
> +                ),*
> +            };
> +        } else {
> +            {$($body)*}
> +        }
> +    };
> +    // Top-level scalar
> +    (@SCALAR $ptr:ident, _TOP, $val:expr) => {
> +        let tmp = $val;
> +        unsafe { $ptr.write(tmp); }
> +    };
> +    // Regular field
> +    (@SCALAR $ptr:ident, $f:ident, $val:expr) => {{
> +        use core::ptr::addr_of_mut;
> +        let tmp = $val;
> +        unsafe { addr_of_mut!((*$ptr).$f).write(tmp); }
> +    }};
> +    // Type-like name followed by braces is a nested structure
> +    (@PARTIAL $ptr:ident, $f:ident, {$($head:tt)*}, {{ $($fields:tt)* } $($tail:tt)*}) => {
> +        place!(@STRUCT $ptr, $f, $($head)*, {$($head)*} { $($fields)* });
> +        place!(@FIELDS $ptr $($tail)*)
> +    };
> +    // Type-like name followed by ::ident, append to head
> +    (@PARTIAL $ptr:ident, $f:ident, {$($head:tt)*}, {::$id:ident $($tail:tt)*}) => {
> +        place!(@PARTIAL $ptr, $f, {$($head)* :: $id}, {$($tail)*});
> +    };
> +    // Type-like name followed by ::<args>, append to head
> +    (@PARTIAL $ptr:ident, $f:ident, {$($head:tt)*}, {::<$($gen:ty),*> $($tail:tt)*}) => {
> +        place!(@PARTIAL $ptr, $f, {$($head)* :: <$($gen),*>}, {$($tail)*});
> +    };
> +    // Type-like name followed by ::<'lifetime>, append to head
> +    (@PARTIAL $ptr:ident, $f:ident, {$($head:tt)*}, {::<$li:lifetime> $($tail:tt)*}) => {
> +        place!(@PARTIAL $ptr, $f, {$($head)* :: <$li>}, {$($tail)*});
> +    };
> +    // Anything else, parse it as an expression
> +    (@PARTIAL $ptr:ident, $f:ident, {$($head:tt)*}, {$($tail:tt)*}) => {
> +        place!(@EXPR $ptr, $f, $($head)* $($tail)*)
> +    };
> +    // Expression followed by more fields
> +    (@EXPR $ptr:ident, $f:ident, $val:expr, $($tail:tt)*) => {
> +        place!(@SCALAR $ptr, $f, $val);
> +        place!(@FIELDS $ptr, $($tail)*)
> +    };
> +    // Last field expression, without a trailing comma
> +    (@EXPR $ptr:ident, $f:ident, $val:expr) => {
> +        place!(@SCALAR $ptr, $f, $val);
> +    };
> +    // Field with a value starting with an ident, start incremental type parsing
> +    (@FIELDS $ptr:ident, $f:ident : $id:ident $($tail:tt)*) => {
> +        place!(@PARTIAL $ptr, $f, {$id}, {$($tail)*});
> +    };
> +    // Same, but starting with ::ident
> +    (@FIELDS $ptr:ident, $f:ident : ::$id:ident $($tail:tt)*) => {
> +        place!(@PARTIAL $ptr, $f, {::$id}, {$($tail)*});
> +    };
> +    // Otherwise, parse it as an expression
> +    (@FIELDS $ptr:ident, $f:ident : $($tail:tt)*) => {
> +        place!(@EXPR $ptr, $f, $($tail)*)
> +    };
> +    // Default terminating case
> +    (@FIELDS $ptr:ident, ..Default::default() ) => {};
> +    // Terminating case
> +    (@FIELDS $ptr:ident $(,)? ) => {};
> +    (
> +        $buf:expr,
> +        $($val:tt)*
> +    ) => {{
> +        use core::mem::MaybeUninit;
> +        // Ensures types are correct
> +        let obj: &mut MaybeUninit<_> = $buf;
> +        let top_ptr = obj.as_mut_ptr();
> +        place!(@FIELDS top_ptr, _TOP: $($val)*);
> +        // SAFETY: All fields have been initialized above
> +        // The compiler ensures that all fields were used, all types were correct,
> +        // and that size and alignment are correct.
> +        unsafe { obj.assume_init_mut() }
> +    }};
> +}
> +
> +/// Helper macro to get the struct type part of a struct initialization expression.
> +#[macro_export]
> +#[doc(hidden)]
> +macro_rules! get_type {
> +    ($t:ty { $($val:tt)* }) => {
> +        $t
> +    };
> +}
> +
> +/// Like `Box::try_new(...)`, but with in-place initialization.
> +#[macro_export]
> +macro_rules! box_in_place {
> +    ($($val:tt)*) => {{
> +        use $crate::place;
> +        let b = Box::<$crate::get_type!($($val)*)>::try_new_uninit();
> +        match b {
> +            Ok(mut p) => {
> +                place!((&mut *p), $($val)*);
> +                Ok(unsafe { p.assume_init() })
> +            }
> +            Err(e) => Err(e)
> +        }
> +    }};
> +}
> +
> +// TODO: figure out how to make this run
> +#[cfg(test)]
> +mod tests {
> +    use super::*;
> +    use core::mem::MaybeUninit;
> +
> +    #[derive(Debug, PartialEq)]
> +    struct MyCoolStruct {
> +        b: bool,
> +        s: String,
> +        i: i32,
> +        v: Vec<String>,
> +        x: MyOtherCoolStruct,
> +        y: MyOtherCoolStruct,
> +        z: foo::MyCoolGenericStruct<bool, String>,
> +    }
> +
> +    #[derive(Debug, PartialEq)]
> +    struct MyDefaultStruct {
> +        b: bool,
> +        i: i32,
> +        j: i16,
> +    }
> +    default_zeroed!(MyDefaultStruct);
> +
> +    mod foo {
> +        #[derive(Debug, PartialEq)]
> +        pub struct MyOtherCoolStruct {
> +            pub a: bool,
> +            pub b: String,
> +        }
> +        #[derive(Debug, PartialEq)]
> +        pub struct MyCoolGenericStruct<T, U> {
> +            pub a: T,
> +            pub b: U,
> +        }
> +    }
> +
> +    use foo::MyOtherCoolStruct;
> +
> +    #[test]
> +    fn test_initialized() {
> +        let mut buf: MaybeUninit<MyCoolStruct> = MaybeUninit::uninit();
> +
> +        let x: &mut MyCoolStruct = place!(
> +            &mut buf,
> +            MyCoolStruct {
> +                b: true,
> +                s: String::from("works"),
> +                i: str::parse::<i32>("123").unwrap(),
> +                v: vec![String::from("works")],
> +                x: MyOtherCoolStruct {
> +                    a: false,
> +                    b: String::from("Hello, world!"),
> +                },
> +                y: foo::MyOtherCoolStruct {
> +                    a: false,
> +                    b: String::from("Hello, world!"),
> +                },
> +                z: foo::MyCoolGenericStruct::<bool, String> {
> +                    a: false,
> +                    b: String::from("Hello, world!"),
> +                }
> +            }
> +        );
> +        //dbg!(x);
> +
> +        assert_eq!(
> +            x,
> +            &MyCoolStruct {
> +                b: true,
> +                s: String::from("works"),
> +                i: str::parse::<i32>("123").unwrap(),
> +                v: vec![String::from("works")],
> +                x: foo::MyOtherCoolStruct {
> +                    a: false,
> +                    b: String::from("Hello, world!"),
> +                },
> +                y: foo::MyOtherCoolStruct {
> +                    a: false,
> +                    b: String::from("Hello, world!"),
> +                },
> +                z: foo::MyCoolGenericStruct::<bool, String> {
> +                    a: false,
> +                    b: String::from("Hello, world!"),
> +                },
> +            },
> +        );
> +    }
> +
> +    #[test]
> +    fn test_default() {
> +        let mut buf: MaybeUninit<MyDefaultStruct> = MaybeUninit::uninit();
> +
> +        let x: &mut MyDefaultStruct = place!(
> +            &mut buf,
> +            MyDefaultStruct {
> +                b: true,
> +                i: 1,
> +                ..Default::default()
> +            }
> +        );
> +
> +        assert_eq!(
> +            x,
> +            &MyDefaultStruct {
> +                b: true,
> +                i: 1,
> +                j: 0,
> +            },
> +        );
> +    }
> +
> +    #[test]
> +    fn test_scalar() {
> +        let mut buf: MaybeUninit<u32> = MaybeUninit::uninit();
> +
> +        let x: &mut u32 = place!(&mut buf, 1234);
> +
> +        assert_eq!(x, &mut 1234u32);
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/queue/common.rs b/drivers/gpu/drm/asahi/queue/common.rs
> new file mode 100644
> index 000000000000..127b4ccc6eca
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/queue/common.rs
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Common queue functionality.
> +//!
> +//! Shared helpers used by the submission logic for multiple command types.
> +
> +use crate::fw::microseq;
> +use crate::fw::types::*;
> +
> +use kernel::bindings;
> +use kernel::io_buffer::IoBufferReader;
> +use kernel::prelude::*;
> +use kernel::user_ptr::UserSlicePtr;
> +
> +use core::mem::MaybeUninit;
> +
> +pub(super) fn build_attachments(pointer: u64, count: u32) -> Result<microseq::Attachments> {
> +    if count as usize > microseq::MAX_ATTACHMENTS {
> +        return Err(EINVAL);
> +    }
> +
> +    const STRIDE: usize = core::mem::size_of::<bindings::drm_asahi_attachment>();
> +    let size = STRIDE * count as usize;
> +
> +    // SAFETY: We only read this once, so there are no TOCTOU issues.
> +    let mut reader = unsafe { UserSlicePtr::new(pointer as usize as *mut _, size).reader() };
> +
> +    let mut attachments: microseq::Attachments = Default::default();
> +
> +    for i in 0..count {
> +        let mut att: MaybeUninit<bindings::drm_asahi_attachment> = MaybeUninit::uninit();
> +
> +        // SAFETY: The size of `att` is STRIDE
> +        unsafe { reader.read_raw(att.as_mut_ptr() as *mut u8, STRIDE)? };
> +
> +        // SAFETY: All bit patterns in the struct are valid
> +        let att = unsafe { att.assume_init() };
> +
> +        let cache_lines = (att.size + 127) >> 7;
> +        let order = 1;
> +        attachments.list[i as usize] = microseq::Attachment {
> +            address: U64(att.pointer),
> +            size: cache_lines,
> +            unk_c: 0x17,
> +            unk_e: order,
> +        };
> +
> +        attachments.count += 1;
> +    }
> +
> +    Ok(attachments)
> +}
> diff --git a/drivers/gpu/drm/asahi/queue/compute.rs b/drivers/gpu/drm/asahi/queue/compute.rs
> new file mode 100644
> index 000000000000..6590382c75af
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/queue/compute.rs
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +#![allow(clippy::unusual_byte_groupings)]
> +
> +//! Compute work queue.
> +//!
> +//! A compute queue consists of one underlying WorkQueue.
> +//! This module is in charge of creating all of the firmware structures required to submit compute
> +//! work to the GPU, based on the userspace command buffer.
> +
> +use super::common;
> +use crate::alloc::Allocator;
> +use crate::debug::*;
> +use crate::fw::types::*;
> +use crate::gpu::GpuManager;
> +use crate::{box_in_place, inner_ptr, inner_weak_ptr, place};
> +use crate::{fw, gpu, microseq};
> +use core::mem::MaybeUninit;
> +use core::sync::atomic::Ordering;
> +use kernel::bindings;
> +use kernel::dma_fence::RawDmaFence;
> +use kernel::drm::sched::Job;
> +use kernel::io_buffer::IoBufferReader;
> +use kernel::prelude::*;
> +use kernel::sync::Arc;
> +use kernel::user_ptr::UserSlicePtr;
> +
> +const DEBUG_CLASS: DebugFlags = DebugFlags::Compute;
> +
> +#[versions(AGX)]
> +impl super::Queue::ver {
> +    /// Submit work to a compute queue.
> +    pub(super) fn submit_compute(
> +        &self,
> +        job: &mut Job<super::QueueJob::ver>,
> +        cmd: &bindings::drm_asahi_command,
> +        result_writer: Option<super::ResultWriter>,
> +        id: u64,
> +        flush_stamps: bool,
> +    ) -> Result {
> +        if cmd.cmd_type != bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_COMPUTE {
> +            return Err(EINVAL);
> +        }
> +
> +        let dev = self.dev.data();
> +        let gpu = match dev.gpu.as_any().downcast_ref::<gpu::GpuManager::ver>() {
> +            Some(gpu) => gpu,
> +            None => {
> +                dev_crit!(self.dev, "GpuManager mismatched with Queue!\n");
> +                return Err(EIO);
> +            }
> +        };
> +
> +        let mut alloc = gpu.alloc();
> +        let kalloc = &mut *alloc;
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Compute!\n", id);
> +
> +        let mut cmdbuf_reader = unsafe {
> +            UserSlicePtr::new(
> +                cmd.cmd_buffer as usize as *mut _,
> +                core::mem::size_of::<bindings::drm_asahi_cmd_compute>(),
> +            )
> +            .reader()
> +        };
> +
> +        let mut cmdbuf: MaybeUninit<bindings::drm_asahi_cmd_compute> = MaybeUninit::uninit();
> +        unsafe {
> +            cmdbuf_reader.read_raw(
> +                cmdbuf.as_mut_ptr() as *mut u8,
> +                core::mem::size_of::<bindings::drm_asahi_cmd_compute>(),
> +            )?;
> +        }
> +        let cmdbuf = unsafe { cmdbuf.assume_init() };
> +
> +        if cmdbuf.flags != 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        // This sequence number increases per new client/VM? assigned to some slot,
> +        // but it's unclear *which* slot...
> +        let slot_client_seq: u8 = (self.id & 0xff) as u8;
> +
> +        let vm_bind = job.vm_bind.clone();
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] VM slot = {}\n",
> +            id,
> +            vm_bind.slot()
> +        );
> +
> +        let notifier = self.notifier.clone();
> +
> +        let fence = job.fence.clone();
> +        let comp_job = job.get_comp()?;
> +        let ev_comp = comp_job.event_info();
> +
> +        // TODO: Is this the same on all GPUs? Is this really for preemption?
> +        let preempt_size = 0x7fa0;
> +        let preempt2_off = 0x7f80;
> +        let preempt3_off = 0x7f88;
> +        let preempt4_off = 0x7f90;
> +        let preempt5_off = 0x7f98;
> +
> +        let preempt_buf = self.ualloc.lock().array_empty(preempt_size)?;
> +
> +        let mut seq_buf = self.ualloc.lock().array_empty(0x800)?;
> +        for i in 1..0x400 {
> +            seq_buf[i] = (i + 1) as u64;
> +        }
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] Event #{} {:#x?} -> {:#x?}\n",
> +            id,
> +            ev_comp.slot,
> +            ev_comp.value,
> +            ev_comp.value.next(),
> +        );
> +
> +        let timestamps = Arc::try_new(kalloc.shared.new_default::<fw::job::JobTimestamps>()?)?;
> +
> +        let uuid = cmdbuf.cmd_id;
> +
> +        let unk3 = debug_enabled(debug::DebugFlags::Debug3);
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] UUID = {:#x?}\n", id, uuid);
> +
> +        // TODO: check
> +        #[ver(V >= V13_0B4)]
> +        let count = self.counter.fetch_add(1, Ordering::Relaxed);
> +
> +        let comp = GpuObject::new_prealloc(
> +            kalloc.private.alloc_object()?,
> +            |ptr: GpuWeakPointer<fw::compute::RunCompute::ver>| {
> +                let mut builder = microseq::Builder::new();
> +
> +                let stats = gpu.initdata.runtime_pointers.stats.comp.weak_pointer();
> +
> +                let start_comp = builder.add(microseq::StartCompute::ver {
> +                    header: microseq::op::StartCompute::HEADER,
> +                    unk_pointer: inner_weak_ptr!(ptr, unk_pointee),
> +                    job_params1: inner_weak_ptr!(ptr, job_params1),
> +                    stats,
> +                    work_queue: ev_comp.info_ptr,
> +                    vm_slot: vm_bind.slot(),
> +                    unk_28: 0x1,
> +                    event_generation: self.id as u32,
> +                    cmd_seq: U64(ev_comp.cmd_seq),
> +                    unk_38: 0x0,
> +                    job_params2: inner_weak_ptr!(ptr, job_params2),
> +                    unk_44: 0x0,
> +                    uuid,
> +                    attachments: common::build_attachments(
> +                        cmdbuf.attachments,
> +                        cmdbuf.attachment_count,
> +                    )?,
> +                    padding: Default::default(),
> +                    #[ver(V >= V13_0B4)]
> +                    unk_flag: inner_weak_ptr!(ptr, unk_flag),
> +                    #[ver(V >= V13_0B4)]
> +                    counter: U64(count),
> +                    #[ver(V >= V13_0B4)]
> +                    notifier_buf: inner_weak_ptr!(notifier.weak_pointer(), state.unk_buf),
> +                })?;
> +
> +                if result_writer.is_some() {
> +                    builder.add(microseq::Timestamp::ver {
> +                        header: microseq::op::Timestamp::new(true),
> +                        cur_ts: inner_weak_ptr!(ptr, cur_ts),
> +                        start_ts: inner_weak_ptr!(ptr, start_ts),
> +                        update_ts: inner_weak_ptr!(ptr, start_ts),
> +                        work_queue: ev_comp.info_ptr,
> +                        unk_24: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: inner_weak_ptr!(ptr, unk_ts),
> +                        uuid,
> +                        unk_30_padding: 0,
> +                    })?;
> +                }
> +
> +                builder.add(microseq::WaitForIdle {
> +                    header: microseq::op::WaitForIdle::new(microseq::Pipe::Compute),
> +                })?;
> +
> +                if result_writer.is_some() {
> +                    builder.add(microseq::Timestamp::ver {
> +                        header: microseq::op::Timestamp::new(false),
> +                        cur_ts: inner_weak_ptr!(ptr, cur_ts),
> +                        start_ts: inner_weak_ptr!(ptr, start_ts),
> +                        update_ts: inner_weak_ptr!(ptr, end_ts),
> +                        work_queue: ev_comp.info_ptr,
> +                        unk_24: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: inner_weak_ptr!(ptr, unk_ts),
> +                        uuid,
> +                        unk_30_padding: 0,
> +                    })?;
> +                }
> +
> +                let off = builder.offset_to(start_comp);
> +                builder.add(microseq::FinalizeCompute::ver {
> +                    header: microseq::op::FinalizeCompute::HEADER,
> +                    stats,
> +                    work_queue: ev_comp.info_ptr,
> +                    vm_slot: vm_bind.slot(),
> +                    #[ver(V < V13_0B4)]
> +                    unk_18: 0,
> +                    job_params2: inner_weak_ptr!(ptr, job_params2),
> +                    unk_24: 0,
> +                    uuid,
> +                    fw_stamp: ev_comp.fw_stamp_pointer,
> +                    stamp_value: ev_comp.value.next(),
> +                    unk_38: 0,
> +                    unk_3c: 0,
> +                    unk_40: 0,
> +                    unk_44: 0,
> +                    unk_48: 0,
> +                    unk_4c: 0,
> +                    unk_50: 0,
> +                    unk_54: 0,
> +                    unk_58: 0,
> +                    #[ver(G == G14 && V < V13_0B4)]
> +                    unk_5c_g14: U64(0),
> +                    restart_branch_offset: off,
> +                    unk_60: unk3.into(),
> +                    #[ver(V >= V13_0B4)]
> +                    unk_64: Default::default(),
> +                    #[ver(V >= V13_0B4)]
> +                    unk_flag: inner_weak_ptr!(ptr, unk_flag),
> +                    #[ver(V >= V13_0B4)]
> +                    unk_79: Default::default(),
> +                })?;
> +
> +                builder.add(microseq::RetireStamp {
> +                    header: microseq::op::RetireStamp::HEADER,
> +                })?;
> +
> +                Ok(box_in_place!(fw::compute::RunCompute::ver {
> +                    notifier: notifier.clone(),
> +                    preempt_buf: preempt_buf,
> +                    seq_buf: seq_buf,
> +                    micro_seq: builder.build(&mut kalloc.private)?,
> +                    vm_bind: vm_bind.clone(),
> +                    timestamps: timestamps.clone(),
> +                })?)
> +            },
> +            |inner, ptr| {
> +                Ok(place!(
> +                    ptr,
> +                    fw::compute::raw::RunCompute::ver {
> +                        tag: fw::workqueue::CommandType::RunCompute,
> +                        #[ver(V >= V13_0B4)]
> +                        counter: U64(count),
> +                        unk_4: 0,
> +                        vm_slot: vm_bind.slot(),
> +                        notifier: inner.notifier.gpu_pointer(),
> +                        unk_pointee: Default::default(),
> +                        job_params1: fw::compute::raw::JobParameters1 {
> +                            preempt_buf1: inner.preempt_buf.gpu_pointer(),
> +                            encoder: U64(cmdbuf.encoder_ptr),
> +                            // buf2-5 Only if internal program is used
> +                            preempt_buf2: inner.preempt_buf.gpu_offset_pointer(preempt2_off),
> +                            preempt_buf3: inner.preempt_buf.gpu_offset_pointer(preempt3_off),
> +                            preempt_buf4: inner.preempt_buf.gpu_offset_pointer(preempt4_off),
> +                            preempt_buf5: inner.preempt_buf.gpu_offset_pointer(preempt5_off),
> +                            pipeline_base: U64(0x11_00000000),
> +                            unk_38: U64(0x8c60),
> +                            unk_40: cmdbuf.ctx_switch_prog, // Internal program addr | 1
> +                            unk_44: 0,
> +                            compute_layout_addr: U64(cmdbuf.buffer_descriptor), // Only if internal program used
> +                            unk_50: cmdbuf.buffer_descriptor_size, // 0x40 if internal program used
> +                            unk_54: 0,
> +                            unk_58: 1,
> +                            unk_5c: 0,
> +                            iogpu_unk_40: cmdbuf.iogpu_unk_40, // 0x1c if internal program used
> +                        },
> +                        unk_b8: Default::default(),
> +                        microsequence: inner.micro_seq.gpu_pointer(),
> +                        microsequence_size: inner.micro_seq.len() as u32,
> +                        job_params2: fw::compute::raw::JobParameters2::ver {
> +                            #[ver(V >= V13_0B4)]
> +                            unk_0_0: 0,
> +                            unk_0: Default::default(),
> +                            preempt_buf1: inner.preempt_buf.gpu_pointer(),
> +                            encoder_end: U64(cmdbuf.encoder_end),
> +                            unk_34: Default::default(),
> +                            #[ver(V < V13_0B4)]
> +                            unk_5c: 0,
> +                        },
> +                        encoder_params: fw::job::raw::EncoderParams {
> +                            unk_8: 0x0,  // fixed
> +                            unk_c: 0x0,  // fixed
> +                            unk_10: 0x0, // fixed
> +                            encoder_id: cmdbuf.encoder_id,
> +                            unk_18: 0x0, // fixed
> +                            iogpu_compute_unk44: cmdbuf.iogpu_unk_44,
> +                            seq_buffer: inner.seq_buf.gpu_pointer(),
> +                            unk_28: U64(0x0), // fixed
> +                        },
> +                        meta: fw::job::raw::JobMeta {
> +                            unk_4: 0,
> +                            stamp: ev_comp.stamp_pointer,
> +                            fw_stamp: ev_comp.fw_stamp_pointer,
> +                            stamp_value: ev_comp.value.next(),
> +                            stamp_slot: ev_comp.slot,
> +                            evctl_index: 0, // fixed
> +                            flush_stamps: flush_stamps as u32,
> +                            uuid: uuid,
> +                            cmd_seq: ev_comp.cmd_seq as u32,
> +                        },
> +                        cur_ts: U64(0),
> +                        start_ts: Some(inner_ptr!(inner.timestamps.gpu_pointer(), start)),
> +                        end_ts: Some(inner_ptr!(inner.timestamps.gpu_pointer(), end)),
> +                        unk_2c0: 0,
> +                        unk_2c4: 0,
> +                        unk_2c8: 0,
> +                        unk_2cc: 0,
> +                        client_sequence: slot_client_seq,
> +                        pad_2d1: Default::default(),
> +                        unk_2d4: 0,
> +                        unk_2d8: 0,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_2e1: Default::default(),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_flag: U32(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_pad: Default::default(),
> +                    }
> +                ))
> +            },
> +        )?;
> +
> +        core::mem::drop(alloc);
> +
> +        fence.add_command();
> +        comp_job.add_cb(comp, vm_bind.slot(), move |cmd, error| {
> +            if let Some(err) = error {
> +                fence.set_error(err.into())
> +            }
> +            if let Some(mut rw) = result_writer {
> +                let mut result: bindings::drm_asahi_result_compute = Default::default();
> +
> +                cmd.timestamps.with(|raw, _inner| {
> +                    result.ts_start = raw.start.load(Ordering::Relaxed);
> +                    result.ts_end = raw.end.load(Ordering::Relaxed);
> +                });
> +
> +                if let Some(err) = error {
> +                    result.info = err.into();
> +                } else {
> +                    result.info.status = bindings::drm_asahi_status_DRM_ASAHI_STATUS_COMPLETE;
> +                }
> +
> +                rw.write(result);
> +            }
> +
> +            fence.command_complete();
> +        })?;
> +
> +        notifier.threshold.with(|raw, _inner| {
> +            raw.increment();
> +        });
> +
> +        comp_job.next_seq();
> +
> +        Ok(())
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/queue/mod.rs b/drivers/gpu/drm/asahi/queue/mod.rs
> new file mode 100644
> index 000000000000..15988af33cf3
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/queue/mod.rs
> @@ -0,0 +1,725 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Submission queue management
> +//!
> +//! This module implements the userspace view of submission queues and the logic to map userspace
> +//! submissions to firmware queues.
> +
> +use kernel::dma_fence::*;
> +use kernel::prelude::*;
> +use kernel::{
> +    bindings, c_str, dma_fence,
> +    drm::gem::shmem::VMap,
> +    drm::sched,
> +    macros::versions,
> +    sync::{smutex::Mutex, Arc},
> +};
> +
> +use crate::alloc::Allocator;
> +use crate::debug::*;
> +use crate::driver::AsahiDevice;
> +use crate::fw::types::*;
> +use crate::gpu::GpuManager;
> +use crate::{alloc, buffer, channel, event, file, fw, gem, gpu, mmu, workqueue};
> +use crate::{inner_weak_ptr, place};
> +
> +use core::mem::MaybeUninit;
> +use core::sync::atomic::{AtomicU64, Ordering};
> +
> +const DEBUG_CLASS: DebugFlags = DebugFlags::Queue;
> +
> +const WQ_SIZE: u32 = 0x500;
> +
> +mod common;
> +mod compute;
> +mod render;
> +
> +/// Trait implemented by all versioned queues.
> +pub(crate) trait Queue: Send + Sync {
> +    fn submit(
> +        &mut self,
> +        id: u64,
> +        in_syncs: Vec<file::SyncItem>,
> +        out_syncs: Vec<file::SyncItem>,
> +        result_buf: Option<gem::ObjectRef>,
> +        commands: Vec<bindings::drm_asahi_command>,
> +    ) -> Result;
> +}
> +
> +#[versions(AGX)]
> +struct SubQueue {
> +    wq: Arc<workqueue::WorkQueue::ver>,
> +}
> +
> +#[versions(AGX)]
> +impl SubQueue::ver {
> +    fn new_job(&mut self) -> SubQueueJob::ver {
> +        SubQueueJob::ver {
> +            wq: self.wq.clone(),
> +            job: None,
> +        }
> +    }
> +}
> +
> +#[versions(AGX)]
> +struct SubQueueJob {
> +    wq: Arc<workqueue::WorkQueue::ver>,
> +    job: Option<workqueue::Job::ver>,
> +}
> +
> +#[versions(AGX)]
> +impl SubQueueJob::ver {
> +    fn get(&mut self) -> Result<&mut workqueue::Job::ver> {
> +        if self.job.is_none() {
> +            mod_pr_debug!("SubQueueJob: Creating {:?} job\n", self.wq.pipe_type());
> +            self.job.replace(self.wq.new_job()?);
> +        }
> +        Ok(self.job.as_mut().expect("expected a Job"))
> +    }
> +
> +    fn commit(&mut self) -> Result {
> +        match self.job.as_mut() {
> +            Some(job) => job.commit(),
> +            None => Ok(()),
> +        }
> +    }
> +
> +    fn can_submit(&self) -> bool {
> +        match self.job.as_ref() {
> +            None => true,
> +            Some(job) => job.can_submit(),
> +        }
> +    }
> +}
> +
> +#[versions(AGX)]
> +pub(crate) struct Queue {
> +    dev: AsahiDevice,
> +    _sched: sched::Scheduler<QueueJob::ver>,
> +    entity: sched::Entity<QueueJob::ver>,
> +    vm: mmu::Vm,
> +    ualloc: Arc<Mutex<alloc::DefaultAllocator>>,
> +    q_vtx: Option<SubQueue::ver>,
> +    q_frag: Option<SubQueue::ver>,
> +    q_comp: Option<SubQueue::ver>,
> +    buffer: Option<Mutex<buffer::Buffer::ver>>,
> +    gpu_context: Arc<workqueue::GpuContext>,
> +    notifier_list: Arc<GpuObject<fw::event::NotifierList>>,
> +    notifier: Arc<GpuObject<fw::event::Notifier::ver>>,
> +    id: u64,
> +    fence_ctx: FenceContexts,
> +    #[ver(V >= V13_0B4)]
> +    counter: AtomicU64,
> +}
> +
> +#[versions(AGX)]
> +#[derive(Default)]
> +pub(crate) struct JobFence {
> +    id: u64,
> +    pending: AtomicU64,
> +}
> +
> +#[versions(AGX)]
> +impl JobFence::ver {
> +    fn add_command(self: &FenceObject<Self>) {
> +        self.pending.fetch_add(1, Ordering::Relaxed);
> +    }
> +
> +    fn command_complete(self: &FenceObject<Self>) {
> +        let remain = self.pending.fetch_sub(1, Ordering::Relaxed) - 1;
> +        mod_pr_debug!(
> +            "JobFence[{}]: Command complete (remain: {})\n",
> +            self.id,
> +            remain
> +        );
> +        if remain == 0 {
> +            mod_pr_debug!("JobFence[{}]: Signaling\n", self.id);
> +            if self.signal().is_err() {
> +                pr_err!("JobFence[{}]: Fence signal failed\n", self.id);
> +            }
> +        }
> +    }
> +}
> +
> +#[versions(AGX)]
> +#[vtable]
> +impl dma_fence::FenceOps for JobFence::ver {
> +    const USE_64BIT_SEQNO: bool = true;
> +
> +    fn get_driver_name<'a>(self: &'a FenceObject<Self>) -> &'a CStr {
> +        c_str!("asahi")
> +    }
> +    fn get_timeline_name<'a>(self: &'a FenceObject<Self>) -> &'a CStr {
> +        c_str!("queue")
> +    }
> +}
> +
> +#[versions(AGX)]
> +pub(crate) struct QueueJob {
> +    dev: AsahiDevice,
> +    vm_bind: mmu::VmBind,
> +    op_guard: Option<gpu::OpGuard>,
> +    sj_vtx: Option<SubQueueJob::ver>,
> +    sj_frag: Option<SubQueueJob::ver>,
> +    sj_comp: Option<SubQueueJob::ver>,
> +    fence: UserFence<JobFence::ver>,
> +    did_run: bool,
> +    id: u64,
> +}
> +
> +#[versions(AGX)]
> +impl QueueJob::ver {
> +    fn get_vtx(&mut self) -> Result<&mut workqueue::Job::ver> {
> +        self.sj_vtx.as_mut().ok_or(EINVAL)?.get()
> +    }
> +    fn get_frag(&mut self) -> Result<&mut workqueue::Job::ver> {
> +        self.sj_frag.as_mut().ok_or(EINVAL)?.get()
> +    }
> +    fn get_comp(&mut self) -> Result<&mut workqueue::Job::ver> {
> +        self.sj_comp.as_mut().ok_or(EINVAL)?.get()
> +    }
> +
> +    fn commit(&mut self) -> Result {
> +        mod_dev_dbg!(self.dev, "QueueJob: Committing\n");
> +
> +        self.sj_vtx.as_mut().map(|a| a.commit()).unwrap_or(Ok(()))?;
> +        self.sj_frag
> +            .as_mut()
> +            .map(|a| a.commit())
> +            .unwrap_or(Ok(()))?;
> +        self.sj_comp.as_mut().map(|a| a.commit()).unwrap_or(Ok(()))
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl sched::JobImpl for QueueJob::ver {
> +    fn can_run(job: &mut sched::Job<Self>) -> bool {
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Checking runnability\n", job.id);
> +
> +        if let Some(sj) = job.sj_vtx.as_ref() {
> +            if !sj.can_submit() {
> +                mod_dev_dbg!(
> +                    job.dev,
> +                    "QueueJob {}: Blocking due to vertex queue full\n",
> +                    job.id
> +                );
> +                return false;
> +            }
> +        }
> +        if let Some(sj) = job.sj_frag.as_ref() {
> +            if !sj.can_submit() {
> +                mod_dev_dbg!(
> +                    job.dev,
> +                    "QueueJob {}: Blocking due to fragment queue full\n",
> +                    job.id
> +                );
> +                return false;
> +            }
> +        }
> +        if let Some(sj) = job.sj_comp.as_ref() {
> +            if !sj.can_submit() {
> +                mod_dev_dbg!(
> +                    job.dev,
> +                    "QueueJob {}: Blocking due to compute queue full\n",
> +                    job.id
> +                );
> +                return false;
> +            }
> +        }
> +        true
> +    }
> +
> +    #[allow(unused_assignments)]
> +    fn run(job: &mut sched::Job<Self>) -> Result<Option<dma_fence::Fence>> {
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Running Job\n", job.id);
> +
> +        let dev = job.dev.data();
> +        let gpu = match dev
> +            .gpu
> +            .clone()
> +            .arc_as_any()
> +            .downcast::<gpu::GpuManager::ver>()
> +        {
> +            Ok(gpu) => gpu,
> +            Err(_) => {
> +                dev_crit!(job.dev, "GpuManager mismatched with QueueJob!\n");
> +                return Err(EIO);
> +            }
> +        };
> +
> +        if job.op_guard.is_none() {
> +            job.op_guard = Some(gpu.start_op()?);
> +        }
> +
> +        // First submit all the commands for each queue. This can fail.
> +
> +        let mut frag_job = None;
> +        let mut frag_sub = None;
> +        if let Some(sj) = job.sj_frag.as_mut() {
> +            frag_job = sj.job.take();
> +            if let Some(wqjob) = frag_job.as_mut() {
> +                mod_dev_dbg!(job.dev, "QueueJob {}: Submit fragment\n", job.id);
> +                frag_sub = Some(wqjob.submit()?);
> +            }
> +        }
> +
> +        let mut vtx_job = None;
> +        let mut vtx_sub = None;
> +        if let Some(sj) = job.sj_vtx.as_mut() {
> +            vtx_job = sj.job.take();
> +            if let Some(wqjob) = vtx_job.as_mut() {
> +                mod_dev_dbg!(job.dev, "QueueJob {}: Submit vertex\n", job.id);
> +                vtx_sub = Some(wqjob.submit()?);
> +            }
> +        }
> +
> +        let mut comp_job = None;
> +        let mut comp_sub = None;
> +        if let Some(sj) = job.sj_comp.as_mut() {
> +            comp_job = sj.job.take();
> +            if let Some(wqjob) = comp_job.as_mut() {
> +                mod_dev_dbg!(job.dev, "QueueJob {}: Submit compute\n", job.id);
> +                comp_sub = Some(wqjob.submit()?);
> +            }
> +        }
> +
> +        // Now we fully commit to running the job
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Run fragment\n", job.id);
> +        frag_sub.map(|a| gpu.run_job(a)).transpose()?;
> +
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Run vertex\n", job.id);
> +        vtx_sub.map(|a| gpu.run_job(a)).transpose()?;
> +
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Run compute\n", job.id);
> +        comp_sub.map(|a| gpu.run_job(a)).transpose()?;
> +
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Drop compute job\n", job.id);
> +        core::mem::drop(comp_job);
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Drop vertex job\n", job.id);
> +        core::mem::drop(vtx_job);
> +        mod_dev_dbg!(job.dev, "QueueJob {}: Drop fragment job\n", job.id);
> +        core::mem::drop(frag_job);
> +
> +        job.did_run = true;
> +
> +        Ok(Some(Fence::from_fence(&job.fence)))
> +    }
> +
> +    fn timed_out(job: &mut sched::Job<Self>) -> sched::Status {
> +        // FIXME: Handle timeouts properly
> +        dev_err!(
> +            job.dev,
> +            "QueueJob {}: Job timed out on the DRM scheduler, things will probably break (ran: {})\n",
> +            job.id, job.did_run
> +        );
> +        sched::Status::NoDevice
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl Drop for QueueJob::ver {
> +    fn drop(&mut self) {
> +        mod_dev_dbg!(self.dev, "QueueJob {}: Dropping\n", self.id);
> +    }
> +}
> +
> +struct ResultWriter {
> +    vmap: VMap<gem::DriverObject>,
> +    offset: usize,
> +    len: usize,
> +}
> +
> +impl ResultWriter {
> +    fn write<T>(&mut self, mut value: T) {
> +        let p: *mut u8 = &mut value as *mut _ as *mut u8;
> +        // SAFETY: We know `p` points to a type T of that size, and UAPI types must have
> +        // no padding and all bit patterns valid.
> +        let slice = unsafe { core::slice::from_raw_parts_mut(p, core::mem::size_of::<T>()) };
> +        let len = slice.len().min(self.len);
> +        self.vmap.as_mut_slice()[self.offset..self.offset + len].copy_from_slice(&slice[..len]);
> +    }
> +}
> +
> +static QUEUE_NAME: &CStr = c_str!("asahi_fence");
> +static QUEUE_CLASS_KEY: kernel::sync::LockClassKey = kernel::sync::LockClassKey::new();
> +
> +#[versions(AGX)]
> +impl Queue::ver {
> +    /// Create a new user queue.
> +    #[allow(clippy::too_many_arguments)]
> +    pub(crate) fn new(
> +        dev: &AsahiDevice,
> +        vm: mmu::Vm,
> +        alloc: &mut gpu::KernelAllocators,
> +        ualloc: Arc<Mutex<alloc::DefaultAllocator>>,
> +        ualloc_priv: Arc<Mutex<alloc::DefaultAllocator>>,
> +        event_manager: Arc<event::EventManager>,
> +        mgr: &buffer::BufferManager,
> +        id: u64,
> +        priority: u32,
> +        caps: u32,
> +    ) -> Result<Queue::ver> {
> +        mod_dev_dbg!(dev, "[Queue {}] Creating queue\n", id);
> +
> +        let data = dev.data();
> +
> +        let mut notifier_list = alloc.private.new_default::<fw::event::NotifierList>()?;
> +
> +        let self_ptr = notifier_list.weak_pointer();
> +        notifier_list.with_mut(|raw, _inner| {
> +            raw.list_head.next = Some(inner_weak_ptr!(self_ptr, list_head));
> +        });
> +
> +        let threshold = alloc.shared.new_default::<fw::event::Threshold>()?;
> +
> +        let notifier: Arc<GpuObject<fw::event::Notifier::ver>> =
> +            Arc::try_new(alloc.private.new_inplace(
> +                fw::event::Notifier::ver { threshold },
> +                |inner, ptr: &mut MaybeUninit<fw::event::raw::Notifier::ver<'_>>| {
> +                    Ok(place!(
> +                        ptr,
> +                        fw::event::raw::Notifier::ver {
> +                            threshold: inner.threshold.gpu_pointer(),
> +                            generation: AtomicU32::new(id as u32),
> +                            cur_count: AtomicU32::new(0),
> +                            unk_10: AtomicU32::new(0x50),
> +                            state: Default::default()
> +                        }
> +                    ))
> +                },
> +            )?)?;
> +
> +        let sched = sched::Scheduler::new(dev, WQ_SIZE, 0, 100000, c_str!("asahi_sched"))?;
> +        // Priorities are handled by the AGX scheduler, there is no meaning within a
> +        // per-queue scheduler.
> +        let entity = sched::Entity::new(&sched, sched::Priority::Normal)?;
> +
> +        let mut ret = Queue::ver {
> +            dev: dev.clone(),
> +            _sched: sched,
> +            entity,
> +            vm,
> +            ualloc,
> +            q_vtx: None,
> +            q_frag: None,
> +            q_comp: None,
> +            buffer: None,
> +            gpu_context: Arc::try_new(workqueue::GpuContext::new(dev, alloc)?)?,
> +            notifier_list: Arc::try_new(notifier_list)?,
> +            notifier,
> +            id,
> +            fence_ctx: FenceContexts::new(1, QUEUE_NAME, &QUEUE_CLASS_KEY)?,
> +            #[ver(V >= V13_0B4)]
> +            counter: AtomicU64::new(0),
> +        };
> +
> +        // Rendering structures
> +        if caps & bindings::drm_asahi_queue_cap_DRM_ASAHI_QUEUE_CAP_RENDER != 0 {
> +            let buffer =
> +                buffer::Buffer::ver::new(&*data.gpu, alloc, ret.ualloc.clone(), ualloc_priv, mgr)?;
> +            let tvb_blocks = {
> +                let lock = crate::THIS_MODULE.kernel_param_lock();
> +                *crate::initial_tvb_size.read(&lock)
> +            };
> +
> +            buffer.ensure_blocks(tvb_blocks)?;
> +
> +            ret.buffer = Some(Mutex::new(buffer));
> +            ret.q_vtx = Some(SubQueue::ver {
> +                wq: workqueue::WorkQueue::ver::new(
> +                    alloc,
> +                    event_manager.clone(),
> +                    ret.gpu_context.clone(),
> +                    ret.notifier_list.clone(),
> +                    channel::PipeType::Vertex,
> +                    id,
> +                    priority,
> +                    WQ_SIZE,
> +                )?,
> +            });
> +        }
> +
> +        // Rendering & blit structures
> +        if caps
> +            & (bindings::drm_asahi_queue_cap_DRM_ASAHI_QUEUE_CAP_RENDER
> +                | bindings::drm_asahi_queue_cap_DRM_ASAHI_QUEUE_CAP_BLIT)
> +            != 0
> +        {
> +            ret.q_frag = Some(SubQueue::ver {
> +                wq: workqueue::WorkQueue::ver::new(
> +                    alloc,
> +                    event_manager.clone(),
> +                    ret.gpu_context.clone(),
> +                    ret.notifier_list.clone(),
> +                    channel::PipeType::Fragment,
> +                    id,
> +                    priority,
> +                    WQ_SIZE,
> +                )?,
> +            });
> +        }
> +
> +        // Compute structures
> +        if caps & bindings::drm_asahi_queue_cap_DRM_ASAHI_QUEUE_CAP_COMPUTE != 0 {
> +            ret.q_comp = Some(SubQueue::ver {
> +                wq: workqueue::WorkQueue::ver::new(
> +                    alloc,
> +                    event_manager,
> +                    ret.gpu_context.clone(),
> +                    ret.notifier_list.clone(),
> +                    channel::PipeType::Compute,
> +                    id,
> +                    priority,
> +                    WQ_SIZE,
> +                )?,
> +            });
> +        }
> +
> +        mod_dev_dbg!(dev, "[Queue {}] Queue created\n", id);
> +        Ok(ret)
> +    }
> +}
> +
> +const SQ_RENDER: usize = bindings::drm_asahi_subqueue_DRM_ASAHI_SUBQUEUE_RENDER as usize;
> +const SQ_COMPUTE: usize = bindings::drm_asahi_subqueue_DRM_ASAHI_SUBQUEUE_COMPUTE as usize;
> +const SQ_COUNT: usize = bindings::drm_asahi_subqueue_DRM_ASAHI_SUBQUEUE_COUNT as usize;
> +
> +#[versions(AGX)]
> +impl Queue for Queue::ver {
> +    fn submit(
> +        &mut self,
> +        id: u64,
> +        in_syncs: Vec<file::SyncItem>,
> +        out_syncs: Vec<file::SyncItem>,
> +        result_buf: Option<gem::ObjectRef>,
> +        commands: Vec<bindings::drm_asahi_command>,
> +    ) -> Result {
> +        let dev = self.dev.data();
> +        let gpu = match dev
> +            .gpu
> +            .clone()
> +            .arc_as_any()
> +            .downcast::<gpu::GpuManager::ver>()
> +        {
> +            Ok(gpu) => gpu,
> +            Err(_) => {
> +                dev_crit!(self.dev, "GpuManager mismatched with JobImpl!\n");
> +                return Err(EIO);
> +            }
> +        };
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Submit job\n", id);
> +
> +        if gpu.is_crashed() {
> +            dev_err!(
> +                self.dev,
> +                "[Submission {}] GPU is crashed, cannot submit\n",
> +                id
> +            );
> +            return Err(ENODEV);
> +        }
> +
> +        // Empty submissions are not legal
> +        if commands.is_empty() {
> +            return Err(EINVAL);
> +        }
> +
> +        let op_guard = if !in_syncs.is_empty() {
> +            Some(gpu.start_op()?)
> +        } else {
> +            None
> +        };
> +
> +        let mut events: [Vec<Option<workqueue::QueueEventInfo::ver>>; SQ_COUNT] =
> +            Default::default();
> +
> +        events[SQ_RENDER].try_push(self.q_frag.as_ref().and_then(|a| a.wq.event_info()))?;
> +        events[SQ_COMPUTE].try_push(self.q_comp.as_ref().and_then(|a| a.wq.event_info()))?;
> +
> +        let vm_bind = gpu.bind_vm(&self.vm)?;
> +        let vm_slot = vm_bind.slot();
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Creating job\n", id);
> +        let mut job = self.entity.new_job(QueueJob::ver {
> +            dev: self.dev.clone(),
> +            vm_bind,
> +            op_guard,
> +            sj_vtx: self.q_vtx.as_mut().map(|a| a.new_job()),
> +            sj_frag: self.q_frag.as_mut().map(|a| a.new_job()),
> +            sj_comp: self.q_comp.as_mut().map(|a| a.new_job()),
> +            fence: self
> +                .fence_ctx
> +                .new_fence::<JobFence::ver>(
> +                    0,
> +                    JobFence::ver {
> +                        id,
> +                        pending: Default::default(),
> +                    },
> +                )?
> +                .into(),
> +            did_run: false,
> +            id,
> +        })?;
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] Adding {} in_syncs\n",
> +            id,
> +            in_syncs.len()
> +        );
> +        for sync in in_syncs {
> +            job.add_dependency(sync.fence.expect("in_sync missing fence"))?;
> +        }
> +
> +        let mut last_render = None;
> +        let mut last_compute = None;
> +
> +        for (i, cmd) in commands.iter().enumerate() {
> +            match cmd.cmd_type {
> +                bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_RENDER => last_render = Some(i),
> +                bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_COMPUTE => last_compute = Some(i),
> +                _ => return Err(EINVAL),
> +            }
> +        }
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] Submitting {} commands\n",
> +            id,
> +            commands.len()
> +        );
> +        for (i, cmd) in commands.into_iter().enumerate() {
> +            for (queue_idx, index) in cmd.barriers.iter().enumerate() {
> +                if *index == bindings::DRM_ASAHI_BARRIER_NONE as u32 {
> +                    continue;
> +                }
> +                if let Some(event) = events[queue_idx].get(*index as usize).ok_or(EINVAL)? {
> +                    let mut alloc = gpu.alloc();
> +                    let queue_job = match cmd.cmd_type {
> +                        bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_RENDER => job.get_vtx()?,
> +                        bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_COMPUTE => job.get_comp()?,
> +                        _ => return Err(EINVAL),
> +                    };
> +                    mod_dev_dbg!(self.dev, "[Submission {}] Create Explicit Barrier\n", id);
> +                    let barrier: GpuObject<fw::workqueue::Barrier> = alloc.private.new_inplace(
> +                        Default::default(),
> +                        |_inner, ptr: &mut MaybeUninit<fw::workqueue::raw::Barrier>| {
> +                            Ok(place!(
> +                                ptr,
> +                                fw::workqueue::raw::Barrier {
> +                                    tag: fw::workqueue::CommandType::Barrier,
> +                                    wait_stamp: event.fw_stamp_pointer,
> +                                    wait_value: event.value,
> +                                    wait_slot: event.slot,
> +                                    stamp_self: queue_job.event_info().value.next(),
> +                                    uuid: 0xffffbbbb,
> +                                    unk: 0,
> +                                }
> +                            ))
> +                        },
> +                    )?;
> +                    mod_dev_dbg!(self.dev, "[Submission {}] Add Explicit Barrier\n", id);
> +                    queue_job.add(barrier, vm_slot)?;
> +                } else {
> +                    assert!(*index == 0);
> +                }
> +            }
> +
> +            let result_writer = match result_buf.as_ref() {
> +                None => {
> +                    if cmd.result_offset != 0 || cmd.result_size != 0 {
> +                        return Err(EINVAL);
> +                    }
> +                    None
> +                }
> +                Some(buf) => {
> +                    if cmd.result_size != 0 {
> +                        if cmd
> +                            .result_offset
> +                            .checked_add(cmd.result_size)
> +                            .ok_or(EINVAL)?
> +                            > buf.size() as u64
> +                        {
> +                            return Err(EINVAL);
> +                        }
> +                        Some(ResultWriter {
> +                            vmap: buf.gem.vmap()?,
> +                            offset: cmd.result_offset.try_into()?,
> +                            len: cmd.result_size.try_into()?,
> +                        })
> +                    } else {
> +                        None
> +                    }
> +                }
> +            };
> +
> +            match cmd.cmd_type {
> +                bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_RENDER => {
> +                    self.submit_render(
> +                        &mut job,
> +                        &cmd,
> +                        result_writer,
> +                        id,
> +                        last_render.unwrap() == i,
> +                    )?;
> +                    events[SQ_RENDER].try_push(Some(
> +                        job.sj_frag
> +                            .as_ref()
> +                            .expect("No frag queue?")
> +                            .job
> +                            .as_ref()
> +                            .expect("No frag job?")
> +                            .event_info(),
> +                    ))?;
> +                }
> +                bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_COMPUTE => {
> +                    self.submit_compute(
> +                        &mut job,
> +                        &cmd,
> +                        result_writer,
> +                        id,
> +                        last_compute.unwrap() == i,
> +                    )?;
> +                    events[SQ_COMPUTE].try_push(Some(
> +                        job.sj_comp
> +                            .as_ref()
> +                            .expect("No comp queue?")
> +                            .job
> +                            .as_ref()
> +                            .expect("No comp job?")
> +                            .event_info(),
> +                    ))?;
> +                }
> +                _ => return Err(EINVAL),
> +            }
> +        }
> +
> +        mod_dev_dbg!(self.dev, "Queue: Committing job\n");
> +        job.commit()?;
> +
> +        mod_dev_dbg!(self.dev, "Queue: Arming job\n");
> +        let job = job.arm();
> +        let out_fence = job.fences().finished();
> +        mod_dev_dbg!(self.dev, "Queue: Pushing job\n");
> +        job.push();
> +
> +        mod_dev_dbg!(self.dev, "Queue: Adding {} out_syncs\n", out_syncs.len());
> +        for mut sync in out_syncs {
> +            if let Some(chain) = sync.chain_fence.take() {
> +                sync.syncobj
> +                    .add_point(chain, &out_fence, sync.timeline_value);
> +            } else {
> +                sync.syncobj.replace_fence(Some(&out_fence));
> +            }
> +        }
> +
> +        Ok(())
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl Drop for Queue::ver {
> +    fn drop(&mut self) {
> +        mod_dev_dbg!(self.dev, "[Queue {}] Dropping queue\n", self.id);
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/queue/render.rs b/drivers/gpu/drm/asahi/queue/render.rs
> new file mode 100644
> index 000000000000..318c952df020
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/queue/render.rs
> @@ -0,0 +1,1173 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +#![allow(clippy::unusual_byte_groupings)]
> +
> +//! Render work queue.
> +//!
> +//! A render queue consists of two underlying WorkQueues, one for vertex and one for fragment work.
> +//! This module is in charge of creating all of the firmware structures required to submit 3D
> +//! rendering work to the GPU, based on the userspace command buffer.
> +
> +use super::common;
> +use crate::alloc::Allocator;
> +use crate::debug::*;
> +use crate::fw::types::*;
> +use crate::gpu::GpuManager;
> +use crate::util::*;
> +use crate::workqueue::WorkError;
> +use crate::{box_in_place, inner_ptr, inner_weak_ptr, place};
> +use crate::{buffer, fw, gpu, microseq, workqueue};
> +use core::mem::MaybeUninit;
> +use core::sync::atomic::Ordering;
> +use kernel::bindings;
> +use kernel::dma_fence::RawDmaFence;
> +use kernel::drm::sched::Job;
> +use kernel::io_buffer::IoBufferReader;
> +use kernel::prelude::*;
> +use kernel::sync::{smutex::Mutex, Arc};
> +use kernel::user_ptr::UserSlicePtr;
> +
> +const DEBUG_CLASS: DebugFlags = DebugFlags::Render;
> +
> +/// Tiling/Vertex control bit to disable using more than one GPU cluster. This results in decreased
> +/// throughput but also less latency, which is probably desirable for light vertex loads where the
> +/// overhead of clustering/merging would exceed the time it takes to just run the job on one
> +/// cluster.
> +const TILECTL_DISABLE_CLUSTERING: u32 = 1u32 << 0;
> +
> +struct RenderResult {
> +    result: bindings::drm_asahi_result_render,
> +    vtx_complete: bool,
> +    frag_complete: bool,
> +    vtx_error: Option<workqueue::WorkError>,
> +    frag_error: Option<workqueue::WorkError>,
> +    writer: super::ResultWriter,
> +}
> +
> +impl RenderResult {
> +    fn commit(&mut self) {
> +        if !self.vtx_complete || !self.frag_complete {
> +            return;
> +        }
> +
> +        let mut error = self.vtx_error.take();
> +        if let Some(frag_error) = self.frag_error.take() {
> +            if error.is_none() || error == Some(WorkError::Killed) {
> +                error = Some(frag_error);
> +            }
> +        }
> +
> +        if let Some(err) = error {
> +            self.result.info = err.into();
> +        } else {
> +            self.result.info.status = bindings::drm_asahi_status_DRM_ASAHI_STATUS_COMPLETE;
> +        }
> +
> +        self.writer.write(self.result);
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl super::Queue::ver {
> +    /// Get the appropriate tiling parameters for a given userspace command buffer.
> +    fn get_tiling_params(
> +        cmdbuf: &bindings::drm_asahi_cmd_render,
> +        num_clusters: u32,
> +    ) -> Result<buffer::TileInfo> {
> +        let width: u32 = cmdbuf.fb_width;
> +        let height: u32 = cmdbuf.fb_height;
> +        let layers: u32 = cmdbuf.layers;
> +
> +        if width > 65536 || height > 65536 {
> +            return Err(EINVAL);
> +        }
> +
> +        if layers == 0 || layers > 2048 {
> +            return Err(EINVAL);
> +        }
> +
> +        let tile_width = 32u32;
> +        let tile_height = 32u32;
> +
> +        let utile_width = cmdbuf.utile_width;
> +        let utile_height = cmdbuf.utile_height;
> +
> +        match (utile_width, utile_height) {
> +            (32, 32) | (32, 16) | (16, 16) => (),
> +            _ => return Err(EINVAL),
> +        };
> +
> +        let utiles_per_tile_x = tile_width / utile_width;
> +        let utiles_per_tile_y = tile_height / utile_height;
> +
> +        let utiles_per_tile = utiles_per_tile_x * utiles_per_tile_y;
> +
> +        let tiles_x = (width + tile_width - 1) / tile_width;
> +        let tiles_y = (height + tile_height - 1) / tile_height;
> +        let tiles = tiles_x * tiles_y;
> +
> +        let mtiles_x = 4u32;
> +        let mtiles_y = 4u32;
> +        let mtiles = mtiles_x * mtiles_y;
> +
> +        // TODO: *samples
> +        let tiles_per_mtile_x = align(div_ceil(tiles_x, mtiles_x), 4);
> +        let tiles_per_mtile_y = align(div_ceil(tiles_y, mtiles_y), 4);
> +        let tiles_per_mtile = tiles_per_mtile_x * tiles_per_mtile_y;
> +
> +        let mtile_x1 = tiles_per_mtile_x;
> +        let mtile_x2 = 2 * tiles_per_mtile_x;
> +        let mtile_x3 = 3 * tiles_per_mtile_x;
> +
> +        let mtile_y1 = tiles_per_mtile_y;
> +        let mtile_y2 = 2 * tiles_per_mtile_y;
> +        let mtile_y3 = 3 * tiles_per_mtile_y;
> +
> +        let rgn_entry_size = 5;
> +        // Macrotile stride in 32-bit words
> +        let rgn_size = align(rgn_entry_size * tiles_per_mtile * utiles_per_tile, 4) / 4;
> +        let tilemap_size = (4 * rgn_size * mtiles * layers) as usize;
> +
> +        let tpc_entry_size = 8;
> +        // TPC stride in 32-bit words
> +        let tpc_mtile_stride = tpc_entry_size * utiles_per_tile * tiles_per_mtile / 4;
> +        let tpc_size = (num_clusters * (4 * tpc_mtile_stride * mtiles) * layers) as usize;
> +
> +        // No idea where this comes from, but it fits what macOS does...
> +        // TODO: layers?
> +        let meta1_blocks = if num_clusters > 1 {
> +            div_ceil(align(tiles_x, 2) * align(tiles_y, 4), 0x1980)
> +        } else {
> +            0
> +        };
> +
> +        let min_tvb_blocks =
> +            div_ceil(tiles_x * tiles_y, 128).max(if num_clusters > 1 { 9 } else { 8 }) as usize;
> +
> +        // Sometimes clustering seems to use twice the cluster tilemap count
> +        // and twice the meta4 size. TODO: Is this random or can we calculate
> +        // it somehow??? Does it go higher???
> +        let cluster_factor = 2;
> +
> +        Ok(buffer::TileInfo {
> +            tiles_x,
> +            tiles_y,
> +            tiles,
> +            utile_width,
> +            utile_height,
> +            //mtiles_x,
> +            //mtiles_y,
> +            tiles_per_mtile_x,
> +            tiles_per_mtile_y,
> +            //tiles_per_mtile,
> +            utiles_per_mtile_x: tiles_per_mtile_x * utiles_per_tile_x,
> +            utiles_per_mtile_y: tiles_per_mtile_y * utiles_per_tile_y,
> +            //utiles_per_mtile: tiles_per_mtile * utiles_per_tile,
> +            tilemap_size,
> +            tpc_size,
> +            meta1_blocks,
> +            min_tvb_blocks,
> +            cluster_factor,
> +            params: fw::vertex::raw::TilingParameters {
> +                rgn_size,
> +                unk_4: 0x88,
> +                ppp_ctrl: cmdbuf.ppp_ctrl,
> +                x_max: (width - 1) as u16,
> +                y_max: (height - 1) as u16,
> +                te_screen: ((tiles_y - 1) << 12) | (tiles_x - 1),
> +                te_mtile1: mtile_x3 | (mtile_x2 << 9) | (mtile_x1 << 18),
> +                te_mtile2: mtile_y3 | (mtile_y2 << 9) | (mtile_y1 << 18),
> +                tiles_per_mtile,
> +                tpc_stride: tpc_mtile_stride,
> +                unk_24: 0x100,
> +                unk_28: if layers > 1 {
> +                    0xe000 | (layers - 1)
> +                } else {
> +                    0x8000
> +                },
> +            },
> +        })
> +    }
> +
> +    /// Submit work to a render queue.
> +    pub(super) fn submit_render(
> +        &self,
> +        job: &mut Job<super::QueueJob::ver>,
> +        cmd: &bindings::drm_asahi_command,
> +        result_writer: Option<super::ResultWriter>,
> +        id: u64,
> +        flush_stamps: bool,
> +    ) -> Result {
> +        if cmd.cmd_type != bindings::drm_asahi_cmd_type_DRM_ASAHI_CMD_RENDER {
> +            return Err(EINVAL);
> +        }
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Render!\n", id);
> +
> +        let mut cmdbuf_reader = unsafe {
> +            UserSlicePtr::new(
> +                cmd.cmd_buffer as usize as *mut _,
> +                core::mem::size_of::<bindings::drm_asahi_cmd_render>(),
> +            )
> +            .reader()
> +        };
> +
> +        let mut cmdbuf: MaybeUninit<bindings::drm_asahi_cmd_render> = MaybeUninit::uninit();
> +        unsafe {
> +            cmdbuf_reader.read_raw(
> +                cmdbuf.as_mut_ptr() as *mut u8,
> +                core::mem::size_of::<bindings::drm_asahi_cmd_render>(),
> +            )?;
> +        }
> +        let cmdbuf = unsafe { cmdbuf.assume_init() };
> +
> +        if cmdbuf.flags
> +            & !(bindings::ASAHI_RENDER_NO_CLEAR_PIPELINE_TEXTURES
> +                | bindings::ASAHI_RENDER_SET_WHEN_RELOADING_Z_OR_S
> +                | bindings::ASAHI_RENDER_MEMORYLESS_RTS_USED
> +                | bindings::ASAHI_RENDER_PROCESS_EMPTY_TILES
> +                | bindings::ASAHI_RENDER_NO_VERTEX_CLUSTERING) as u64
> +            != 0
> +        {
> +            return Err(EINVAL);
> +        }
> +
> +        if cmdbuf.flags & bindings::ASAHI_RENDER_MEMORYLESS_RTS_USED as u64 != 0 {
> +            // Not supported yet
> +            return Err(EINVAL);
> +        }
> +
> +        if cmdbuf.fb_width == 0
> +            || cmdbuf.fb_height == 0
> +            || cmdbuf.fb_width > 16384
> +            || cmdbuf.fb_height > 16384
> +        {
> +            mod_dev_dbg!(
> +                self.dev,
> +                "[Submission {}] Invalid dimensions {}x{}\n",
> +                id,
> +                cmdbuf.fb_width,
> +                cmdbuf.fb_height
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        let dev = self.dev.data();
> +        let gpu = match dev.gpu.as_any().downcast_ref::<gpu::GpuManager::ver>() {
> +            Some(gpu) => gpu,
> +            None => {
> +                dev_crit!(self.dev, "GpuManager mismatched with Queue!\n");
> +                return Err(EIO);
> +            }
> +        };
> +
> +        let nclusters = gpu.get_dyncfg().id.num_clusters;
> +
> +        // Can be set to false to disable clustering (for simpler jobs), but then the
> +        // core masks below should be adjusted to cover a single rolling cluster.
> +        let mut clustering = nclusters > 1;
> +
> +        if debug_enabled(debug::DebugFlags::DisableClustering)
> +            || cmdbuf.flags & bindings::ASAHI_RENDER_NO_VERTEX_CLUSTERING as u64 != 0
> +        {
> +            clustering = false;
> +        }
> +
> +        #[ver(G < G14)]
> +        let tiling_control = {
> +            let render_cfg = gpu.get_cfg().render;
> +            let mut tiling_control = render_cfg.tiling_control;
> +
> +            if !clustering {
> +                tiling_control |= TILECTL_DISABLE_CLUSTERING;
> +            }
> +            tiling_control
> +        };
> +
> +        let mut alloc = gpu.alloc();
> +        let kalloc = &mut *alloc;
> +
> +        // This sequence number increases per new client/VM? assigned to some slot,
> +        // but it's unclear *which* slot...
> +        let slot_client_seq: u8 = (self.id & 0xff) as u8;
> +
> +        let tile_info = Self::get_tiling_params(&cmdbuf, if clustering { nclusters } else { 1 })?;
> +
> +        let buffer = self.buffer.as_ref().ok_or(EINVAL)?.lock();
> +
> +        let scene = Arc::try_new(buffer.new_scene(kalloc, &tile_info)?)?;
> +
> +        let notifier = self.notifier.clone();
> +
> +        let tvb_autogrown = buffer.auto_grow()?;
> +        if tvb_autogrown {
> +            let new_size = buffer.block_count() as usize;
> +            cls_dev_dbg!(
> +                TVBStats,
> +                &self.dev,
> +                "[Submission {}] TVB grew to {} bytes ({} blocks) due to overflows\n",
> +                id,
> +                new_size * buffer::BLOCK_SIZE,
> +                new_size,
> +            );
> +        }
> +
> +        let tvb_grown = buffer.ensure_blocks(tile_info.min_tvb_blocks)?;
> +        if tvb_grown {
> +            cls_dev_dbg!(
> +                TVBStats,
> +                &self.dev,
> +                "[Submission {}] TVB grew to {} bytes ({} blocks) due to dimensions ({}x{})\n",
> +                id,
> +                tile_info.min_tvb_blocks * buffer::BLOCK_SIZE,
> +                tile_info.min_tvb_blocks,
> +                cmdbuf.fb_width,
> +                cmdbuf.fb_height
> +            );
> +        }
> +
> +        let vm_bind = job.vm_bind.clone();
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] VM slot = {}\n",
> +            id,
> +            vm_bind.slot()
> +        );
> +
> +        let ev_vtx = job.get_vtx()?.event_info();
> +        let ev_frag = job.get_frag()?.event_info();
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] Vert event #{} -> {:#x?}\n",
> +            id,
> +            ev_vtx.slot,
> +            ev_vtx.value.next(),
> +        );
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] Frag event #{} -> {:#x?}\n",
> +            id,
> +            ev_frag.slot,
> +            ev_frag.value.next(),
> +        );
> +
> +        let uuid_3d = cmdbuf.cmd_3d_id;
> +        let uuid_ta = cmdbuf.cmd_ta_id;
> +
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] Vert UUID = {:#x?}\n",
> +            id,
> +            uuid_ta
> +        );
> +        mod_dev_dbg!(
> +            self.dev,
> +            "[Submission {}] Frag UUID = {:#x?}\n",
> +            id,
> +            uuid_3d
> +        );
> +
> +        let fence = job.fence.clone();
> +        let frag_job = job.get_frag()?;
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Create Barrier\n", id);
> +        let barrier: GpuObject<fw::workqueue::Barrier> = kalloc.private.new_inplace(
> +            Default::default(),
> +            |_inner, ptr: &mut MaybeUninit<fw::workqueue::raw::Barrier>| {
> +                Ok(place!(
> +                    ptr,
> +                    fw::workqueue::raw::Barrier {
> +                        tag: fw::workqueue::CommandType::Barrier,
> +                        wait_stamp: ev_vtx.fw_stamp_pointer,
> +                        wait_value: ev_vtx.value.next(),
> +                        wait_slot: ev_vtx.slot,
> +                        stamp_self: ev_frag.value.next(),
> +                        uuid: uuid_3d,
> +                        unk: 0,
> +                    }
> +                ))
> +            },
> +        )?;
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Add Barrier\n", id);
> +        frag_job.add(barrier, vm_bind.slot())?;
> +
> +        let timestamps = Arc::try_new(kalloc.shared.new_default::<fw::job::RenderTimestamps>()?)?;
> +
> +        let unk1 = debug_enabled(debug::DebugFlags::Debug1);
> +        let unk2 = debug_enabled(debug::DebugFlags::Debug2);
> +        let unk3 = debug_enabled(debug::DebugFlags::Debug3);
> +
> +        let mut tile_config: u64 = 0;
> +        if !unk1 {
> +            tile_config |= 0x280;
> +        }
> +        if cmdbuf.layers > 1 {
> +            tile_config |= 1;
> +        }
> +        if cmdbuf.flags & bindings::ASAHI_RENDER_PROCESS_EMPTY_TILES as u64 != 0 {
> +            tile_config |= 0x10000;
> +        }
> +
> +        let mut utile_config =
> +            ((tile_info.utile_width / 16) << 12) | ((tile_info.utile_height / 16) << 14);
> +        utile_config |= match cmdbuf.samples {
> +            1 => 0,
> +            2 => 1,
> +            4 => 2,
> +            _ => return Err(EINVAL),
> +        };
> +
> +        let frag_result = result_writer
> +            .map(|writer| {
> +                let mut result = RenderResult {
> +                    result: Default::default(),
> +                    vtx_complete: false,
> +                    frag_complete: false,
> +                    vtx_error: None,
> +                    frag_error: None,
> +                    writer,
> +                };
> +
> +                if tvb_autogrown {
> +                    result.result.flags |= bindings::DRM_ASAHI_RESULT_RENDER_TVB_GROW_OVF as u64;
> +                }
> +                if tvb_grown {
> +                    result.result.flags |= bindings::DRM_ASAHI_RESULT_RENDER_TVB_GROW_MIN as u64;
> +                }
> +                result.result.tvb_size_bytes = buffer.size() as u64;
> +
> +                Arc::try_new(Mutex::new(result))
> +            })
> +            .transpose()?;
> +
> +        let vtx_result = frag_result.clone();
> +
> +        // TODO: check
> +        #[ver(V >= V13_0B4)]
> +        let count_frag = self.counter.fetch_add(2, Ordering::Relaxed);
> +        #[ver(V >= V13_0B4)]
> +        let count_vtx = count_frag + 1;
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Create Frag\n", id);
> +        let frag = GpuObject::new_prealloc(
> +            kalloc.private.alloc_object()?,
> +            |ptr: GpuWeakPointer<fw::fragment::RunFragment::ver>| {
> +                let mut builder = microseq::Builder::new();
> +
> +                let stats = inner_weak_ptr!(
> +                    gpu.initdata.runtime_pointers.stats.frag.weak_pointer(),
> +                    stats
> +                );
> +
> +                let start_frag = builder.add(microseq::StartFragment::ver {
> +                    header: microseq::op::StartFragment::HEADER,
> +                    job_params2: inner_weak_ptr!(ptr, job_params2),
> +                    job_params1: inner_weak_ptr!(ptr, job_params1),
> +                    scene: scene.gpu_pointer(),
> +                    stats,
> +                    busy_flag: inner_weak_ptr!(ptr, busy_flag),
> +                    tvb_overflow_count: inner_weak_ptr!(ptr, tvb_overflow_count),
> +                    unk_pointer: inner_weak_ptr!(ptr, unk_pointee),
> +                    work_queue: ev_frag.info_ptr,
> +                    work_item: ptr,
> +                    vm_slot: vm_bind.slot(),
> +                    unk_50: 0x1, // fixed
> +                    event_generation: self.id as u32,
> +                    buffer_slot: scene.slot(),
> +                    unk_5c: 0,
> +                    cmd_seq: U64(ev_frag.cmd_seq),
> +                    unk_68: 0,
> +                    unk_758_flag: inner_weak_ptr!(ptr, unk_758_flag),
> +                    unk_job_buf: inner_weak_ptr!(ptr, unk_buf_0),
> +                    unk_7c: 0,
> +                    unk_80: 0,
> +                    unk_84: 0,
> +                    uuid: uuid_3d,
> +                    attachments: common::build_attachments(
> +                        cmdbuf.attachments,
> +                        cmdbuf.attachment_count,
> +                    )?,
> +                    unk_190: 0,
> +                    #[ver(V >= V13_0B4)]
> +                    counter: U64(count_frag),
> +                    #[ver(V >= V13_0B4)]
> +                    notifier_buf: inner_weak_ptr!(notifier.weak_pointer(), state.unk_buf),
> +                })?;
> +
> +                if frag_result.is_some() {
> +                    builder.add(microseq::Timestamp::ver {
> +                        header: microseq::op::Timestamp::new(true),
> +                        cur_ts: inner_weak_ptr!(ptr, cur_ts),
> +                        start_ts: inner_weak_ptr!(ptr, start_ts),
> +                        update_ts: inner_weak_ptr!(ptr, start_ts),
> +                        work_queue: ev_frag.info_ptr,
> +                        unk_24: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: inner_weak_ptr!(ptr, unk_ts),
> +                        uuid: uuid_3d,
> +                        unk_30_padding: 0,
> +                    })?;
> +                }
> +
> +                builder.add(microseq::WaitForIdle {
> +                    header: microseq::op::WaitForIdle::new(microseq::Pipe::Fragment),
> +                })?;
> +
> +                if frag_result.is_some() {
> +                    builder.add(microseq::Timestamp::ver {
> +                        header: microseq::op::Timestamp::new(false),
> +                        cur_ts: inner_weak_ptr!(ptr, cur_ts),
> +                        start_ts: inner_weak_ptr!(ptr, start_ts),
> +                        update_ts: inner_weak_ptr!(ptr, end_ts),
> +                        work_queue: ev_frag.info_ptr,
> +                        unk_24: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: inner_weak_ptr!(ptr, unk_ts),
> +                        uuid: uuid_3d,
> +                        unk_30_padding: 0,
> +                    })?;
> +                }
> +
> +                let off = builder.offset_to(start_frag);
> +                builder.add(microseq::FinalizeFragment::ver {
> +                    header: microseq::op::FinalizeFragment::HEADER,
> +                    uuid: uuid_3d,
> +                    unk_8: 0,
> +                    fw_stamp: ev_frag.fw_stamp_pointer,
> +                    stamp_value: ev_frag.value.next(),
> +                    unk_18: 0,
> +                    scene: scene.weak_pointer(),
> +                    buffer: scene.weak_buffer_pointer(),
> +                    unk_2c: U64(1),
> +                    stats,
> +                    unk_pointer: inner_weak_ptr!(ptr, unk_pointee),
> +                    busy_flag: inner_weak_ptr!(ptr, busy_flag),
> +                    work_queue: ev_frag.info_ptr,
> +                    work_item: ptr,
> +                    vm_slot: vm_bind.slot(),
> +                    unk_60: 0,
> +                    unk_758_flag: inner_weak_ptr!(ptr, unk_758_flag),
> +                    unk_6c: U64(0),
> +                    unk_74: U64(0),
> +                    unk_7c: U64(0),
> +                    unk_84: U64(0),
> +                    unk_8c: U64(0),
> +                    #[ver(G == G14 && V < V13_0B4)]
> +                    unk_8c_g14: U64(0),
> +                    restart_branch_offset: off,
> +                    unk_98: unk3.into(),
> +                    #[ver(V >= V13_0B4)]
> +                    unk_9c: Default::default(),
> +                })?;
> +
> +                builder.add(microseq::RetireStamp {
> +                    header: microseq::op::RetireStamp::HEADER,
> +                })?;
> +
> +                Ok(box_in_place!(fw::fragment::RunFragment::ver {
> +                    notifier: notifier.clone(),
> +                    scene: scene.clone(),
> +                    micro_seq: builder.build(&mut kalloc.private)?,
> +                    vm_bind: vm_bind.clone(),
> +                    aux_fb: self.ualloc.lock().array_empty(0x8000)?,
> +                    timestamps: timestamps.clone(),
> +                })?)
> +            },
> +            |inner, ptr| {
> +                let aux_fb_info = fw::fragment::raw::AuxFBInfo::ver {
> +                    iogpu_unk_214: cmdbuf.iogpu_unk_214,
> +                    unk2: 0,
> +                    width: cmdbuf.fb_width,
> +                    height: cmdbuf.fb_height,
> +                    #[ver(V >= V13_0B4)]
> +                    unk3: U64(0x100000),
> +                };
> +
> +                Ok(place!(
> +                    ptr,
> +                    fw::fragment::raw::RunFragment::ver {
> +                        tag: fw::workqueue::CommandType::RunFragment,
> +                        #[ver(V >= V13_0B4)]
> +                        counter: U64(count_frag),
> +                        vm_slot: vm_bind.slot(),
> +                        unk_8: 0,
> +                        microsequence: inner.micro_seq.gpu_pointer(),
> +                        microsequence_size: inner.micro_seq.len() as u32,
> +                        notifier: inner.notifier.gpu_pointer(),
> +                        buffer: inner.scene.buffer_pointer(),
> +                        scene: inner.scene.gpu_pointer(),
> +                        unk_buffer_buf: inner.scene.kernel_buffer_pointer(),
> +                        tvb_tilemap: inner.scene.tvb_tilemap_pointer(),
> +                        ppp_multisamplectl: U64(cmdbuf.ppp_multisamplectl),
> +                        samples: cmdbuf.samples,
> +                        tiles_per_mtile_y: tile_info.tiles_per_mtile_y as u16,
> +                        tiles_per_mtile_x: tile_info.tiles_per_mtile_x as u16,
> +                        unk_50: U64(0),
> +                        unk_58: U64(0),
> +                        merge_upper_x: F32::from_bits(cmdbuf.merge_upper_x),
> +                        merge_upper_y: F32::from_bits(cmdbuf.merge_upper_y),
> +                        unk_68: U64(0),
> +                        tile_count: U64(tile_info.tiles as u64),
> +                        job_params1: fw::fragment::raw::JobParameters1::ver {
> +                            utile_config: utile_config,
> +                            unk_4: 0,
> +                            clear_pipeline: fw::fragment::raw::ClearPipelineBinding {
> +                                pipeline_bind: U64(cmdbuf.load_pipeline_bind as u64),
> +                                address: U64(cmdbuf.load_pipeline as u64),
> +                            },
> +                            ppp_multisamplectl: U64(cmdbuf.ppp_multisamplectl),
> +                            scissor_array: U64(cmdbuf.scissor_array),
> +                            depth_bias_array: U64(cmdbuf.depth_bias_array),
> +                            aux_fb_info: aux_fb_info,
> +                            depth_dimensions: U64(cmdbuf.depth_dimensions as u64),
> +                            visibility_result_buffer: U64(cmdbuf.visibility_result_buffer),
> +                            zls_ctrl: U64(cmdbuf.zls_ctrl),
> +                            #[ver(G >= G14)]
> +                            unk_58_g14_0: U64(0x4040404),
> +                            #[ver(G >= G14)]
> +                            unk_58_g14_8: U64(0),
> +                            depth_buffer_ptr1: U64(cmdbuf.depth_buffer_1),
> +                            depth_buffer_ptr2: U64(cmdbuf.depth_buffer_2),
> +                            stencil_buffer_ptr1: U64(cmdbuf.stencil_buffer_1),
> +                            stencil_buffer_ptr2: U64(cmdbuf.stencil_buffer_2),
> +                            #[ver(G >= G14)]
> +                            unk_68_g14_0: Default::default(),
> +                            unk_78: Default::default(),
> +                            depth_meta_buffer_ptr1: U64(cmdbuf.depth_meta_buffer_1),
> +                            unk_a0: Default::default(),
> +                            depth_meta_buffer_ptr2: U64(cmdbuf.depth_meta_buffer_2),
> +                            unk_b0: Default::default(),
> +                            stencil_meta_buffer_ptr1: U64(cmdbuf.stencil_meta_buffer_1),
> +                            unk_c0: Default::default(),
> +                            stencil_meta_buffer_ptr2: U64(cmdbuf.stencil_meta_buffer_2),
> +                            unk_d0: Default::default(),
> +                            tvb_tilemap: inner.scene.tvb_tilemap_pointer(),
> +                            tvb_heapmeta: inner.scene.tvb_heapmeta_pointer(),
> +                            mtile_stride_dwords: U64((4 * tile_info.params.rgn_size as u64) << 24),
> +                            tvb_heapmeta_2: inner.scene.tvb_heapmeta_pointer(),
> +                            tile_config: U64(tile_config),
> +                            aux_fb: inner.aux_fb.gpu_pointer(),
> +                            unk_108: Default::default(),
> +                            pipeline_base: U64(0x11_00000000),
> +                            unk_140: U64(0x8c60),
> +                            unk_148: U64(0x0),
> +                            unk_150: U64(0x0),
> +                            unk_158: U64(0x1c),
> +                            unk_160: U64(0),
> +                            unk_168_padding: Default::default(),
> +                            #[ver(V < V13_0B4)]
> +                            __pad0: Default::default(),
> +                        },
> +                        job_params2: fw::fragment::raw::JobParameters2 {
> +                            store_pipeline_bind: cmdbuf.store_pipeline_bind,
> +                            store_pipeline_addr: cmdbuf.store_pipeline,
> +                            unk_8: 0x0,
> +                            unk_c: 0x0,
> +                            merge_upper_x: F32::from_bits(cmdbuf.merge_upper_x),
> +                            merge_upper_y: F32::from_bits(cmdbuf.merge_upper_y),
> +                            unk_18: U64(0x0),
> +                            utiles_per_mtile_y: tile_info.utiles_per_mtile_y as u16,
> +                            utiles_per_mtile_x: tile_info.utiles_per_mtile_x as u16,
> +                            unk_24: 0x0,
> +                            tile_counts: ((tile_info.tiles_y - 1) << 12) | (tile_info.tiles_x - 1),
> +                            iogpu_unk_212: cmdbuf.iogpu_unk_212,
> +                            isp_bgobjdepth: cmdbuf.isp_bgobjdepth,
> +                            // TODO: does this flag need to be exposed to userspace?
> +                            isp_bgobjvals: cmdbuf.isp_bgobjvals | 0x400,
> +                            unk_38: 0x0,
> +                            unk_3c: 0x1,
> +                            unk_40: 0,
> +                        },
> +                        job_params3: fw::fragment::raw::JobParameters3::ver {
> +                            unk_44_padding: Default::default(),
> +                            depth_bias_array: fw::fragment::raw::ArrayAddr {
> +                                ptr: U64(cmdbuf.depth_bias_array),
> +                                unk_padding: U64(0),
> +                            },
> +                            scissor_array: fw::fragment::raw::ArrayAddr {
> +                                ptr: U64(cmdbuf.scissor_array),
> +                                unk_padding: U64(0),
> +                            },
> +                            visibility_result_buffer: U64(cmdbuf.visibility_result_buffer),
> +                            unk_118: U64(0x0),
> +                            unk_120: Default::default(),
> +                            unk_reload_pipeline: fw::fragment::raw::ClearPipelineBinding {
> +                                pipeline_bind: U64(cmdbuf.partial_reload_pipeline_bind as u64),
> +                                address: U64(cmdbuf.partial_reload_pipeline as u64),
> +                            },
> +                            unk_258: U64(0),
> +                            unk_260: U64(0),
> +                            unk_268: U64(0),
> +                            unk_270: U64(0),
> +                            reload_pipeline: fw::fragment::raw::ClearPipelineBinding {
> +                                pipeline_bind: U64(cmdbuf.partial_reload_pipeline_bind as u64),
> +                                address: U64(cmdbuf.partial_reload_pipeline as u64),
> +                            },
> +                            zls_ctrl: U64(cmdbuf.zls_ctrl),
> +                            unk_290: U64(0x0),
> +                            depth_buffer_ptr1: U64(cmdbuf.depth_buffer_1),
> +                            unk_2a0: U64(0x0),
> +                            unk_2a8: U64(0x0),
> +                            depth_buffer_ptr2: U64(cmdbuf.depth_buffer_2),
> +                            depth_buffer_ptr3: U64(cmdbuf.depth_buffer_3),
> +                            depth_meta_buffer_ptr3: U64(cmdbuf.depth_meta_buffer_3),
> +                            stencil_buffer_ptr1: U64(cmdbuf.stencil_buffer_1),
> +                            unk_2d0: U64(0x0),
> +                            unk_2d8: U64(0x0),
> +                            stencil_buffer_ptr2: U64(cmdbuf.stencil_buffer_2),
> +                            stencil_buffer_ptr3: U64(cmdbuf.stencil_buffer_3),
> +                            stencil_meta_buffer_ptr3: U64(cmdbuf.stencil_meta_buffer_3),
> +                            unk_2f8: Default::default(),
> +                            iogpu_unk_212: cmdbuf.iogpu_unk_212,
> +                            unk_30c: 0x0,
> +                            aux_fb_info: aux_fb_info,
> +                            unk_320_padding: Default::default(),
> +                            unk_partial_store_pipeline:
> +                                fw::fragment::raw::StorePipelineBinding::new(
> +                                    cmdbuf.partial_store_pipeline_bind,
> +                                    cmdbuf.partial_store_pipeline
> +                                ),
> +                            partial_store_pipeline: fw::fragment::raw::StorePipelineBinding::new(
> +                                cmdbuf.partial_store_pipeline_bind,
> +                                cmdbuf.partial_store_pipeline
> +                            ),
> +                            isp_bgobjdepth: cmdbuf.isp_bgobjdepth,
> +                            isp_bgobjvals: cmdbuf.isp_bgobjvals,
> +                            iogpu_unk_49: cmdbuf.iogpu_unk_49,
> +                            unk_37c: 0x0,
> +                            unk_380: U64(0x0),
> +                            unk_388: U64(0x0),
> +                            #[ver(V >= V13_0B4)]
> +                            unk_390_0: U64(0x0),
> +                            depth_dimensions: U64(cmdbuf.depth_dimensions as u64),
> +                        },
> +                        unk_758_flag: 0,
> +                        unk_75c_flag: 0,
> +                        unk_buf: Default::default(),
> +                        busy_flag: 0,
> +                        tvb_overflow_count: 0,
> +                        unk_878: 0,
> +                        encoder_params: fw::job::raw::EncoderParams {
> +                            unk_8: (cmdbuf.flags
> +                                & bindings::ASAHI_RENDER_SET_WHEN_RELOADING_Z_OR_S as u64
> +                                != 0) as u32,
> +                            unk_c: 0x0,  // fixed
> +                            unk_10: 0x0, // fixed
> +                            encoder_id: cmdbuf.encoder_id,
> +                            unk_18: 0x0, // fixed
> +                            iogpu_compute_unk44: 0xffffffff,
> +                            seq_buffer: inner.scene.seq_buf_pointer(),
> +                            unk_28: U64(0x0), // fixed
> +                        },
> +                        process_empty_tiles: (cmdbuf.flags
> +                            & bindings::ASAHI_RENDER_PROCESS_EMPTY_TILES as u64
> +                            != 0) as u32,
> +                        no_clear_pipeline_textures: (cmdbuf.flags
> +                            & bindings::ASAHI_RENDER_NO_CLEAR_PIPELINE_TEXTURES as u64
> +                            != 0) as u32,
> +                        unk_param: unk2.into(), // 1 for boot stuff?
> +                        unk_pointee: 0,
> +                        meta: fw::job::raw::JobMeta {
> +                            unk_4: 0,
> +                            stamp: ev_frag.stamp_pointer,
> +                            fw_stamp: ev_frag.fw_stamp_pointer,
> +                            stamp_value: ev_frag.value.next(),
> +                            stamp_slot: ev_frag.slot,
> +                            evctl_index: 0, // fixed
> +                            flush_stamps: flush_stamps as u32,
> +                            uuid: uuid_3d,
> +                            cmd_seq: ev_frag.cmd_seq as u32,
> +                        },
> +                        unk_after_meta: unk1.into(),
> +                        unk_buf_0: U64(0),
> +                        unk_buf_8: U64(0),
> +                        unk_buf_10: U64(1),
> +                        cur_ts: U64(0),
> +                        start_ts: Some(inner_ptr!(inner.timestamps.gpu_pointer(), frag.start)),
> +                        end_ts: Some(inner_ptr!(inner.timestamps.gpu_pointer(), frag.end)),
> +                        unk_914: 0,
> +                        unk_918: U64(0),
> +                        unk_920: 0,
> +                        client_sequence: slot_client_seq,
> +                        pad_925: Default::default(),
> +                        unk_928: 0,
> +                        unk_92c: 0,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_92d_8: Default::default(),
> +                    }
> +                ))
> +            },
> +        )?;
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Add Frag\n", id);
> +        fence.add_command();
> +
> +        frag_job.add_cb(frag, vm_bind.slot(), move |cmd, error| {
> +            if let Some(err) = error {
> +                fence.set_error(err.into());
> +            }
> +            if let Some(mut res) = frag_result.as_ref().map(|a| a.lock()) {
> +                cmd.timestamps.with(|raw, _inner| {
> +                    res.result.fragment_ts_start = raw.frag.start.load(Ordering::Relaxed);
> +                    res.result.fragment_ts_end = raw.frag.end.load(Ordering::Relaxed);
> +                });
> +                cmd.with(|raw, _inner| {
> +                    res.result.num_tvb_overflows = raw.tvb_overflow_count;
> +                });
> +                res.frag_error = error;
> +                res.frag_complete = true;
> +                res.commit();
> +            }
> +            fence.command_complete();
> +        })?;
> +
> +        let fence = job.fence.clone();
> +        let vtx_job = job.get_vtx()?;
> +
> +        if scene.rebind() || tvb_grown || tvb_autogrown {
> +            mod_dev_dbg!(self.dev, "[Submission {}] Create Bind Buffer\n", id);
> +            let bind_buffer = kalloc.private.new_inplace(
> +                fw::buffer::InitBuffer::ver {
> +                    scene: scene.clone(),
> +                },
> +                |inner, ptr: &mut MaybeUninit<fw::buffer::raw::InitBuffer::ver<'_>>| {
> +                    Ok(place!(
> +                        ptr,
> +                        fw::buffer::raw::InitBuffer::ver {
> +                            tag: fw::workqueue::CommandType::InitBuffer,
> +                            vm_slot: vm_bind.slot(),
> +                            buffer_slot: inner.scene.slot(),
> +                            unk_c: 0,
> +                            block_count: buffer.block_count(),
> +                            buffer: inner.scene.buffer_pointer(),
> +                            stamp_value: ev_vtx.value.next(),
> +                        }
> +                    ))
> +                },
> +            )?;
> +
> +            mod_dev_dbg!(self.dev, "[Submission {}] Add Bind Buffer\n", id);
> +            vtx_job.add(bind_buffer, vm_bind.slot())?;
> +        }
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Create Vertex\n", id);
> +        let vtx = GpuObject::new_prealloc(
> +            kalloc.private.alloc_object()?,
> +            |ptr: GpuWeakPointer<fw::vertex::RunVertex::ver>| {
> +                let mut builder = microseq::Builder::new();
> +
> +                let stats = inner_weak_ptr!(
> +                    gpu.initdata.runtime_pointers.stats.vtx.weak_pointer(),
> +                    stats
> +                );
> +
> +                let start_vtx = builder.add(microseq::StartVertex::ver {
> +                    header: microseq::op::StartVertex::HEADER,
> +                    tiling_params: inner_weak_ptr!(ptr, tiling_params),
> +                    job_params1: inner_weak_ptr!(ptr, job_params1),
> +                    buffer: scene.weak_buffer_pointer(),
> +                    scene: scene.weak_pointer(),
> +                    stats,
> +                    work_queue: ev_vtx.info_ptr,
> +                    vm_slot: vm_bind.slot(),
> +                    unk_38: 1, // fixed
> +                    event_generation: self.id as u32,
> +                    buffer_slot: scene.slot(),
> +                    unk_44: 0,
> +                    cmd_seq: U64(ev_vtx.cmd_seq),
> +                    unk_50: 0,
> +                    unk_pointer: inner_weak_ptr!(ptr, unk_pointee),
> +                    unk_job_buf: inner_weak_ptr!(ptr, unk_buf_0),
> +                    unk_64: 0x0, // fixed
> +                    unk_68: unk1.into(),
> +                    uuid: uuid_ta,
> +                    unk_70: 0x0,                // fixed
> +                    unk_74: Default::default(), // fixed
> +                    unk_15c: 0x0,               // fixed
> +                    unk_160: U64(0x0),          // fixed
> +                    unk_168: 0x0,               // fixed
> +                    unk_16c: 0x0,               // fixed
> +                    unk_170: U64(0x0),          // fixed
> +                    #[ver(V >= V13_0B4)]
> +                    counter: U64(count_vtx),
> +                    #[ver(V >= V13_0B4)]
> +                    notifier_buf: inner_weak_ptr!(notifier.weak_pointer(), state.unk_buf),
> +                    unk_178: 0x0, // padding?
> +                })?;
> +
> +                if vtx_result.is_some() {
> +                    builder.add(microseq::Timestamp::ver {
> +                        header: microseq::op::Timestamp::new(true),
> +                        cur_ts: inner_weak_ptr!(ptr, cur_ts),
> +                        start_ts: inner_weak_ptr!(ptr, start_ts),
> +                        update_ts: inner_weak_ptr!(ptr, start_ts),
> +                        work_queue: ev_vtx.info_ptr,
> +                        unk_24: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: inner_weak_ptr!(ptr, unk_ts),
> +                        uuid: uuid_ta,
> +                        unk_30_padding: 0,
> +                    })?;
> +                }
> +
> +                builder.add(microseq::WaitForIdle {
> +                    header: microseq::op::WaitForIdle::new(microseq::Pipe::Vertex),
> +                })?;
> +
> +                if vtx_result.is_some() {
> +                    builder.add(microseq::Timestamp::ver {
> +                        header: microseq::op::Timestamp::new(false),
> +                        cur_ts: inner_weak_ptr!(ptr, cur_ts),
> +                        start_ts: inner_weak_ptr!(ptr, start_ts),
> +                        update_ts: inner_weak_ptr!(ptr, end_ts),
> +                        work_queue: ev_vtx.info_ptr,
> +                        unk_24: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: inner_weak_ptr!(ptr, unk_ts),
> +                        uuid: uuid_ta,
> +                        unk_30_padding: 0,
> +                    })?;
> +                }
> +
> +                let off = builder.offset_to(start_vtx);
> +                builder.add(microseq::FinalizeVertex::ver {
> +                    header: microseq::op::FinalizeVertex::HEADER,
> +                    scene: scene.weak_pointer(),
> +                    buffer: scene.weak_buffer_pointer(),
> +                    stats,
> +                    work_queue: ev_vtx.info_ptr,
> +                    vm_slot: vm_bind.slot(),
> +                    unk_28: 0x0, // fixed
> +                    unk_pointer: inner_weak_ptr!(ptr, unk_pointee),
> +                    unk_34: 0x0, // fixed
> +                    uuid: uuid_ta,
> +                    fw_stamp: ev_vtx.fw_stamp_pointer,
> +                    stamp_value: ev_vtx.value.next(),
> +                    unk_48: U64(0x0), // fixed
> +                    unk_50: 0x0,      // fixed
> +                    unk_54: 0x0,      // fixed
> +                    unk_58: U64(0x0), // fixed
> +                    unk_60: 0x0,      // fixed
> +                    unk_64: 0x0,      // fixed
> +                    unk_68: 0x0,      // fixed
> +                    #[ver(G >= G14 && V < V13_0B4)]
> +                    unk_68_g14: U64(0),
> +                    restart_branch_offset: off,
> +                    unk_70: 0x0, // fixed
> +                    #[ver(V >= V13_0B4)]
> +                    unk_74: Default::default(), // Ventura
> +                })?;
> +
> +                builder.add(microseq::RetireStamp {
> +                    header: microseq::op::RetireStamp::HEADER,
> +                })?;
> +
> +                Ok(box_in_place!(fw::vertex::RunVertex::ver {
> +                    notifier: notifier,
> +                    scene: scene.clone(),
> +                    micro_seq: builder.build(&mut kalloc.private)?,
> +                    vm_bind: vm_bind.clone(),
> +                    timestamps: timestamps,
> +                })?)
> +            },
> +            |inner, ptr| {
> +                #[ver(G < G14)]
> +                let core_masks = gpu.core_masks_packed();
> +                Ok(place!(
> +                    ptr,
> +                    fw::vertex::raw::RunVertex::ver {
> +                        tag: fw::workqueue::CommandType::RunVertex,
> +                        #[ver(V >= V13_0B4)]
> +                        counter: U64(count_vtx),
> +                        vm_slot: vm_bind.slot(),
> +                        unk_8: 0,
> +                        notifier: inner.notifier.gpu_pointer(),
> +                        buffer_slot: inner.scene.slot(),
> +                        unk_1c: 0,
> +                        buffer: inner.scene.buffer_pointer(),
> +                        scene: inner.scene.gpu_pointer(),
> +                        unk_buffer_buf: inner.scene.kernel_buffer_pointer(),
> +                        unk_34: 0,
> +                        job_params1: fw::vertex::raw::JobParameters1::ver {
> +                            unk_0: U64(if unk1 { 0 } else { 0x200 }), // sometimes 0
> +                            unk_8: f32!(1e-20),                       // fixed
> +                            unk_c: f32!(1e-20),                       // fixed
> +                            tvb_tilemap: inner.scene.tvb_tilemap_pointer(),
> +                            #[ver(G < G14)]
> +                            tvb_cluster_tilemaps: inner.scene.cluster_tilemaps_pointer(),
> +                            tpc: inner.scene.tpc_pointer(),
> +                            tvb_heapmeta: inner
> +                                .scene
> +                                .tvb_heapmeta_pointer()
> +                                .or(0x8000_0000_0000_0000),
> +                            iogpu_unk_54: 0x6b0003, // fixed
> +                            iogpu_unk_55: 0x3a0012, // fixed
> +                            iogpu_unk_56: U64(0x1), // fixed
> +                            #[ver(G < G14)]
> +                            tvb_cluster_meta1: inner
> +                                .scene
> +                                .meta_1_pointer()
> +                                .map(|x| x.or((tile_info.meta1_blocks as u64) << 50)),
> +                            utile_config: utile_config,
> +                            unk_4c: 0,
> +                            ppp_multisamplectl: U64(cmdbuf.ppp_multisamplectl), // fixed
> +                            tvb_heapmeta_2: inner.scene.tvb_heapmeta_pointer(),
> +                            #[ver(G < G14)]
> +                            unk_60: U64(0x0), // fixed
> +                            #[ver(G < G14)]
> +                            core_mask: Array::new([
> +                                *core_masks.first().unwrap_or(&0),
> +                                *core_masks.get(1).unwrap_or(&0),
> +                            ]),
> +                            preempt_buf1: inner.scene.preempt_buf_1_pointer(),
> +                            preempt_buf2: inner.scene.preempt_buf_2_pointer(),
> +                            unk_80: U64(0x1), // fixed
> +                            preempt_buf3: inner
> +                                .scene
> +                                .preempt_buf_3_pointer()
> +                                .or(0x4_0000_0000_0000), // check
> +                            encoder_addr: U64(cmdbuf.encoder_ptr),
> +                            #[ver(G < G14)]
> +                            tvb_cluster_meta2: inner.scene.meta_2_pointer(),
> +                            #[ver(G < G14)]
> +                            tvb_cluster_meta3: inner.scene.meta_3_pointer(),
> +                            #[ver(G < G14)]
> +                            tiling_control: tiling_control,
> +                            #[ver(G < G14)]
> +                            unk_ac: Default::default(), // fixed
> +                            unk_b0: Default::default(), // fixed
> +                            pipeline_base: U64(0x11_00000000),
> +                            #[ver(G < G14)]
> +                            tvb_cluster_meta4: inner
> +                                .scene
> +                                .meta_4_pointer()
> +                                .map(|x| x.or(0x3000_0000_0000_0000)),
> +                            #[ver(G < G14)]
> +                            unk_f0: U64(0x1c + align(tile_info.meta1_blocks, 4) as u64),
> +                            unk_f8: U64(0x8c60),         // fixed
> +                            unk_100: Default::default(), // fixed
> +                            unk_118: 0x1c,               // fixed
> +                            #[ver(G >= G14)]
> +                            __pad: Default::default(),
> +                        },
> +                        unk_154: Default::default(),
> +                        tiling_params: tile_info.params,
> +                        unk_3e8: Default::default(),
> +                        tpc: inner.scene.tpc_pointer(),
> +                        tpc_size: U64(tile_info.tpc_size as u64),
> +                        microsequence: inner.micro_seq.gpu_pointer(),
> +                        microsequence_size: inner.micro_seq.len() as u32,
> +                        fragment_stamp_slot: ev_frag.slot,
> +                        fragment_stamp_value: ev_frag.value.next(),
> +                        unk_pointee: 0,
> +                        unk_pad: 0,
> +                        job_params2: fw::vertex::raw::JobParameters2 {
> +                            unk_480: Default::default(), // fixed
> +                            unk_498: U64(0x0),           // fixed
> +                            unk_4a0: 0x0,                // fixed
> +                            preempt_buf1: inner.scene.preempt_buf_1_pointer(),
> +                            unk_4ac: 0x0,      // fixed
> +                            unk_4b0: U64(0x0), // fixed
> +                            unk_4b8: 0x0,      // fixed
> +                            unk_4bc: U64(0x0), // fixed
> +                            unk_4c4_padding: Default::default(),
> +                            unk_50c: 0x0,      // fixed
> +                            unk_510: U64(0x0), // fixed
> +                            unk_518: U64(0x0), // fixed
> +                            unk_520: U64(0x0), // fixed
> +                        },
> +                        encoder_params: fw::job::raw::EncoderParams {
> +                            unk_8: 0x0,  // fixed
> +                            unk_c: 0x0,  // fixed
> +                            unk_10: 0x0, // fixed
> +                            encoder_id: cmdbuf.encoder_id,
> +                            unk_18: 0x0, // fixed
> +                            iogpu_compute_unk44: 0xffffffff,
> +                            seq_buffer: inner.scene.seq_buf_pointer(),
> +                            unk_28: U64(0x0), // fixed
> +                        },
> +                        unk_55c: 0,
> +                        unk_560: 0,
> +                        memoryless_rts_used: (cmdbuf.flags
> +                            & bindings::ASAHI_RENDER_MEMORYLESS_RTS_USED as u64
> +                            != 0) as u32,
> +                        unk_568: 0,
> +                        unk_56c: 0,
> +                        meta: fw::job::raw::JobMeta {
> +                            unk_4: 0,
> +                            stamp: ev_vtx.stamp_pointer,
> +                            fw_stamp: ev_vtx.fw_stamp_pointer,
> +                            stamp_value: ev_vtx.value.next(),
> +                            stamp_slot: ev_vtx.slot,
> +                            evctl_index: 0, // fixed
> +                            flush_stamps: flush_stamps as u32,
> +                            uuid: uuid_ta,
> +                            cmd_seq: ev_vtx.cmd_seq as u32,
> +                        },
> +                        unk_after_meta: unk1.into(),
> +                        unk_buf_0: U64(0),
> +                        unk_buf_8: U64(0),
> +                        unk_buf_10: U64(0),
> +                        cur_ts: U64(0),
> +                        start_ts: Some(inner_ptr!(inner.timestamps.gpu_pointer(), vtx.start)),
> +                        end_ts: Some(inner_ptr!(inner.timestamps.gpu_pointer(), vtx.end)),
> +                        unk_5c4: 0,
> +                        unk_5c8: 0,
> +                        unk_5cc: 0,
> +                        unk_5d0: 0,
> +                        client_sequence: slot_client_seq,
> +                        pad_5d5: Default::default(),
> +                        unk_5d8: 0,
> +                        unk_5dc: 0,
> +                        #[ver(V >= V13_0B4)]
> +                        unk_ts: U64(0),
> +                        #[ver(V >= V13_0B4)]
> +                        unk_5dd_8: Default::default(),
> +                    }
> +                ))
> +            },
> +        )?;
> +
> +        core::mem::drop(alloc);
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Add Vertex\n", id);
> +        fence.add_command();
> +        vtx_job.add_cb(vtx, vm_bind.slot(), move |cmd, error| {
> +            if let Some(err) = error {
> +                fence.set_error(err.into())
> +            }
> +            if let Some(mut res) = vtx_result.as_ref().map(|a| a.lock()) {
> +                cmd.timestamps.with(|raw, _inner| {
> +                    res.result.vertex_ts_start = raw.vtx.start.load(Ordering::Relaxed);
> +                    res.result.vertex_ts_end = raw.vtx.end.load(Ordering::Relaxed);
> +                });
> +                res.result.tvb_usage_bytes = cmd.scene.used_bytes() as u64;
> +                if cmd.scene.overflowed() {
> +                    res.result.flags |= bindings::DRM_ASAHI_RESULT_RENDER_TVB_OVERFLOWED as u64;
> +                }
> +                res.vtx_error = error;
> +                res.vtx_complete = true;
> +                res.commit();
> +            }
> +            fence.command_complete();
> +        })?;
> +
> +        mod_dev_dbg!(self.dev, "[Submission {}] Increment counters\n", id);
> +        self.notifier.threshold.with(|raw, _inner| {
> +            raw.increment();
> +            raw.increment();
> +        });
> +
> +        // TODO: handle rollbacks, move to job submit?
> +        buffer.increment();
> +
> +        job.get_vtx()?.next_seq();
> +        job.get_frag()?.next_seq();
> +
> +        Ok(())
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/regs.rs b/drivers/gpu/drm/asahi/regs.rs
> new file mode 100644
> index 000000000000..019d7214793d
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/regs.rs
> @@ -0,0 +1,387 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! GPU MMIO register abstraction
> +//!
> +//! Since the vast majority of the interactions with the GPU are brokered through the firmware,
> +//! there is very little need to interact directly with GPU MMIO register. This module abstracts
> +//! the few operations that require that, mainly reading the MMU fault status, reading GPU ID
> +//! information, and starting the GPU firmware coprocessor.
> +
> +use crate::hw;
> +use kernel::{device, io_mem::IoMem, platform, prelude::*};
> +
> +/// Size of the ASC control MMIO region.
> +pub(crate) const ASC_CTL_SIZE: usize = 0x4000;
> +
> +/// Size of the SGX MMIO region.
> +pub(crate) const SGX_SIZE: usize = 0x1000000;
> +
> +const CPU_CONTROL: usize = 0x44;
> +const CPU_RUN: u32 = 0x1 << 4; // BIT(4)
> +
> +const FAULT_INFO: usize = 0x17030;
> +
> +const ID_VERSION: usize = 0xd04000;
> +const ID_UNK08: usize = 0xd04008;
> +const ID_COUNTS_1: usize = 0xd04010;
> +const ID_COUNTS_2: usize = 0xd04014;
> +const ID_UNK18: usize = 0xd04018;
> +const ID_CLUSTERS: usize = 0xd0401c;
> +
> +const CORE_MASK_0: usize = 0xd01500;
> +const CORE_MASK_1: usize = 0xd01514;
> +
> +/// Enum representing the unit that caused an MMU fault.
> +#[allow(non_camel_case_types)]
> +#[allow(clippy::upper_case_acronyms)]
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub(crate) enum FaultUnit {
> +    /// Decompress / pixel fetch
> +    DCMP(u8),
> +    /// USC L1 Cache (device loads/stores)
> +    UL1C(u8),
> +    /// Compress / pixel store
> +    CMP(u8),
> +    GSL1(u8),
> +    IAP(u8),
> +    VCE(u8),
> +    /// Tiling Engine
> +    TE(u8),
> +    RAS(u8),
> +    /// Vertex Data Master
> +    VDM(u8),
> +    PPP(u8),
> +    /// ISP Parameter Fetch
> +    IPF(u8),
> +    IPF_CPF(u8),
> +    VF(u8),
> +    VF_CPF(u8),
> +    /// Depth/Stencil load/store
> +    ZLS(u8),
> +
> +    /// Parameter Management
> +    dPM,
> +    /// Compute Data Master
> +    dCDM_KS(u8),
> +    dIPP,
> +    dIPP_CS,
> +    // Vertex Data Master
> +    dVDM_CSD,
> +    dVDM_SSD,
> +    dVDM_ILF,
> +    dVDM_ILD,
> +    dRDE(u8),
> +    FC,
> +    GSL2,
> +
> +    /// Graphics L2 Cache Control?
> +    GL2CC_META(u8),
> +    GL2CC_MB,
> +
> +    /// Parameter Management
> +    gPM_SP(u8),
> +    /// Vertex Data Master - CSD
> +    gVDM_CSD_SP(u8),
> +    gVDM_SSD_SP(u8),
> +    gVDM_ILF_SP(u8),
> +    gVDM_TFP_SP(u8),
> +    gVDM_MMB_SP(u8),
> +    /// Compute Data Master
> +    gCDM_CS_KS0_SP(u8),
> +    gCDM_CS_KS1_SP(u8),
> +    gCDM_CS_KS2_SP(u8),
> +    gCDM_KS0_SP(u8),
> +    gCDM_KS1_SP(u8),
> +    gCDM_KS2_SP(u8),
> +    gIPP_SP(u8),
> +    gIPP_CS_SP(u8),
> +    gRDE0_SP(u8),
> +    gRDE1_SP(u8),
> +
> +    Unknown(u8),
> +}
> +
> +/// Reason for an MMU fault.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub(crate) enum FaultReason {
> +    Unmapped,
> +    AfFault,
> +    WriteOnly,
> +    ReadOnly,
> +    NoAccess,
> +    Unknown(u8),
> +}
> +
> +/// Collection of information about an MMU fault.
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub(crate) struct FaultInfo {
> +    pub(crate) address: u64,
> +    pub(crate) sideband: u8,
> +    pub(crate) vm_slot: u32,
> +    pub(crate) unit_code: u8,
> +    pub(crate) unit: FaultUnit,
> +    pub(crate) level: u8,
> +    pub(crate) unk_5: u8,
> +    pub(crate) read: bool,
> +    pub(crate) reason: FaultReason,
> +}
> +
> +/// Device resources for this GPU instance.
> +pub(crate) struct Resources {
> +    dev: device::Device,
> +    asc: IoMem<ASC_CTL_SIZE>,
> +    sgx: IoMem<SGX_SIZE>,
> +}
> +
> +impl Resources {
> +    /// Map the required resources given our platform device.
> +    pub(crate) fn new(pdev: &mut platform::Device) -> Result<Resources> {
> +        // TODO: add device abstraction to ioremap by name
> +        let asc_res = unsafe { pdev.ioremap_resource(0)? };
> +        let sgx_res = unsafe { pdev.ioremap_resource(1)? };
> +
> +        Ok(Resources {
> +            // SAFETY: This device does DMA via the UAT IOMMU.
> +            dev: device::Device::from_dev(pdev),
> +            asc: asc_res,
> +            sgx: sgx_res,
> +        })
> +    }
> +
> +    fn sgx_read32(&self, off: usize) -> u32 {
> +        self.sgx.readl_relaxed(off)
> +    }
> +
> +    /* Not yet used
> +    fn sgx_write32(&self, off: usize, val: u32) {
> +        self.sgx.writel_relaxed(val, off)
> +    }
> +    */
> +
> +    fn sgx_read64(&self, off: usize) -> u64 {
> +        self.sgx.readq_relaxed(off)
> +    }
> +
> +    /* Not yet used
> +    fn sgx_write64(&self, off: usize, val: u64) {
> +        self.sgx.writeq_relaxed(val, off)
> +    }
> +    */
> +
> +    /// Initialize the MMIO registers for the GPU.
> +    pub(crate) fn init_mmio(&self) -> Result {
> +        // Nothing to do for now...
> +
> +        Ok(())
> +    }
> +
> +    /// Start the ASC coprocessor CPU.
> +    pub(crate) fn start_cpu(&self) -> Result {
> +        let val = self.asc.readl_relaxed(CPU_CONTROL);
> +
> +        self.asc.writel_relaxed(val | CPU_RUN, CPU_CONTROL);
> +
> +        Ok(())
> +    }
> +
> +    /// Get the GPU identification info from registers.
> +    ///
> +    /// See [`hw::GpuIdConfig`] for the result.
> +    pub(crate) fn get_gpu_id(&self) -> Result<hw::GpuIdConfig> {
> +        let id_version = self.sgx_read32(ID_VERSION);
> +        let id_unk08 = self.sgx_read32(ID_UNK08);
> +        let id_counts_1 = self.sgx_read32(ID_COUNTS_1);
> +        let id_counts_2 = self.sgx_read32(ID_COUNTS_2);
> +        let id_unk18 = self.sgx_read32(ID_UNK18);
> +        let id_clusters = self.sgx_read32(ID_CLUSTERS);
> +
> +        dev_info!(
> +            self.dev,
> +            "GPU ID registers: {:#x} {:#x} {:#x} {:#x} {:#x} {:#x}\n",
> +            id_version,
> +            id_unk08,
> +            id_counts_1,
> +            id_counts_2,
> +            id_unk18,
> +            id_clusters
> +        );
> +
> +        let core_mask_0 = self.sgx_read32(CORE_MASK_0);
> +        let core_mask_1 = self.sgx_read32(CORE_MASK_1);
> +        let mut core_mask = (core_mask_0 as u64) | ((core_mask_1 as u64) << 32);
> +
> +        dev_info!(self.dev, "Core mask: {:#x}\n", core_mask);
> +
> +        let num_clusters = (id_clusters >> 12) & 0xff;
> +        let num_cores = id_counts_1 & 0xff;
> +
> +        if num_cores * num_clusters > 64 {
> +            dev_err!(
> +                self.dev,
> +                "Too many total cores ({} x {} > 64)\n",
> +                num_clusters,
> +                num_cores
> +            );
> +            return Err(ENODEV);
> +        }
> +
> +        let mut core_masks = Vec::new();
> +        let mut total_active_cores: u32 = 0;
> +
> +        let max_core_mask = (1u64 << num_cores) - 1;
> +        for _i in 0..num_clusters {
> +            let mask = core_mask & max_core_mask;
> +            core_masks.try_push(mask as u32)?;
> +            core_mask >>= num_cores;
> +            total_active_cores += mask.count_ones();
> +        }
> +        let mut core_masks_packed = Vec::new();
> +        core_masks_packed.try_push(core_mask_0)?;
> +        if core_mask_1 != 0 {
> +            core_masks_packed.try_push(core_mask_1)?;
> +        }
> +
> +        if core_mask != 0 {
> +            dev_err!(self.dev, "Leftover core mask: {:#x}\n", core_mask);
> +            return Err(EIO);
> +        }
> +
> +        let (gpu_rev, gpu_rev_id) = match (id_version >> 8) & 0xff {
> +            0x00 => (hw::GpuRevision::A0, hw::GpuRevisionID::A0),
> +            0x01 => (hw::GpuRevision::A1, hw::GpuRevisionID::A1),
> +            0x10 => (hw::GpuRevision::B0, hw::GpuRevisionID::B0),
> +            0x11 => (hw::GpuRevision::B1, hw::GpuRevisionID::B1),
> +            0x20 => (hw::GpuRevision::C0, hw::GpuRevisionID::C0),
> +            0x21 => (hw::GpuRevision::C1, hw::GpuRevisionID::C1),
> +            a => {
> +                dev_err!(self.dev, "Unknown GPU revision {}\n", a);
> +                return Err(ENODEV);
> +            }
> +        };
> +
> +        Ok(hw::GpuIdConfig {
> +            gpu_gen: match (id_version >> 24) & 0xff {
> +                4 => hw::GpuGen::G13,
> +                5 => hw::GpuGen::G14,
> +                a => {
> +                    dev_err!(self.dev, "Unknown GPU generation {}\n", a);
> +                    return Err(ENODEV);
> +                }
> +            },
> +            gpu_variant: match (id_version >> 16) & 0xff {
> +                1 => hw::GpuVariant::P, // Guess
> +                2 => hw::GpuVariant::G,
> +                3 => hw::GpuVariant::S,
> +                4 => {
> +                    if num_clusters > 4 {
> +                        hw::GpuVariant::D
> +                    } else {
> +                        hw::GpuVariant::C
> +                    }
> +                }
> +                a => {
> +                    dev_err!(self.dev, "Unknown GPU variant {}\n", a);
> +                    return Err(ENODEV);
> +                }
> +            },
> +            gpu_rev,
> +            gpu_rev_id,
> +            max_dies: (id_clusters >> 20) & 0xf,
> +            num_clusters,
> +            num_cores,
> +            num_frags: (id_counts_1 >> 8) & 0xff,
> +            num_gps: (id_counts_2 >> 16) & 0xff,
> +            total_active_cores,
> +            core_masks,
> +            core_masks_packed,
> +        })
> +    }
> +
> +    /// Get the fault information from the MMU status register, if one occurred.
> +    pub(crate) fn get_fault_info(&self) -> Option<FaultInfo> {
> +        let fault_info = self.sgx_read64(FAULT_INFO);
> +
> +        if fault_info & 1 == 0 {
> +            return None;
> +        }
> +
> +        let unit_code = ((fault_info >> 9) & 0xff) as u8;
> +        let unit = match unit_code {
> +            0x00..=0x9f => match unit_code & 0xf {
> +                0x0 => FaultUnit::DCMP(unit_code >> 4),
> +                0x1 => FaultUnit::UL1C(unit_code >> 4),
> +                0x2 => FaultUnit::CMP(unit_code >> 4),
> +                0x3 => FaultUnit::GSL1(unit_code >> 4),
> +                0x4 => FaultUnit::IAP(unit_code >> 4),
> +                0x5 => FaultUnit::VCE(unit_code >> 4),
> +                0x6 => FaultUnit::TE(unit_code >> 4),
> +                0x7 => FaultUnit::RAS(unit_code >> 4),
> +                0x8 => FaultUnit::VDM(unit_code >> 4),
> +                0x9 => FaultUnit::PPP(unit_code >> 4),
> +                0xa => FaultUnit::IPF(unit_code >> 4),
> +                0xb => FaultUnit::IPF_CPF(unit_code >> 4),
> +                0xc => FaultUnit::VF(unit_code >> 4),
> +                0xd => FaultUnit::VF_CPF(unit_code >> 4),
> +                0xe => FaultUnit::ZLS(unit_code >> 4),
> +                _ => FaultUnit::Unknown(unit_code),
> +            },
> +            0xa1 => FaultUnit::dPM,
> +            0xa2 => FaultUnit::dCDM_KS(0),
> +            0xa3 => FaultUnit::dCDM_KS(1),
> +            0xa4 => FaultUnit::dCDM_KS(2),
> +            0xa5 => FaultUnit::dIPP,
> +            0xa6 => FaultUnit::dIPP_CS,
> +            0xa7 => FaultUnit::dVDM_CSD,
> +            0xa8 => FaultUnit::dVDM_SSD,
> +            0xa9 => FaultUnit::dVDM_ILF,
> +            0xaa => FaultUnit::dVDM_ILD,
> +            0xab => FaultUnit::dRDE(0),
> +            0xac => FaultUnit::dRDE(1),
> +            0xad => FaultUnit::FC,
> +            0xae => FaultUnit::GSL2,
> +            0xb0..=0xb7 => FaultUnit::GL2CC_META(unit_code & 0xf),
> +            0xb8 => FaultUnit::GL2CC_MB,
> +            0xe0..=0xff => match unit_code & 0xf {
> +                0x0 => FaultUnit::gPM_SP((unit_code >> 4) & 1),
> +                0x1 => FaultUnit::gVDM_CSD_SP((unit_code >> 4) & 1),
> +                0x2 => FaultUnit::gVDM_SSD_SP((unit_code >> 4) & 1),
> +                0x3 => FaultUnit::gVDM_ILF_SP((unit_code >> 4) & 1),
> +                0x4 => FaultUnit::gVDM_TFP_SP((unit_code >> 4) & 1),
> +                0x5 => FaultUnit::gVDM_MMB_SP((unit_code >> 4) & 1),
> +                0x6 => FaultUnit::gCDM_CS_KS0_SP((unit_code >> 4) & 1),
> +                0x7 => FaultUnit::gCDM_CS_KS1_SP((unit_code >> 4) & 1),
> +                0x8 => FaultUnit::gCDM_CS_KS2_SP((unit_code >> 4) & 1),
> +                0x9 => FaultUnit::gCDM_KS0_SP((unit_code >> 4) & 1),
> +                0xa => FaultUnit::gCDM_KS1_SP((unit_code >> 4) & 1),
> +                0xb => FaultUnit::gCDM_KS2_SP((unit_code >> 4) & 1),
> +                0xc => FaultUnit::gIPP_SP((unit_code >> 4) & 1),
> +                0xd => FaultUnit::gIPP_CS_SP((unit_code >> 4) & 1),
> +                0xe => FaultUnit::gRDE0_SP((unit_code >> 4) & 1),
> +                0xf => FaultUnit::gRDE1_SP((unit_code >> 4) & 1),
> +                _ => FaultUnit::Unknown(unit_code),
> +            },
> +            _ => FaultUnit::Unknown(unit_code),
> +        };
> +
> +        let reason = match (fault_info >> 1) & 0x7 {
> +            0 => FaultReason::Unmapped,
> +            1 => FaultReason::AfFault,
> +            2 => FaultReason::WriteOnly,
> +            3 => FaultReason::ReadOnly,
> +            4 => FaultReason::NoAccess,
> +            a => FaultReason::Unknown(a as u8),
> +        };
> +
> +        Some(FaultInfo {
> +            address: (fault_info >> 30) << 6,
> +            sideband: ((fault_info >> 23) & 0x7f) as u8,
> +            vm_slot: ((fault_info >> 17) & 0x3f) as u32,
> +            unit_code,
> +            unit,
> +            level: ((fault_info >> 7) & 3) as u8,
> +            unk_5: ((fault_info >> 5) & 3) as u8,
> +            read: (fault_info & (1 << 4)) != 0,
> +            reason,
> +        })
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/slotalloc.rs b/drivers/gpu/drm/asahi/slotalloc.rs
> new file mode 100644
> index 000000000000..6493111643fe
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/slotalloc.rs
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Generic slot allocator
> +//!
> +//! This is a simple allocator to manage fixed-size pools of GPU resources that are transiently
> +//! required during command execution. Each item resides in a "slot" at a given index. Users borrow
> +//! and return free items from the available pool.
> +//!
> +//! Allocations are "sticky", and return a token that callers can use to request the same slot
> +//! again later. This allows slots to be lazily invalidated, so that multiple uses by the same user
> +//! avoid any actual cleanup work.
> +//!
> +//! The allocation policy is currently a simple LRU mechanism, doing a full linear scan over the
> +//! slots when no token was previously provided. This is probably good enough, since in the absence
> +//! of serious system contention most allocation requests will be immediately fulfilled from the
> +//! previous slot without doing an LRU scan.
> +
> +use core::ops::{Deref, DerefMut};
> +use kernel::{
> +    error::{code::*, Result},
> +    prelude::*,
> +    sync::{Arc, CondVar, Mutex, UniqueArc},
> +};
> +
> +/// Trait representing a single item within a slot.
> +pub(crate) trait SlotItem {
> +    /// Arbitrary user data associated with the SlotAllocator.
> +    type Data;
> +
> +    /// Called eagerly when this item is released back into the available pool.
> +    fn release(&mut self, _data: &mut Self::Data, _slot: u32) {}
> +}
> +
> +/// Trivial implementation for users which do not require any slot data nor any allocator data.
> +impl SlotItem for () {
> +    type Data = ();
> +}
> +
> +/// Represents a current or previous allocation of an item from a slot. Users keep `SlotToken`s
> +/// around across allocations to request that, if possible, the same slot be reused.
> +#[derive(Copy, Clone, Debug)]
> +pub(crate) struct SlotToken {
> +    time: u64,
> +    slot: u32,
> +}
> +
> +impl SlotToken {
> +    /// Returns the slot index that this token represents a past assignment to.
> +    pub(crate) fn last_slot(&self) -> u32 {
> +        self.slot
> +    }
> +}
> +
> +/// A guard representing active ownership of a slot.
> +pub(crate) struct Guard<T: SlotItem> {
> +    item: Option<T>,
> +    changed: bool,
> +    token: SlotToken,
> +    alloc: Arc<SlotAllocatorOuter<T>>,
> +}
> +
> +impl<T: SlotItem> Guard<T> {
> +    /// Returns the active slot owned by this `Guard`.
> +    pub(crate) fn slot(&self) -> u32 {
> +        self.token.slot
> +    }
> +
> +    /// Returns `true` if the slot changed since the last allocation (or no `SlotToken` was
> +    /// provided), or `false` if the previously allocated slot was successfully re-acquired with
> +    /// no other users in the interim.
> +    pub(crate) fn changed(&self) -> bool {
> +        self.changed
> +    }
> +
> +    /// Returns a `SlotToken` that can be used to re-request the same slot at a later time, after
> +    /// this `Guard` is dropped.
> +    pub(crate) fn token(&self) -> SlotToken {
> +        self.token
> +    }
> +}
> +
> +impl<T: SlotItem> Deref for Guard<T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        self.item.as_ref().expect("SlotItem Guard lost our item!")
> +    }
> +}
> +
> +impl<T: SlotItem> DerefMut for Guard<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        self.item.as_mut().expect("SlotItem Guard lost our item!")
> +    }
> +}
> +
> +/// A slot item that is currently free.
> +struct Entry<T: SlotItem> {
> +    item: T,
> +    get_time: u64,
> +    drop_time: u64,
> +}
> +
> +/// Inner data for the `SlotAllocator`, protected by a `Mutex`.
> +struct SlotAllocatorInner<T: SlotItem> {
> +    data: T::Data,
> +    slots: Vec<Option<Entry<T>>>,
> +    get_count: u64,
> +    drop_count: u64,
> +}
> +
> +/// A single slot allocator instance.
> +struct SlotAllocatorOuter<T: SlotItem> {
> +    inner: Mutex<SlotAllocatorInner<T>>,
> +    cond: CondVar,
> +}
> +
> +/// A shared reference to a slot allocator instance.
> +pub(crate) struct SlotAllocator<T: SlotItem>(Arc<SlotAllocatorOuter<T>>);
> +
> +impl<T: SlotItem> SlotAllocator<T> {
> +    /// Creates a new `SlotAllocator`, with a fixed number of slots and arbitrary associated data.
> +    ///
> +    /// The caller provides a constructor callback which takes a reference to the `T::Data` and
> +    /// creates a single slot. This is called during construction to create all the initial
> +    /// items, which then live the lifetime of the `SlotAllocator`.
> +    pub(crate) fn new(
> +        num_slots: u32,
> +        mut data: T::Data,
> +        mut constructor: impl FnMut(&mut T::Data, u32) -> T,
> +    ) -> Result<SlotAllocator<T>> {
> +        let mut slots = Vec::try_with_capacity(num_slots as usize)?;
> +
> +        for i in 0..num_slots {
> +            slots
> +                .try_push(Some(Entry {
> +                    item: constructor(&mut data, i),
> +                    get_time: 0,
> +                    drop_time: 0,
> +                }))
> +                .expect("try_push() failed after reservation");
> +        }
> +
> +        let inner = SlotAllocatorInner {
> +            data,
> +            slots,
> +            get_count: 0,
> +            drop_count: 0,
> +        };
> +
> +        let mut alloc = Pin::from(UniqueArc::try_new(SlotAllocatorOuter {
> +            // SAFETY: `condvar_init!` is called below.
> +            cond: unsafe { CondVar::new() },
> +            // SAFETY: `mutex_init!` is called below.
> +            inner: unsafe { Mutex::new(inner) },
> +        })?);
> +
> +        // SAFETY: `cond` is pinned when `alloc` is.
> +        let pinned = unsafe { alloc.as_mut().map_unchecked_mut(|s| &mut s.cond) };
> +        kernel::condvar_init!(pinned, "SlotAllocator::cond");
> +
> +        // SAFETY: `inner` is pinned when `alloc` is.
> +        let pinned = unsafe { alloc.as_mut().map_unchecked_mut(|s| &mut s.inner) };
> +        kernel::mutex_init!(pinned, "SlotAllocator::inner");
> +
> +        Ok(SlotAllocator(alloc.into()))
> +    }
> +
> +    /// Calls a callback on the inner data associated with this allocator, taking the lock.
> +    pub(crate) fn with_inner<RetVal>(&self, cb: impl FnOnce(&mut T::Data) -> RetVal) -> RetVal {
> +        let mut inner = self.0.inner.lock();
> +        cb(&mut inner.data)
> +    }
> +
> +    /// Gets a fresh slot, optionally reusing a previous allocation if a `SlotToken` is provided.
> +    ///
> +    /// Blocks if no slots are free.
> +    pub(crate) fn get(&self, token: Option<SlotToken>) -> Result<Guard<T>> {
> +        self.get_inner(token, |_a, _b| Ok(()))
> +    }
> +
> +    /// Gets a fresh slot, optionally reusing a previous allocation if a `SlotToken` is provided.
> +    ///
> +    /// Blocks if no slots are free.
> +    ///
> +    /// This version allows the caller to pass in a callback that gets a mutable reference to the
> +    /// user data for the allocator and the freshly acquired slot, which is called before the
> +    /// allocator lock is released. This can be used to perform bookkeeping associated with
> +    /// specific slots (such as tracking their current owner).
> +    pub(crate) fn get_inner(
> +        &self,
> +        token: Option<SlotToken>,
> +        cb: impl FnOnce(&mut T::Data, &mut Guard<T>) -> Result<()>,
> +    ) -> Result<Guard<T>> {
> +        let mut inner = self.0.inner.lock();
> +
> +        if let Some(token) = token {
> +            let slot = &mut inner.slots[token.slot as usize];
> +            if slot.is_some() {
> +                let count = slot.as_ref().unwrap().get_time;
> +                if count == token.time {
> +                    let mut guard = Guard {
> +                        item: Some(slot.take().unwrap().item),
> +                        token,
> +                        changed: false,
> +                        alloc: self.0.clone(),
> +                    };
> +                    cb(&mut inner.data, &mut guard)?;
> +                    return Ok(guard);
> +                }
> +            }
> +        }
> +
> +        let mut first = true;
> +        let slot = loop {
> +            let mut oldest_time = u64::MAX;
> +            let mut oldest_slot = 0u32;
> +
> +            for (i, slot) in inner.slots.iter().enumerate() {
> +                if let Some(slot) = slot.as_ref() {
> +                    if slot.drop_time < oldest_time {
> +                        oldest_slot = i as u32;
> +                        oldest_time = slot.drop_time;
> +                    }
> +                }
> +            }
> +
> +            if oldest_time == u64::MAX {
> +                if first {
> +                    pr_warn!(
> +                        "{}: out of slots, blocking\n",
> +                        core::any::type_name::<Self>()
> +                    );
> +                }
> +                first = false;
> +                if self.0.cond.wait(&mut inner) {
> +                    return Err(ERESTARTSYS);
> +                }
> +            } else {
> +                break oldest_slot;
> +            }
> +        };
> +
> +        inner.get_count += 1;
> +
> +        let item = inner.slots[slot as usize]
> +            .take()
> +            .expect("Someone stole our slot?")
> +            .item;
> +
> +        let mut guard = Guard {
> +            item: Some(item),
> +            changed: true,
> +            token: SlotToken {
> +                time: inner.get_count,
> +                slot,
> +            },
> +            alloc: self.0.clone(),
> +        };
> +
> +        cb(&mut inner.data, &mut guard)?;
> +        Ok(guard)
> +    }
> +}
> +
> +impl<T: SlotItem> Clone for SlotAllocator<T> {
> +    fn clone(&self) -> Self {
> +        SlotAllocator(self.0.clone())
> +    }
> +}
> +
> +impl<T: SlotItem> Drop for Guard<T> {
> +    fn drop(&mut self) {
> +        let mut inner = self.alloc.inner.lock();
> +        if inner.slots[self.token.slot as usize].is_some() {
> +            pr_crit!(
> +                "{}: tried to return an item into a full slot ({})\n",
> +                core::any::type_name::<Self>(),
> +                self.token.slot
> +            );
> +        } else {
> +            inner.drop_count += 1;
> +            let mut item = self.item.take().expect("Guard lost its item");
> +            item.release(&mut inner.data, self.token.slot);
> +            inner.slots[self.token.slot as usize] = Some(Entry {
> +                item,
> +                get_time: self.token.time,
> +                drop_time: inner.drop_count,
> +            });
> +            self.alloc.cond.notify_one();
> +        }
> +    }
> +}
> diff --git a/drivers/gpu/drm/asahi/util.rs b/drivers/gpu/drm/asahi/util.rs
> new file mode 100644
> index 000000000000..8d1a37f17cd8
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/util.rs
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! Miscellaneous utility functions
> +
> +use core::ops::{Add, BitAnd, Div, Not, Sub};
> +
> +/// Aligns an integer type to a power of two.
> +pub(crate) fn align<T>(a: T, b: T) -> T
> +where
> +    T: Copy
> +        + Default
> +        + BitAnd<Output = T>
> +        + Not<Output = T>
> +        + Add<Output = T>
> +        + Sub<Output = T>
> +        + Div<Output = T>
> +        + core::cmp::PartialEq,
> +{
> +    let def: T = Default::default();
> +    #[allow(clippy::eq_op)]
> +    let one: T = !def / !def;
> +
> +    assert!((b & (b - one)) == def);
> +
> +    (a + b - one) & !(b - one)
> +}
> +
> +/// Integer division rounding up.
> +pub(crate) fn div_ceil<T>(a: T, b: T) -> T
> +where
> +    T: Copy
> +        + Default
> +        + BitAnd<Output = T>
> +        + Not<Output = T>
> +        + Add<Output = T>
> +        + Sub<Output = T>
> +        + Div<Output = T>,
> +{
> +    let def: T = Default::default();
> +    #[allow(clippy::eq_op)]
> +    let one: T = !def / !def;
> +
> +    (a + b - one) / b
> +}
> diff --git a/drivers/gpu/drm/asahi/workqueue.rs b/drivers/gpu/drm/asahi/workqueue.rs
> new file mode 100644
> index 000000000000..ce1d1f89e48e
> --- /dev/null
> +++ b/drivers/gpu/drm/asahi/workqueue.rs
> @@ -0,0 +1,880 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +//! GPU command execution queues
> +//!
> +//! The AGX GPU firmware schedules GPU work commands out of work queues, which are ring buffers of
> +//! pointers to work commands. There can be an arbitrary number of work queues. Work queues have an
> +//! associated type (vertex, fragment, or compute) and may only contain generic commands or commands
> +//! specific to that type.
> +//!
> +//! This module manages queueing work commands into a work queue and submitting them for execution
> +//! by the firmware. An active work queue needs an event to signal completion of its work, which is
> +//! owned by what we call a batch. This event then notifies the work queue when work is completed,
> +//! and that triggers freeing of all resources associated with that work. An idle work queue gives
> +//! up its associated event.
> +
> +use crate::debug::*;
> +use crate::fw::channels::PipeType;
> +use crate::fw::types::*;
> +use crate::fw::workqueue::*;
> +use crate::object::OpaqueGpuObject;
> +use crate::regs::FaultReason;
> +use crate::{box_in_place, no_debug, place};
> +use crate::{channel, driver, event, fw, gpu, object, regs};
> +use core::num::NonZeroU64;
> +use core::sync::atomic::Ordering;
> +use kernel::{
> +    bindings,
> +    error::code::*,
> +    prelude::*,
> +    sync::{Arc, Guard, Mutex, UniqueArc},
> +};
> +
> +const DEBUG_CLASS: DebugFlags = DebugFlags::WorkQueue;
> +
> +const MAX_JOB_SLOTS: u32 = 127;
> +
> +/// An enum of possible errors that might cause a piece of work to fail execution.
> +#[derive(Copy, Clone, Debug, PartialEq, Eq)]
> +pub(crate) enum WorkError {
> +    /// GPU timeout (command execution took too long).
> +    Timeout,
> +    /// GPU MMU fault (invalid access).
> +    Fault(regs::FaultInfo),
> +    /// Work failed due to an error caused by other concurrent GPU work.
> +    Killed,
> +    /// The GPU crashed.
> +    NoDevice,
> +    /// Unknown reason.
> +    Unknown,
> +}
> +
> +impl From<WorkError> for bindings::drm_asahi_result_info {
> +    fn from(err: WorkError) -> Self {
> +        match err {
> +            WorkError::Fault(info) => Self {
> +                status: bindings::drm_asahi_status_DRM_ASAHI_STATUS_FAULT,
> +                fault_type: match info.reason {
> +                    FaultReason::Unmapped => bindings::drm_asahi_fault_DRM_ASAHI_FAULT_UNMAPPED,
> +                    FaultReason::AfFault => bindings::drm_asahi_fault_DRM_ASAHI_FAULT_AF_FAULT,
> +                    FaultReason::WriteOnly => bindings::drm_asahi_fault_DRM_ASAHI_FAULT_WRITE_ONLY,
> +                    FaultReason::ReadOnly => bindings::drm_asahi_fault_DRM_ASAHI_FAULT_READ_ONLY,
> +                    FaultReason::NoAccess => bindings::drm_asahi_fault_DRM_ASAHI_FAULT_NO_ACCESS,
> +                    FaultReason::Unknown(_) => bindings::drm_asahi_fault_DRM_ASAHI_FAULT_UNKNOWN,
> +                },
> +                unit: info.unit_code.into(),
> +                sideband: info.sideband.into(),
> +                level: info.level,
> +                extra: info.unk_5.into(),
> +                is_read: info.read as u8,
> +                pad: 0,
> +                address: info.address,
> +            },
> +            a => Self {
> +                status: match a {
> +                    WorkError::Timeout => bindings::drm_asahi_status_DRM_ASAHI_STATUS_TIMEOUT,
> +                    WorkError::Killed => bindings::drm_asahi_status_DRM_ASAHI_STATUS_KILLED,
> +                    WorkError::NoDevice => bindings::drm_asahi_status_DRM_ASAHI_STATUS_NO_DEVICE,
> +                    _ => bindings::drm_asahi_status_DRM_ASAHI_STATUS_UNKNOWN_ERROR,
> +                },
> +                ..Default::default()
> +            },
> +        }
> +    }
> +}
> +
> +impl From<WorkError> for kernel::error::Error {
> +    fn from(err: WorkError) -> Self {
> +        match err {
> +            WorkError::Timeout => ETIMEDOUT,
> +            // Not EFAULT because that's for userspace faults
> +            WorkError::Fault(_) => EIO,
> +            WorkError::Unknown => ENODATA,
> +            WorkError::Killed => ECANCELED,
> +            WorkError::NoDevice => ENODEV,
> +        }
> +    }
> +}
> +
> +/// A GPU context tracking structure, which must be explicitly invalidated when dropped.
> +pub(crate) struct GpuContext {
> +    dev: driver::AsahiDevice,
> +    data: GpuObject<fw::workqueue::GpuContextData>,
> +}
> +no_debug!(GpuContext);
> +
> +impl GpuContext {
> +    /// Allocate a new GPU context.
> +    pub(crate) fn new(
> +        dev: &driver::AsahiDevice,
> +        alloc: &mut gpu::KernelAllocators,
> +    ) -> Result<GpuContext> {
> +        Ok(GpuContext {
> +            dev: dev.clone(),
> +            data: alloc
> +                .shared
> +                .new_object(Default::default(), |_inner| Default::default())?,
> +        })
> +    }
> +
> +    /// Returns the GPU pointer to the inner GPU context data structure.
> +    pub(crate) fn gpu_pointer(&self) -> GpuPointer<'_, fw::workqueue::GpuContextData> {
> +        self.data.gpu_pointer()
> +    }
> +}
> +
> +impl Drop for GpuContext {
> +    fn drop(&mut self) {
> +        mod_dev_dbg!(self.dev, "GpuContext: Invalidating GPU context\n");
> +        let dev = self.dev.data();
> +        if dev.gpu.invalidate_context(&self.data).is_err() {
> +            dev_err!(self.dev, "GpuContext: Failed to invalidate GPU context!\n");
> +        }
> +    }
> +}
> +
> +struct SubmittedWork<O, C>
> +where
> +    O: OpaqueGpuObject,
> +    C: FnOnce(O, Option<WorkError>) + Send + Sync + 'static,
> +{
> +    object: O,
> +    value: EventValue,
> +    error: Option<WorkError>,
> +    wptr: u32,
> +    vm_slot: u32,
> +    callback: C,
> +}
> +
> +trait GenSubmittedWork: Send + Sync {
> +    fn gpu_va(&self) -> NonZeroU64;
> +    fn value(&self) -> event::EventValue;
> +    fn wptr(&self) -> u32;
> +    fn set_wptr(&mut self, wptr: u32);
> +    fn mark_error(&mut self, error: WorkError);
> +    fn complete(self: Box<Self>);
> +}
> +
> +impl<O: OpaqueGpuObject, C: FnOnce(O, Option<WorkError>) + Send + Sync> GenSubmittedWork
> +    for SubmittedWork<O, C>
> +{
> +    fn gpu_va(&self) -> NonZeroU64 {
> +        self.object.gpu_va()
> +    }
> +
> +    fn value(&self) -> event::EventValue {
> +        self.value
> +    }
> +
> +    fn wptr(&self) -> u32 {
> +        self.wptr
> +    }
> +
> +    fn set_wptr(&mut self, wptr: u32) {
> +        self.wptr = wptr;
> +    }
> +
> +    fn complete(self: Box<Self>) {
> +        let SubmittedWork {
> +            object,
> +            value: _,
> +            error,
> +            wptr: _,
> +            vm_slot: _,
> +            callback,
> +        } = *self;
> +
> +        callback(object, error);
> +    }
> +
> +    fn mark_error(&mut self, error: WorkError) {
> +        mod_pr_debug!("WorkQueue: Command at value {:#x?} failed\n", self.value);
> +        self.error = Some(match error {
> +            WorkError::Fault(info) if info.vm_slot != self.vm_slot => WorkError::Killed,
> +            err => err,
> +        });
> +    }
> +}
> +
> +/// Inner data for managing a single work queue.
> +#[versions(AGX)]
> +struct WorkQueueInner {
> +    event_manager: Arc<event::EventManager>,
> +    info: GpuObject<QueueInfo::ver>,
> +    new: bool,
> +    pipe_type: PipeType,
> +    size: u32,
> +    wptr: u32,
> +    pending: Vec<Box<dyn GenSubmittedWork>>,
> +    last_token: Option<event::Token>,
> +    pending_jobs: usize,
> +    last_submitted: Option<event::EventValue>,
> +    last_completed: Option<event::EventValue>,
> +    event: Option<(event::Event, event::EventValue)>,
> +    priority: u32,
> +    commit_seq: u64,
> +    submit_seq: u64,
> +}
> +
> +/// An instance of a work queue.
> +#[versions(AGX)]
> +pub(crate) struct WorkQueue {
> +    info_pointer: GpuWeakPointer<QueueInfo::ver>,
> +    inner: Mutex<WorkQueueInner::ver>,
> +}
> +
> +#[versions(AGX)]
> +impl WorkQueueInner::ver {
> +    /// Return the GPU done pointer, representing how many work items have been completed by the
> +    /// GPU.
> +    fn doneptr(&self) -> u32 {
> +        self.info
> +            .state
> +            .with(|raw, _inner| raw.gpu_doneptr.load(Ordering::Acquire))
> +    }
> +}
> +
> +#[versions(AGX)]
> +#[derive(Copy, Clone)]
> +pub(crate) struct QueueEventInfo {
> +    pub(crate) stamp_pointer: GpuWeakPointer<Stamp>,
> +    pub(crate) fw_stamp_pointer: GpuWeakPointer<FwStamp>,
> +    pub(crate) slot: u32,
> +    pub(crate) value: event::EventValue,
> +    pub(crate) cmd_seq: u64,
> +    pub(crate) info_ptr: GpuWeakPointer<QueueInfo::ver>,
> +}
> +
> +#[versions(AGX)]
> +pub(crate) struct Job {
> +    wq: Arc<WorkQueue::ver>,
> +    event_info: QueueEventInfo::ver,
> +    start_value: EventValue,
> +    pending: Vec<Box<dyn GenSubmittedWork>>,
> +    committed: bool,
> +    submitted: bool,
> +    event_count: usize,
> +}
> +
> +#[versions(AGX)]
> +pub(crate) struct JobSubmission<'a> {
> +    inner: Option<Guard<'a, Mutex<WorkQueueInner::ver>>>,
> +    wptr: u32,
> +    event_count: usize,
> +    command_count: usize,
> +}
> +
> +#[versions(AGX)]
> +impl Job::ver {
> +    pub(crate) fn event_info(&self) -> QueueEventInfo::ver {
> +        let mut info = self.event_info;
> +        info.cmd_seq += self.event_count as u64;
> +
> +        info
> +    }
> +
> +    pub(crate) fn next_seq(&mut self) {
> +        self.event_count += 1;
> +        self.event_info.value.increment();
> +    }
> +
> +    pub(crate) fn add<O: object::OpaqueGpuObject + 'static>(
> +        &mut self,
> +        command: O,
> +        vm_slot: u32,
> +    ) -> Result {
> +        self.add_cb(command, vm_slot, |_, _| {})
> +    }
> +
> +    pub(crate) fn add_cb<O: object::OpaqueGpuObject + 'static>(
> +        &mut self,
> +        command: O,
> +        vm_slot: u32,
> +        callback: impl FnOnce(O, Option<WorkError>) + Sync + Send + 'static,
> +    ) -> Result {
> +        if self.committed {
> +            pr_err!("WorkQueue: Tried to mutate committed Job\n");
> +            return Err(EINVAL);
> +        }
> +
> +        self.pending.try_push(Box::try_new(SubmittedWork::<_, _> {
> +            object: command,
> +            value: self.event_info.value.next(),
> +            error: None,
> +            callback,
> +            wptr: 0,
> +            vm_slot,
> +        })?)?;
> +
> +        Ok(())
> +    }
> +
> +    pub(crate) fn commit(&mut self) -> Result {
> +        if self.committed {
> +            pr_err!("WorkQueue: Tried to commit committed Job\n");
> +            return Err(EINVAL);
> +        }
> +
> +        if self.pending.is_empty() {
> +            pr_err!("WorkQueue: Job::commit() with no commands\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut inner = self.wq.inner.lock();
> +
> +        let ev = inner.event.as_mut().expect("WorkQueue: Job lost its event");
> +
> +        if ev.1 != self.start_value {
> +            pr_err!(
> +                "WorkQueue: Job::commit() out of order (event slot {} {:?} != {:?}\n",
> +                ev.0.slot(),
> +                ev.1,
> +                self.start_value
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        ev.1 = self.event_info.value;
> +        inner.commit_seq += self.pending.len() as u64;
> +        self.committed = true;
> +
> +        Ok(())
> +    }
> +
> +    pub(crate) fn can_submit(&self) -> bool {
> +        self.wq.free_slots() > self.event_count && self.wq.free_space() > self.pending.len()
> +    }
> +
> +    pub(crate) fn submit(&mut self) -> Result<JobSubmission::ver<'_>> {
> +        if !self.committed {
> +            pr_err!("WorkQueue: Tried to submit uncommitted Job\n");
> +            return Err(EINVAL);
> +        }
> +
> +        if self.submitted {
> +            pr_err!("WorkQueue: Tried to submit Job twice\n");
> +            return Err(EINVAL);
> +        }
> +
> +        if self.pending.is_empty() {
> +            pr_err!("WorkQueue: Job::submit() with no commands\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut inner = self.wq.inner.lock();
> +
> +        if inner.submit_seq != self.event_info.cmd_seq {
> +            pr_err!(
> +                "WorkQueue: Job::submit() out of order (submit_seq {} != {})\n",
> +                inner.submit_seq,
> +                self.event_info.cmd_seq
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        if inner.commit_seq < (self.event_info.cmd_seq + self.pending.len() as u64) {
> +            pr_err!(
> +                "WorkQueue: Job::submit() out of order (commit_seq {} != {})\n",
> +                inner.commit_seq,
> +                (self.event_info.cmd_seq + self.pending.len() as u64)
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        let mut wptr = inner.wptr;
> +        let command_count = self.pending.len();
> +
> +        if inner.free_space() <= command_count {
> +            pr_err!("WorkQueue: Job does not fit in ring buffer\n");
> +            return Err(EBUSY);
> +        }
> +
> +        inner.pending.try_reserve(command_count)?;
> +
> +        inner.last_submitted = inner.event.as_ref().map(|e| e.1);
> +
> +        for mut command in self.pending.drain(..) {
> +            command.set_wptr(wptr);
> +
> +            let next_wptr = (wptr + 1) % inner.size;
> +            assert!(inner.doneptr() != next_wptr);
> +            inner.info.ring[wptr as usize] = command.gpu_va().get();
> +            wptr = next_wptr;
> +
> +            // Cannot fail, since we did a try_reserve(1) above
> +            inner
> +                .pending
> +                .try_push(command)
> +                .expect("try_push() failed after try_reserve()");
> +        }
> +
> +        self.submitted = true;
> +
> +        Ok(JobSubmission::ver {
> +            inner: Some(inner),
> +            wptr,
> +            command_count,
> +            event_count: self.event_count,
> +        })
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl<'a> JobSubmission::ver<'a> {
> +    pub(crate) fn run(mut self, channel: &mut channel::PipeChannel::ver) {
> +        let command_count = self.command_count;
> +        let mut inner = self.inner.take().expect("No inner?");
> +        let wptr = self.wptr;
> +        core::mem::forget(self);
> +
> +        inner
> +            .info
> +            .state
> +            .with(|raw, _inner| raw.cpu_wptr.store(wptr, Ordering::Release));
> +
> +        inner.wptr = wptr;
> +
> +        let event = inner.event.as_mut().expect("JobSubmission lost its event");
> +
> +        let event_slot = event.0.slot();
> +
> +        let msg = fw::channels::RunWorkQueueMsg::ver {
> +            pipe_type: inner.pipe_type,
> +            work_queue: Some(inner.info.weak_pointer()),
> +            wptr: inner.wptr,
> +            event_slot,
> +            is_new: inner.new,
> +            __pad: Default::default(),
> +        };
> +        channel.send(&msg);
> +        inner.new = false;
> +
> +        inner.submit_seq += command_count as u64;
> +    }
> +
> +    pub(crate) fn pipe_type(&self) -> PipeType {
> +        self.inner.as_ref().expect("No inner?").pipe_type
> +    }
> +
> +    pub(crate) fn priority(&self) -> u32 {
> +        self.inner.as_ref().expect("No inner?").priority
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl Drop for Job::ver {
> +    fn drop(&mut self) {
> +        mod_pr_debug!("WorkQueue: Dropping Job\n");
> +        let mut inner = self.wq.inner.lock();
> +
> +        if self.committed && !self.submitted {
> +            let pipe_type = inner.pipe_type;
> +            let event = inner.event.as_mut().expect("Job lost its event");
> +            mod_pr_debug!(
> +                "WorkQueue({:?}): Roll back {} events (slot {} val {:#x?}) and {} commands\n",
> +                pipe_type,
> +                self.event_count,
> +                event.0.slot(),
> +                event.1,
> +                self.pending.len()
> +            );
> +            event.1.sub(self.event_count as u32);
> +            inner.commit_seq -= self.pending.len() as u64;
> +        }
> +
> +        inner.pending_jobs -= 1;
> +
> +        if inner.pending.is_empty() && inner.pending_jobs == 0 {
> +            mod_pr_debug!("WorkQueue({:?}): Dropping event\n", inner.pipe_type);
> +            inner.event = None;
> +            inner.last_submitted = None;
> +            inner.last_completed = None;
> +        }
> +        mod_pr_debug!("WorkQueue({:?}): Dropped Job\n", inner.pipe_type);
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl<'a> Drop for JobSubmission::ver<'a> {
> +    fn drop(&mut self) {
> +        let inner = self.inner.as_mut().expect("No inner?");
> +        mod_pr_debug!("WorkQueue({:?}): Dropping JobSubmission\n", inner.pipe_type);
> +
> +        let new_len = inner.pending.len() - self.command_count;
> +        inner.pending.truncate(new_len);
> +
> +        let pipe_type = inner.pipe_type;
> +        let event = inner.event.as_mut().expect("JobSubmission lost its event");
> +        mod_pr_debug!(
> +            "WorkQueue({:?}): Roll back {} events (slot {} val {:#x?}) and {} commands\n",
> +            pipe_type,
> +            self.event_count,
> +            event.0.slot(),
> +            event.1,
> +            self.command_count
> +        );
> +        event.1.sub(self.event_count as u32);
> +        inner.commit_seq -= self.command_count as u64;
> +        mod_pr_debug!("WorkQueue({:?}): Dropped JobSubmission\n", inner.pipe_type);
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl WorkQueueInner::ver {
> +    /// Return the number of free entries in the workqueue
> +    pub(crate) fn free_space(&self) -> usize {
> +        self.size as usize - self.pending.len() - 1
> +    }
> +
> +    pub(crate) fn free_slots(&self) -> usize {
> +        let busy_slots = if let Some(ls) = self.last_submitted {
> +            let lc = self
> +                .last_completed
> +                .expect("last_submitted but not completed?");
> +            ls.delta(&lc)
> +        } else {
> +            0
> +        };
> +
> +        ((MAX_JOB_SLOTS as i32) - busy_slots).max(0) as usize
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl WorkQueue::ver {
> +    /// Create a new WorkQueue of a given type and priority.
> +    #[allow(clippy::too_many_arguments)]
> +    pub(crate) fn new(
> +        alloc: &mut gpu::KernelAllocators,
> +        event_manager: Arc<event::EventManager>,
> +        gpu_context: Arc<GpuContext>,
> +        notifier_list: Arc<GpuObject<fw::event::NotifierList>>,
> +        pipe_type: PipeType,
> +        id: u64,
> +        priority: u32,
> +        size: u32,
> +    ) -> Result<Arc<WorkQueue::ver>> {
> +        let mut info = box_in_place!(QueueInfo::ver {
> +            state: alloc.shared.new_default::<RingState>()?,
> +            ring: alloc.shared.array_empty(size as usize)?,
> +            gpu_buf: alloc.private.array_empty(0x2c18)?,
> +            notifier_list: notifier_list,
> +            gpu_context: gpu_context,
> +        })?;
> +
> +        info.state.with_mut(|raw, _inner| {
> +            raw.rb_size = size;
> +        });
> +
> +        let inner = WorkQueueInner::ver {
> +            event_manager,
> +            info: alloc.private.new_boxed(info, |inner, ptr| {
> +                Ok(place!(
> +                    ptr,
> +                    raw::QueueInfo::ver {
> +                        state: inner.state.gpu_pointer(),
> +                        ring: inner.ring.gpu_pointer(),
> +                        notifier_list: inner.notifier_list.gpu_pointer(),
> +                        gpu_buf: inner.gpu_buf.gpu_pointer(),
> +                        gpu_rptr1: Default::default(),
> +                        gpu_rptr2: Default::default(),
> +                        gpu_rptr3: Default::default(),
> +                        event_id: AtomicI32::new(-1),
> +                        priority: *raw::PRIORITY.get(priority as usize).ok_or(EINVAL)?,
> +                        unk_4c: -1,
> +                        uuid: id as u32,
> +                        unk_54: -1,
> +                        unk_58: Default::default(),
> +                        busy: Default::default(),
> +                        __pad: Default::default(),
> +                        unk_84_state: Default::default(),
> +                        unk_88: 0,
> +                        unk_8c: 0,
> +                        unk_90: 0,
> +                        unk_94: 0,
> +                        pending: Default::default(),
> +                        unk_9c: 0,
> +                        #[ver(V >= V13_2)]
> +                        unk_a0_0: 0,
> +                        gpu_context: inner.gpu_context.gpu_pointer(),
> +                        unk_a8: Default::default(),
> +                        #[ver(V >= V13_2)]
> +                        unk_b0: 0,
> +                    }
> +                ))
> +            })?,
> +            new: true,
> +            pipe_type,
> +            size,
> +            wptr: 0,
> +            pending: Vec::new(),
> +            last_token: None,
> +            event: None,
> +            priority,
> +            pending_jobs: 0,
> +            commit_seq: 0,
> +            submit_seq: 0,
> +            last_completed: None,
> +            last_submitted: None,
> +        };
> +
> +        let mut queue = Pin::from(UniqueArc::try_new(Self {
> +            info_pointer: inner.info.weak_pointer(),
> +            // SAFETY: `mutex_init!` is called below.
> +            inner: unsafe { Mutex::new(inner) },
> +        })?);
> +
> +        // SAFETY: `inner` is pinned when `queue` is.
> +        let pinned = unsafe { queue.as_mut().map_unchecked_mut(|s| &mut s.inner) };
> +        match pipe_type {
> +            PipeType::Vertex => kernel::mutex_init!(pinned, "WorkQueue::inner (Vertex)"),
> +            PipeType::Fragment => kernel::mutex_init!(pinned, "WorkQueue::inner (Fragment)"),
> +            PipeType::Compute => kernel::mutex_init!(pinned, "WorkQueue::inner (Compute)"),
> +        }
> +
> +        Ok(queue.into())
> +    }
> +
> +    pub(crate) fn event_info(&self) -> Option<QueueEventInfo::ver> {
> +        let inner = self.inner.lock();
> +
> +        inner.event.as_ref().map(|ev| QueueEventInfo::ver {
> +            stamp_pointer: ev.0.stamp_pointer(),
> +            fw_stamp_pointer: ev.0.fw_stamp_pointer(),
> +            slot: ev.0.slot(),
> +            value: ev.1,
> +            cmd_seq: inner.commit_seq,
> +            info_ptr: self.info_pointer,
> +        })
> +    }
> +
> +    pub(crate) fn new_job(self: &Arc<Self>) -> Result<Job::ver> {
> +        let mut inner = self.inner.lock();
> +
> +        if inner.event.is_none() {
> +            mod_pr_debug!("WorkQueue({:?}): Grabbing event\n", inner.pipe_type);
> +            let event = inner.event_manager.get(inner.last_token, self.clone())?;
> +            let cur = event.current();
> +            inner.last_token = Some(event.token());
> +            mod_pr_debug!(
> +                "WorkQueue({:?}): Grabbed event slot {}: {:#x?}\n",
> +                inner.pipe_type,
> +                event.slot(),
> +                cur
> +            );
> +            inner.event = Some((event, cur));
> +            inner.last_submitted = Some(cur);
> +            inner.last_completed = Some(cur);
> +        }
> +
> +        inner.pending_jobs += 1;
> +
> +        let ev = &inner.event.as_ref().unwrap();
> +
> +        mod_pr_debug!("WorkQueue({:?}): New job\n", inner.pipe_type);
> +        Ok(Job::ver {
> +            wq: self.clone(),
> +            event_info: QueueEventInfo::ver {
> +                stamp_pointer: ev.0.stamp_pointer(),
> +                fw_stamp_pointer: ev.0.fw_stamp_pointer(),
> +                slot: ev.0.slot(),
> +                value: ev.1,
> +                cmd_seq: inner.commit_seq,
> +                info_ptr: self.info_pointer,
> +            },
> +            start_value: ev.1,
> +            pending: Vec::new(),
> +            event_count: 0,
> +            committed: false,
> +            submitted: false,
> +        })
> +    }
> +
> +    /// Return the number of free entries in the workqueue
> +    pub(crate) fn free_space(&self) -> usize {
> +        self.inner.lock().free_space()
> +    }
> +
> +    /// Return the number of free job slots in the workqueue
> +    pub(crate) fn free_slots(&self) -> usize {
> +        self.inner.lock().free_slots()
> +    }
> +
> +    pub(crate) fn pipe_type(&self) -> PipeType {
> +        self.inner.lock().pipe_type
> +    }
> +}
> +
> +/// Trait used to erase the version-specific type of WorkQueues, to avoid leaking
> +/// version-specificity into the event module.
> +pub(crate) trait WorkQueue {
> +    fn signal(&self) -> bool;
> +    fn mark_error(&self, value: event::EventValue, error: WorkError);
> +    fn fail_all(&self, error: WorkError);
> +}
> +
> +#[versions(AGX)]
> +impl WorkQueue for WorkQueue::ver {
> +    /// Signal a workqueue that some work was completed.
> +    ///
> +    /// This will check the event stamp value to find out exactly how many commands were processed.
> +    fn signal(&self) -> bool {
> +        let mut inner = self.inner.lock();
> +        let event = inner.event.as_ref();
> +        let value = match event {
> +            None => {
> +                pr_err!("WorkQueue: signal() called but no event?\n");
> +                return true;
> +            }
> +            Some(event) => event.0.current(),
> +        };
> +
> +        inner.last_completed = Some(value);
> +
> +        mod_pr_debug!(
> +            "WorkQueue({:?}): Signaling event {:?} value {:#x?}\n",
> +            inner.pipe_type,
> +            inner.last_token,
> +            value
> +        );
> +
> +        let mut completed_commands: usize = 0;
> +
> +        for cmd in inner.pending.iter() {
> +            if cmd.value() <= value {
> +                mod_pr_debug!(
> +                    "WorkQueue({:?}): Command at value {:#x?} complete\n",
> +                    inner.pipe_type,
> +                    cmd.value()
> +                );
> +                completed_commands += 1;
> +            } else {
> +                break;
> +            }
> +        }
> +
> +        if completed_commands == 0 {
> +            return inner.pending.is_empty();
> +        }
> +
> +        let mut completed = Vec::new();
> +
> +        if completed.try_reserve(completed_commands).is_err() {
> +            pr_crit!(
> +                "WorkQueue({:?}): Failed to allocated space for {} completed commands\n",
> +                inner.pipe_type,
> +                completed_commands
> +            );
> +        }
> +
> +        let pipe_type = inner.pipe_type;
> +
> +        for cmd in inner.pending.drain(..completed_commands) {
> +            if completed.try_push(cmd).is_err() {
> +                pr_crit!(
> +                    "WorkQueue({:?}): Failed to signal a completed command\n",
> +                    pipe_type,
> +                );
> +            }
> +        }
> +
> +        mod_pr_debug!(
> +            "WorkQueue({:?}): Completed {} commands\n",
> +            inner.pipe_type,
> +            completed_commands
> +        );
> +
> +        if let Some(i) = completed.last() {
> +            inner
> +                .info
> +                .state
> +                .with(|raw, _inner| raw.cpu_freeptr.store(i.wptr(), Ordering::Release));
> +        }
> +
> +        let empty = inner.pending.is_empty();
> +        if empty && inner.pending_jobs == 0 {
> +            inner.event = None;
> +            inner.last_submitted = None;
> +            inner.last_completed = None;
> +        }
> +
> +        core::mem::drop(inner);
> +
> +        for cmd in completed {
> +            cmd.complete();
> +        }
> +
> +        empty
> +    }
> +
> +    /// Mark this queue's work up to a certain stamp value as having failed.
> +    fn mark_error(&self, value: event::EventValue, error: WorkError) {
> +        // If anything is marked completed, we can consider it successful
> +        // at this point, even if we didn't get the signal event yet.
> +        self.signal();
> +
> +        let mut inner = self.inner.lock();
> +
> +        if inner.event.is_none() {
> +            pr_err!("WorkQueue: signal_fault() called but no event?\n");
> +            return;
> +        }
> +
> +        mod_pr_debug!(
> +            "WorkQueue({:?}): Signaling fault for event {:?} at value {:#x?}\n",
> +            inner.pipe_type,
> +            inner.last_token,
> +            value
> +        );
> +
> +        for cmd in inner.pending.iter_mut() {
> +            if cmd.value() <= value {
> +                cmd.mark_error(error);
> +            } else {
> +                break;
> +            }
> +        }
> +    }
> +
> +    /// Mark all of this queue's work as having failed, and complete it.
> +    fn fail_all(&self, error: WorkError) {
> +        // If anything is marked completed, we can consider it successful
> +        // at this point, even if we didn't get the signal event yet.
> +        self.signal();
> +
> +        let mut inner = self.inner.lock();
> +
> +        if inner.event.is_none() {
> +            pr_err!("WorkQueue: fail_all() called but no event?\n");
> +            return;
> +        }
> +
> +        mod_pr_debug!(
> +            "WorkQueue({:?}): Failing all jobs {:?}\n",
> +            inner.pipe_type,
> +            error
> +        );
> +
> +        let mut cmds = Vec::new();
> +
> +        core::mem::swap(&mut inner.pending, &mut cmds);
> +
> +        if inner.pending_jobs == 0 {
> +            inner.event = None;
> +        }
> +
> +        core::mem::drop(inner);
> +
> +        for mut cmd in cmds {
> +            cmd.mark_error(error);
> +            cmd.complete();
> +        }
> +    }
> +}
> +
> +#[versions(AGX)]
> +impl Drop for WorkQueue::ver {
> +    fn drop(&mut self) {
> +        mod_pr_debug!("WorkQueue({:?}): Dropping\n", self.inner.lock().pipe_type);
> +    }
> +}
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
