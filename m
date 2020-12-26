Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5FC2E35E0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E31A89B12;
	Mon, 28 Dec 2020 10:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1EC89834;
 Sat, 26 Dec 2020 10:43:30 +0000 (UTC)
IronPort-SDR: Knt7ale0HnZmhLa23xDUqJ4NQ2frqM9tfDObuHpRYuk5Yxkar9Bi6el2/DEn1NCxsVPvlttcy1
 ixfOMoW6cSlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9845"; a="175480450"
X-IronPort-AV: E=Sophos;i="5.78,450,1599548400"; 
 d="xz'?yaml'?scan'208";a="175480450"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2020 02:43:29 -0800
IronPort-SDR: w7ID+hfwe/Yaf2dGkYv/xSST6sS53v+rhIHLYMpzqJPpdbtnxw5fF72ZEZFrGd6R5H1Q2ZSier
 HnR6e3pnurxw==
X-IronPort-AV: E=Sophos;i="5.78,450,1599548400"; 
 d="xz'?yaml'?scan'208";a="374972598"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2020 02:43:23 -0800
Date: Sat, 26 Dec 2020 18:58:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: [drm/i915/gt]  8c3b1ba0e7:
 perf-sanity-tests.Parse_event_definition_strings.fail
Message-ID: <20201226105831.GA11697@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
Cc: Matthew Brost <matthew.brost@intel.com>, lkp@intel.com,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 lkp@lists.01.org, kernel test robot <oliver.sang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Greeting,

FYI, we noticed the following commit (built with gcc-9):

commit: 8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813 ("drm/i915/gt: Track the o=
verall awake/busy time")
git://anongit.freedesktop.org/drm-intel drm-intel-gt-next


in testcase: perf-sanity-tests
version: perf-x86_64-fa02fcd94b0c-1_20201126
with following parameters:

	perf_compiler: gcc
	ucode: 0xe2



on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 32G=
 memory

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):




If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>

2020-12-24 12:50:16 make ARCH=3D EXTRA_CFLAGS=3D-fno-omit-frame-pointer -fs=
anitize=3Dundefined -fsanitize=3Daddress -C /usr/src/perf_selftests-x86_64-=
rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e=
7ea9a80b0ee4b4445ea59c806787813/tools/perf'
  BUILD:   Doing 'make =1B[33m-j4=1B[m' parallel build
  HOSTCC   fixdep.o
  HOSTLD   fixdep-in.o
  LINK     fixdep
diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
diff -u tools/arch/x86/lib/memcpy_64.S arch/x86/lib/memcpy_64.S
diff -u tools/arch/x86/lib/memset_64.S arch/x86/lib/memset_64.S

Auto-detecting system features:
=2E..                         dwarf: [ =1B[32mon=1B[m  ]
=2E..            dwarf_getlocations: [ =1B[32mon=1B[m  ]
=2E..                         glibc: [ =1B[32mon=1B[m  ]
=2E..                        libbfd: [ =1B[32mon=1B[m  ]
=2E..                libbfd-buildid: [ =1B[32mon=1B[m  ]
=2E..                        libcap: [ =1B[32mon=1B[m  ]
=2E..                        libelf: [ =1B[32mon=1B[m  ]
=2E..                       libnuma: [ =1B[32mon=1B[m  ]
=2E..        numa_num_possible_cpus: [ =1B[32mon=1B[m  ]
=2E..                       libperl: [ =1B[32mon=1B[m  ]
=2E..                     libpython: [ =1B[32mon=1B[m  ]
=2E..                     libcrypto: [ =1B[32mon=1B[m  ]
=2E..                     libunwind: [ =1B[32mon=1B[m  ]
=2E..            libdw-dwarf-unwind: [ =1B[32mon=1B[m  ]
=2E..                          zlib: [ =1B[32mon=1B[m  ]
=2E..                          lzma: [ =1B[32mon=1B[m  ]
=2E..                     get_cpuid: [ =1B[32mon=1B[m  ]
=2E..                           bpf: [ =1B[32mon=1B[m  ]
=2E..                        libaio: [ =1B[32mon=1B[m  ]
=2E..                       libzstd: [ =1B[32mon=1B[m  ]
=2E..        disassembler-four-args: [ =1B[32mon=1B[m  ]

  CC       fd/array.o
  CC       exec-cmd.o
  CC       event-parse.o
  CC       core.o
  LD       fd/libapi-in.o
  CC       fs/fs.o
  CC       cpumap.o
  CC       help.o
  CC       fs/tracing_path.o
  CC       fs/cgroup.o
  LD       fs/libapi-in.o
  CC       cpu.o
  CC       threadmap.o
  CC       debug.o
  CC       pager.o
  CC       str_error_r.o
  LD       libapi-in.o
  AR       libapi.a
  CC       parse-options.o
  CC       event-plugin.o
  CC       evsel.o
  CC       trace-seq.o
  CC       parse-filter.o
  CC       evlist.o
  CC       mmap.o
  CC       parse-utils.o
  CC       kbuffer-parse.o
  CC       zalloc.o
  CC       tep_strerror.o
  CC       event-parse-api.o
  CC       xyarray.o
  LD       libtraceevent-in.o
  LINK     libtraceevent.a
  CC       lib.o
  GEN      bpf_helper_defs.h
  MKDIR    staticobjs/
  CC       staticobjs/libbpf.o
  LD       libperf-in.o
  AR       libperf.a
  GEN      common-cmds.h
  CC       run-command.o
  CC       sigchain.o
  CC       subcmd-config.o
  LD       libsubcmd-in.o
  MKDIR    staticobjs/
  AR       libsubcmd.a
  CC       staticobjs/bpf.o
  CC       staticobjs/nlattr.o
  CC       staticobjs/btf.o
  HOSTCC   pmu-events/json.o
  HOSTCC   pmu-events/jsmn.o
  HOSTCC   pmu-events/jevents.o
  HOSTLD   pmu-events/jevents-in.o
  CC       plugin_jbd2.o
  LD       plugin_jbd2-in.o
  CC       plugin_hrtimer.o
  LD       plugin_hrtimer-in.o
  CC       plugin_kmem.o
  LD       plugin_kmem-in.o
  CC       plugin_kvm.o
  LD       plugin_kvm-in.o
  CC       staticobjs/libbpf_errno.o
  CC       plugin_mac80211.o
  CC       staticobjs/str_error.o
  CC       staticobjs/netlink.o
  LD       plugin_mac80211-in.o
  CC       plugin_sched_switch.o
  LD       plugin_sched_switch-in.o
  CC       plugin_function.o
  CC       staticobjs/bpf_prog_linfo.o
  LD       plugin_function-in.o
  CC       plugin_futex.o
  CC       staticobjs/libbpf_probes.o
  LD       plugin_futex-in.o
  CC       plugin_xen.o
  CC       staticobjs/xsk.o
  LD       plugin_xen-in.o
  CC       plugin_scsi.o
  CC       staticobjs/hashmap.o
  LD       plugin_scsi-in.o
  CC       plugin_tlb.o
  CC       plugin_cfg80211.o
  CC       jvmti/libjvmti.o
  LD       plugin_cfg80211-in.o
  GEN      perf-archive
  LD       plugin_tlb-in.o
  LINK     plugin_jbd2.so
  GEN      perf-with-kcore
  CC       jvmti/jvmti_agent.o
  CC       staticobjs/btf_dump.o
  LINK     plugin_hrtimer.so
  LINK     plugin_kmem.so
  LINK     plugin_kvm.so
  LINK     plugin_mac80211.so
  CC       staticobjs/ringbuf.o
  LINK     plugin_sched_switch.so
  LINK     plugin_function.so
  LINK     plugin_futex.so
  LINK     plugin_xen.so
  LD       staticobjs/libbpf-in.o
  LINK     libbpf.a
  LINK     plugin_scsi.so
  CC       jvmti/libstring.o
  LINK     plugin_cfg80211.so
  CC       builtin-bench.o
  LINK     plugin_tlb.so
  GEN      libtraceevent-dynamic-list
  CC       jvmti/libctype.o
  CC       builtin-annotate.o
  CC       builtin-config.o
  LD       jvmti/jvmti-in.o
  CC       builtin-diff.o
  LINK     pmu-events/jevents
  CC       builtin-evlist.o
  CC       builtin-ftrace.o
  LINK     libperf-jvmti.so
  CC       builtin-help.o
  CC       builtin-sched.o
  CC       builtin-buildid-list.o
  CC       builtin-buildid-cache.o
  CC       builtin-kallsyms.o
  CC       builtin-list.o
  CC       builtin-record.o
  CC       builtin-report.o
  CC       builtin-stat.o
  CC       builtin-timechart.o
  CC       builtin-top.o
  CC       builtin-script.o
  CC       builtin-kmem.o
  CC       builtin-lock.o
  CC       builtin-kvm.o
  CC       builtin-inject.o
  CC       builtin-mem.o
  CC       builtin-data.o
  CC       builtin-version.o
  CC       builtin-c2c.o
  CC       builtin-trace.o
  CC       builtin-probe.o
  CC       bench/sched-messaging.o
  CC       bench/sched-pipe.o
  CC       bench/syscall.o
  CC       bench/mem-functions.o
  CC       bench/futex-hash.o
  CC       bench/futex-wake.o
  CC       bench/futex-wake-parallel.o
  CC       bench/futex-requeue.o
  CC       bench/futex-lock-pi.o
  CC       tests/builtin-test.o
  CC       bench/epoll-wait.o
  CC       bench/epoll-ctl.o
  CC       tests/parse-events.o
  CC       util/annotate.o
  CC       bench/synthesize.o
  CC       bench/kallsyms-parse.o
  CC       bench/find-bit-bench.o
  CC       bench/inject-buildid.o
  CC       bench/mem-memcpy-x86-64-asm.o
  CC       bench/mem-memset-x86-64-asm.o
  CC       bench/numa.o
  CC       tests/dso-data.o
  CC       tests/attr.o
  CC       tests/vmlinux-kallsyms.o
  LD       bench/perf-in.o
  CC       arch/common.o
  CC       tests/openat-syscall.o
  CC       arch/x86/util/header.o
  CC       tests/openat-syscall-all-cpus.o
  CC       arch/x86/util/tsc.o
  CC       arch/x86/util/pmu.o
  CC       tests/openat-syscall-tp-fields.o
  CC       arch/x86/util/kvm-stat.o
  CC       tests/mmap-basic.o
  CC       arch/x86/util/perf_regs.o
  CC       arch/x86/util/topdown.o
  CC       tests/perf-record.o
  CC       arch/x86/util/machine.o
  CC       arch/x86/tests/regs_load.o
  CC       arch/x86/tests/dwarf-unwind.o
  CC       util/block-info.o
  CC       arch/x86/tests/arch-tests.o
  CC       arch/x86/util/event.o
  CC       arch/x86/tests/rdpmc.o
  CC       tests/evsel-roundtrip-name.o
  CC       arch/x86/util/dwarf-regs.o
  CC       arch/x86/util/unwind-libunwind.o
  CC       arch/x86/tests/perf-time-to-tsc.o
  CC       arch/x86/util/auxtrace.o
  CC       tests/evsel-tp-sched.o
  CC       arch/x86/util/archinsn.o
  CC       tests/fdarray.o
  CC       arch/x86/tests/insn-x86.o
  CC       arch/x86/util/intel-pt.o
  CC       arch/x86/tests/intel-pt-pkt-decoder-test.o
  CC       tests/pmu.o
  CC       arch/x86/tests/bp-modify.o
  CC       util/block-range.o
  CC       tests/pmu-events.o
  LD       arch/x86/tests/perf-in.o
  CC       tests/hists_common.o
  CC       tests/hists_link.o
  CC       util/build-id.o
  CC       ui/setup.o
  CC       tests/hists_filter.o
  CC       arch/x86/util/intel-bts.o
  CC       ui/helpline.o
  CC       ui/progress.o
  CC       ui/util.o
  CC       ui/hist.o
  CC       tests/hists_output.o
  CC       util/cacheline.o
  CC       util/config.o
  LD       arch/x86/util/perf-in.o
  LD       arch/x86/perf-in.o
  LD       arch/perf-in.o
  CC       tests/hists_cumulate.o
  CC       util/copyfile.o
  CC       util/ctype.o
  CC       util/db-export.o
  CC       tests/python-use.o
  CC       tests/bp_signal.o
  CC       tests/bp_signal_overflow.o
  CC       tests/bp_account.o
  CC       tests/wp.o
  CC       tests/task-exit.o
  CC       tests/sw-clock.o
  CC       tests/mmap-thread-lookup.o
  CC       util/env.o
  CC       scripts/perl/Perf-Trace-Util/Context.o
  CC       tests/thread-maps-share.o
  CC       util/event.o
  CC       tests/switch-tracking.o
  LD       scripts/perl/Perf-Trace-Util/perf-in.o
  CC       scripts/python/Perf-Trace-Util/Context.o
  LD       scripts/python/Perf-Trace-Util/perf-in.o
  LD       scripts/perf-in.o
  CC       trace/beauty/clone.o
  CC       tests/keep-tracking.o
  CC       trace/beauty/fcntl.o
  CC       tests/code-reading.o
  CC       trace/beauty/flock.o
  CC       util/evlist.o
  CC       trace/beauty/fsmount.o
  CC       trace/beauty/fspick.o
  CC       trace/beauty/ioctl.o
  CC       trace/beauty/kcmp.o
  CC       trace/beauty/mount_flags.o
  CC       trace/beauty/move_mount.o
  CC       trace/beauty/pkey_alloc.o
  CC       tests/sample-parsing.o
  CC       trace/beauty/arch_prctl.o
  CC       trace/beauty/prctl.o
  CC       trace/beauty/renameat.o
  CC       trace/beauty/sockaddr.o
  CC       trace/beauty/socket.o
  CC       trace/beauty/statx.o
  CC       tests/parse-no-sample-id-all.o
  CC       trace/beauty/sync_file_range.o
  CC       tests/kmod-path.o
  CC       trace/beauty/tracepoints/x86_irq_vectors.o
  CC       trace/beauty/tracepoints/x86_msr.o
  LD       trace/beauty/tracepoints/perf-in.o
  LD       trace/beauty/perf-in.o
  CC       perf.o
  CC       tests/thread-map.o
  CC       tests/llvm.o
  CC       tests/bpf.o
  CC       util/sideband_evlist.o
  CC       util/evsel.o
  CC       util/evsel_fprintf.o
  CC       tests/topology.o
  CC       tests/mem.o
  CC       tests/cpumap.o
  CC       tests/stat.o
  CC       tests/event_update.o
  CC       ui/stdio/hist.o
  CC       util/perf_event_attr_fprintf.o
  CC       tests/event-times.o
  CC       tests/expr.o
  CC       util/evswitch.o
  CC       tests/backward-ring-buffer.o
  CC       util/find_bit.o
  CC       tests/sdt.o
  CC       util/get_current_dir_name.o
  CC       util/kallsyms.o
  CC       tests/is_printable_array.o
  CC       tests/bitmap.o
  CC       util/levenshtein.o
  CC       ui/browser.o
  CC       tests/perf-hooks.o
  CC       tests/clang.o
  CC       util/llvm-utils.o
  CC       tests/unit_number__scnprintf.o
  CC       tests/mem2node.o
  CC       tests/maps.o
  CC       util/mmap.o
  CC       tests/time-utils-test.o
  CC       util/memswap.o
  CC       ui/browsers/annotate.o
  BISON    util/parse-events-bison.c
  CC       util/perf_regs.o
  CC       util/path.o
  CC       tests/genelf.o
  CC       ui/browsers/hists.o
  CC       tests/api-io.o
  CC       tests/demangle-java-test.o
  CC       tests/pfm.o
  CC       tests/parse-metric.o
  CC       util/print_binary.o
  CC       util/rlimit.o
  CC       tests/pe-file-parsing.o
  CC       util/argv_split.o
  CC       tests/expand-cgroup.o
  CC       ui/browsers/map.o
  CC       util/rbtree.o
  CC       ui/browsers/scripts.o
  CC       tests/dwarf-unwind.o
  CC       ui/browsers/header.o
  CC       tests/llvm-src-base.o
  CC       tests/llvm-src-kbuild.o
  CC       tests/llvm-src-prologue.o
  CC       tests/llvm-src-relocation.o
  CC       ui/browsers/res_sample.o
  LD       tests/perf-in.o
  CC       util/libstring.o
  CC       util/bitmap.o
  CC       util/hweight.o
  CC       util/smt.o
  CC       ui/tui/setup.o
  CC       util/strbuf.o
  CC       util/string.o
  CC       ui/tui/util.o
  CC       util/strlist.o
  CC       util/strfilter.o
  CC       ui/tui/helpline.o
  CC       util/top.o
  CC       ui/tui/progress.o
  LD       ui/tui/perf-in.o
  CC       util/usage.o
  CC       util/dso.o
  CC       util/dsos.o
  CC       util/symbol.o
  CC       util/symbol_fprintf.o
  CC       util/color.o
  CC       util/color_config.o
  CC       util/metricgroup.o
  CC       util/header.o
  CC       util/callchain.o
  CC       util/values.o
  CC       util/debug.o
  CC       util/fncache.o
  CC       util/machine.o
  CC       util/map.o
  CC       util/pstack.o
  CC       util/session.o
  CC       util/sample-raw.o
  CC       util/s390-sample-raw.o
  CC       util/syscalltbl.o
  CC       util/ordered-events.o
  CC       util/namespaces.o
  LD       ui/browsers/perf-in.o
  LD       ui/perf-in.o
  CC       util/comm.o
  CC       util/thread.o
  CC       util/thread_map.o
  CC       util/trace-event-parse.o
  CC       util/parse-events-bison.o
  BISON    util/pmu-bison.c
  CC       util/trace-event-read.o
  CC       util/trace-event-info.o
  GEN      python/perf.so
  CC       util/trace-event-scripting.o
  CC       util/trace-event.o
  CC       util/svghelper.o
  CC       util/sort.o
  CC       util/hist.o
  CC       util/util.o
  CC       util/cpumap.o
  CC       util/affinity.o
  CC       util/cputopo.o
  CC       util/cgroup.o
  CC       util/target.o
  CC       util/rblist.o
  CC       util/intlist.o
  CC       util/vdso.o
  CC       util/counts.o
  CC       util/stat.o
  CC       util/stat-shadow.o
  CC       util/stat-display.o
  CC       util/perf_api_probe.o
  CC       util/record.o
  CC       util/srcline.o
  CC       util/srccode.o
  CC       util/synthetic-events.o
  CC       util/data.o
  CC       util/tsc.o
  CC       util/cloexec.o
  CC       util/call-path.o
  CC       util/rwsem.o
  CC       util/thread-stack.o
  CC       util/spark.o
  CC       util/topdown.o
  CC       util/stream.o
  CC       util/auxtrace.o
  CC       util/intel-pt-decoder/intel-pt-pkt-decoder.o
  GEN      util/intel-pt-decoder/inat-tables.c
  CC       util/intel-pt-decoder/intel-pt-log.o
  CC       util/intel-pt-decoder/intel-pt-decoder.o
  CC       util/arm-spe-decoder/arm-spe-pkt-decoder.o
  CC       util/arm-spe-decoder/arm-spe-decoder.o
  LD       util/arm-spe-decoder/perf-in.o
  CC       util/scripting-engines/trace-event-perl.o
  GEN      pmu-events/pmu-events.c
  CC       pmu-events/pmu-events.o
  CC       util/scripting-engines/trace-event-python.o
  CC       util/intel-pt.o
  LD       pmu-events/pmu-events-in.o
  CC       util/intel-bts.o
  CC       util/arm-spe.o
  CC       util/intel-pt-decoder/intel-pt-insn-decoder.o
  LD       util/scripting-engines/perf-in.o
  CC       util/s390-cpumsf.o
  CC       util/parse-branch-options.o
  CC       util/dump-insn.o
  CC       util/parse-regs-options.o
  CC       util/parse-sublevel-options.o
  CC       util/term.o
  CC       util/help-unknown-cmd.o
  CC       util/mem-events.o
  CC       util/vsprintf.o
  LD       util/intel-pt-decoder/perf-in.o
  CC       util/units.o
  CC       util/time-utils.o
  BISON    util/expr-bison.c
  CC       util/branch.o
  CC       util/mem2node.o
  CC       util/clockid.o
  CC       util/bpf-loader.o
  CC       util/bpf_map.o
  CC       util/bpf-prologue.o
  CC       util/symbol-elf.o
  CC       util/probe-file.o
  CC       util/probe-event.o
  CC       util/probe-finder.o
  CC       util/dwarf-aux.o
  CC       util/dwarf-regs.o
  CC       util/unwind-libunwind-local.o
  CC       util/unwind-libunwind.o
  CC       util/data-convert-bt.o
  CC       util/zlib.o
  CC       util/lzma.o
  CC       util/zstd.o
  CC       util/cap.o
  CC       util/demangle-java.o
  CC       util/demangle-rust.o
  CC       util/jitdump.o
  CC       util/genelf.o
  CC       util/genelf_debug.o
  CC       util/perf-hooks.o
  CC       util/bpf-event.o
  FLEX     util/parse-events-flex.c
  FLEX     util/pmu-flex.c
  CC       util/pmu-bison.o
  FLEX     util/expr-flex.c
  CC       util/expr-bison.o
  CC       util/expr.o
  CC       util/parse-events.o
  CC       util/parse-events-flex.o
  CC       util/pmu.o
  CC       util/pmu-flex.o
  CC       util/expr-flex.o
  LD       util/perf-in.o
  LD       perf-in.o
  LINK     perf
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf'
2020-12-24 12:51:30 cd /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea=
9a80b0ee4b4445ea59c806787813/tools/perf
2020-12-24 12:51:30 mkdir -p /pkg
2020-12-24 12:51:30 mkdir -p /kbuild/obj/consumer/x86_64-rhel-8.3
2020-12-24 12:51:30 cp /pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0e=
e4b4445ea59c806787813/vmlinux.xz /tmp
2020-12-24 12:51:31 unxz -k /tmp/vmlinux.xz
2020-12-24 12:51:35 cp /tmp/vmlinux /kbuild/obj/consumer/x86_64-rhel-8.3
ignored_by_lkp: BPF filter
ignored_by_lkp: LLVM search and compile
ignored_by_lkp: Add vfs_getname probe to get syscall args filenames
ignored_by_lkp: Use vfs_getname probe to get syscall args filenames
ignored_by_lkp: Check open filename arg using perf trace + vfs_getname
ignored_by_lkp: builtin clang support
2020-12-24 12:51:35 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 1
 1: vmlinux symtab matches kallsyms                                 : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 2
 2: Detect openat syscall event                                     : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 3
 3: Detect openat syscall event on all cpus                         : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 4
 4: Read samples using the mmap interface                           : FAILE=
D!
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 5
 5: Test data source output                                         : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 6
 6: Parse event definition strings                                  : FAILE=
D!
2020-12-24 12:51:37 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 7
 7: Simple expression parser                                        : Ok
2020-12-24 12:51:38 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 8
 8: PERF_RECORD_* events & perf_sample fields                       : Ok
2020-12-24 12:51:40 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 9
 9: Parse perf pmu format                                           : Ok
2020-12-24 12:51:40 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 10
10: PMU events                                                      :
10.1: PMU event table sanity                                        : Ok
10.2: PMU event map aliases                                         : Ok
10.3: Parsing of PMU event table metrics                            : Skip =
(some metrics failed)
10.4: Parsing of PMU event table metrics with fake PMUs             : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 11
11: DSO data read                                                   : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 12
12: DSO data cache                                                  : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 13
13: DSO data reopen                                                 : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 14
14: Roundtrip evsel->name                                           : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 15
15: Parse sched tracepoints fields                                  : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 16
16: syscalls:sys_enter_openat event fields                          : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 17
17: Setup struct perf_event_attr                                    : Ok
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 18
18: Match and link multiple hists                                   : Ok
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 19
19: 'import perf' in python                                         : FAILE=
D!
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 20
20: Breakpoint overflow signal handler                              : Ok
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 21
21: Breakpoint overflow sampling                                    : Ok
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 22
22: Breakpoint accounting                                           : Ok
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 23
23: Watchpoint                                                      :
23.1: Read Only Watchpoint                                          : Skip
23.2: Write Only Watchpoint                                         : Ok
23.3: Read / Write Watchpoint                                       : Ok
23.4: Modify Watchpoint                                             : Ok
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 24
24: Number of exit events of a simple workload                      : FAILE=
D!
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 25
25: Software clock events period values                             : FAILE=
D!
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 26
26: Object code reading                                             : FAILE=
D!
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 27
27: Sample parsing                                                  : Ok
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 28
28: Use a dummy software event to keep tracking                     : FAILE=
D!
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 29
29: Parse with no sample_id_all bit set                             : Ok
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 30
30: Filter hist entries                                             : Ok
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 31
31: Lookup mmap thread                                              : FAILE=
D!
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 32
32: Share thread maps                                               : Ok
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 33
33: Sort output of hist entries                                     : Ok
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 34
34: Cumulate child hist entries                                     : Ok
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 35
35: Track with sched_switch                                         : FAILE=
D!
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 36
36: Filter fds with revents mask in a fdarray                       : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 37
37: Add fd to a fdarray, making it autogrow                         : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 38
38: kmod_path__parse                                                : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 39
39: Thread map                                                      : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 41
41: Session topology                                                : FAILE=
D!
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 43
43: Synthesize thread map                                           : FAILE=
D!
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 44
44: Remove thread map                                               : FAILE=
D!
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 45
45: Synthesize cpu map                                              : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 46
46: Synthesize stat config                                          : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 47
47: Synthesize stat                                                 : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 48
48: Synthesize stat round                                           : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 49
49: Synthesize attr update                                          : FAILE=
D!
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 50
50: Event times                                                     : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 51
51: Read backward ring buffer                                       : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 52
52: Print cpu map                                                   : FAILE=
D!
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 53
53: Merge cpu map                                                   : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 54
54: Probe SDT events                                                : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 55
55: is_printable_array                                              : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 56
56: Print bitmap                                                    : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 57
57: perf hooks                                                      : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 59
59: unit_number__scnprintf                                          : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 60
60: mem2node                                                        : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 61
61: time utils                                                      : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 62
62: Test jit_write_elf                                              : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 63
63: Test libpfm4 support                                            : Skip =
(not compiled in)
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 64
64: Test api io                                                     : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 65
65: maps__merge_in                                                  : FAILE=
D!
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 66
66: Demangle Java                                                   : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 67
67: Parse and process metrics                                       : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 68
68: PE file support                                                 : FAILE=
D!
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 69
69: Event expansion for cgroups                                     : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 70
70: x86 rdpmc                                                       : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 71
71: Convert perf time to TSC                                        : FAILE=
D!
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 72
72: DWARF unwind                                                    : FAILE=
D!
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 73
73: x86 instruction decoder - new instructions                      : Ok
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 74
74: Intel PT packet decoder                                         : Ok
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 75
75: x86 bp modify                                                   : Ok
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 76
76: probe libc's inet_pton & backtrace it with ping                 : Ok
2020-12-24 12:52:07 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 77
77: Check Arm CoreSight trace data recording and synthesized samples: Skip
2020-12-24 12:52:07 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 78
78: build id cache operations                                       : FAILE=
D!
2020-12-24 12:52:08 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 81
81: Zstd perf.data compression/decompression                        : FAILE=
D!



To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml



Thanks,
Oliver Sang


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.10.0-rc3-01127-g8c3b1ba0e7ea"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.10.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-9 (Debian 9.3.0-15) 9.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=90300
CONFIG_LD_VERSION=235000000
CONFIG_CLANG_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_BPF_LSM is not set
CONFIG_BPF_SYSCALL=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
# CONFIG_BPF_PRELOAD is not set
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
CONFIG_X86_AMD_PLATFORM_DEVICE=y
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
# CONFIG_XEN_PV is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_AMD=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m
CONFIG_X86_THERMAL_VECTOR=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
CONFIG_PERF_EVENTS_AMD_POWER=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_I8K=m
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_AMD=y
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_AMD_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
CONFIG_NUMA=y
CONFIG_AMD_NUMA=y
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
CONFIG_ACPI_APEI_ERST_DEBUG=y
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_PMIC_OPREGION=y
CONFIG_X86_PM_TIMER=y
CONFIG_SFI=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_AMD_FREQ_SENSITIVITY=m
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32 is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_SYSVIPC_COMPAT=y
# end of Binary Emulations

#
# Firmware Drivers
#
CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_VARS=y
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
CONFIG_APPLE_PROPERTIES=y
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_DEV_PATH_PARSER=y
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
CONFIG_KVM_MMU_AUDIT=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_OPROFILE=m
CONFIG_OPROFILE_EVENT_MULTIPLEX=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
CONFIG_BLK_WBT_MQ=y
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
CONFIG_MINIX_SUBPARTITION=y
CONFIG_SOLARIS_X86_PARTITION=y
CONFIG_UNIXWARE_DISKLABEL=y
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_THP_SWAP=y
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=19
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
# CONFIG_ZSWAP_DEFAULT_ON is not set
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
# CONFIG_ZSMALLOC_PGTABLE_MAPPING is not set
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DEVICE=y
CONFIG_DEV_PAGEMAP_OPS=y
CONFIG_HMM_MIRROR=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_FRAME_VECTOR=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MAPPING_DIRTY_HELPERS=y
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_COMMON=m
CONFIG_NF_LOG_NETDEV=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_COUNTER=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=m
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
CONFIG_NF_LOG_BRIDGE=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB2 is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=m
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
# CONFIG_BT_6LOWPAN is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
# CONFIG_BT_HCIBTUSB is not set
# CONFIG_BT_HCIBTSDIO is not set
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
# CONFIG_BT_HCIBCM203X is not set
# CONFIG_BT_HCIBPA10X is not set
# CONFIG_BT_HCIBFUSB is not set
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
# CONFIG_BT_MRVL_SDIO is not set
# CONFIG_BT_MTKSDIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_RDMA is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_BW is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
# CONFIG_XEN_PCIDEV_FRONTEND is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_PM_QOS_KUNIT_TEST is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_KUNIT_DRIVER_PE_TEST=y
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SKD is not set
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_XEN_BLKDEV_FRONTEND=m
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_RDMA is not set
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_RDMA is not set
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
CONFIG_PVPANIC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_VIRTIO is not set
# CONFIG_INTEL_MEI_HDCP is not set
CONFIG_VMWARE_VMCI=m
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_XEN_SCSI_FRONTEND is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_GDTH is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_FIRESTREAM is not set
# CONFIG_ATM_ZATM is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_AMBASSADOR is not set
# CONFIG_ATM_HORIZON is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set

#
# Distributed Switch Architecture drivers
#
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
CONFIG_NET_VENDOR_AMD=y
# CONFIG_AMD8111_ETH is not set
# CONFIG_PCNET32 is not set
# CONFIG_AMD_XGBE is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_NET_VENDOR_AURORA is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
CONFIG_IXGBE_IPSEC=y
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLIB=y
# CONFIG_LED_TRIGGER_PHY is not set
# CONFIG_FIXED_PHY is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_MSCC_MIIM is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# CONFIG_PCS_XPCS is not set
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
# CONFIG_ATH11K is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
# CONFIG_PRISM54 is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
CONFIG_WLAN_VENDOR_MEDIATEK=y
# CONFIG_MT7601U is not set
# CONFIG_MT76x0U is not set
# CONFIG_MT76x0E is not set
# CONFIG_MT76x2E is not set
# CONFIG_MT76x2U is not set
# CONFIG_MT7603E is not set
# CONFIG_MT7615E is not set
# CONFIG_MT7663U is not set
# CONFIG_MT7663S is not set
# CONFIG_MT7915E is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=m
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set
CONFIG_XEN_NETDEV_FRONTEND=y
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_HYPERV_NET is not set
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set
# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_POLLDEV=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
CONFIG_CYCLADES=m
# CONFIG_CYZ_INTR is not set
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK=m
CONFIG_SYNCLINKMP=m
CONFIG_SYNCLINK_GT=m
# CONFIG_ISI is not set
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
# CONFIG_TRACE_SINK is not set
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
CONFIG_HVC_XEN_FRONTEND=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
CONFIG_HW_RANDOM_AMD=m
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set
CONFIG_NVRAM=y
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=8192
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
# CONFIG_TCG_XEN is not set
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
CONFIG_I2C_AMD756=m
CONFIG_I2C_AMD756_S4882=m
CONFIG_I2C_AMD8111=m
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_BROXTON=m
CONFIG_PINCTRL_CANNONLAKE=m
CONFIG_PINCTRL_CEDARFORK=m
CONFIG_PINCTRL_DENVERTON=m
# CONFIG_PINCTRL_EMMITSBURG is not set
CONFIG_PINCTRL_GEMINILAKE=m
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
CONFIG_PINCTRL_LEWISBURG=m
CONFIG_PINCTRL_SUNRISEPOINT=m
# CONFIG_PINCTRL_TIGERLAKE is not set

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_AMDPT=m
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
# CONFIG_SENSORS_AMD_ENERGY is not set
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_PKG_TEMP_THERMAL=m
CONFIG_INTEL_SOC_DTS_IOSF_CORE=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=m
CONFIG_ACPI_THERMAL_REL=m
# CONFIG_INT3406_THERMAL is not set
CONFIG_PROC_THERMAL_MMIO_RAPL=y
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=m
CONFIG_SP5100_TCO=m
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_XEN_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=m
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SL28CPLD is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_RC_MAP=m
CONFIG_LIRC=y
CONFIG_RC_DECODERS=y
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_SONY_DECODER=m
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_IR_IMON_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_RC_DEVICES=y
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_IR_ENE=m
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_ITE_CIR=m
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_STREAMZAP is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_TTUSBIR is not set
# CONFIG_RC_LOOPBACK is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
CONFIG_IR_SIR=m
# CONFIG_RC_XBOX_DVD is not set
# CONFIG_IR_TOY is not set
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
# CONFIG_CEC_SECO is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2=m
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_RADIO_ADAPTERS=y
# CONFIG_RADIO_SI470X is not set
# CONFIG_RADIO_SI4713 is not set
# CONFIG_USB_MR800 is not set
# CONFIG_USB_DSBR is not set
# CONFIG_RADIO_MAXIRADIO is not set
# CONFIG_RADIO_SHARK is not set
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_USB_KEENE is not set
# CONFIG_USB_RAREMONO is not set
# CONFIG_USB_MA901 is not set
# CONFIG_RADIO_TEA5764 is not set
# CONFIG_RADIO_SAA7706H is not set
# CONFIG_RADIO_TEF6862 is not set
# CONFIG_RADIO_WL1273 is not set
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set

#
# MMC/SDIO DVB adapters
#
# CONFIG_SMS_SDIO_DRV is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_TEST_DRIVERS is not set

#
# FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_TVAUDIO is not set
# CONFIG_VIDEO_TDA7432 is not set
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
# CONFIG_VIDEO_MSP3400 is not set
# CONFIG_VIDEO_CS3308 is not set
# CONFIG_VIDEO_CS5345 is not set
# CONFIG_VIDEO_CS53L32A is not set
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
# CONFIG_VIDEO_WM8775 is not set
# CONFIG_VIDEO_WM8739 is not set
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_SONY_BTF_MPX is not set
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_ADV7604 is not set
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
# CONFIG_VIDEO_TC358743 is not set
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
# CONFIG_VIDEO_CX25840 is not set
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_SAA7127 is not set
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
# CONFIG_VIDEO_ADV7511 is not set
# CONFIG_VIDEO_AD9389B is not set
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set
# end of Video encoders

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
# CONFIG_VIDEO_UPD64083 is not set
# end of Video improvement chips

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# CONFIG_SDR_MAX2175 is not set
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
# CONFIG_VIDEO_M52790 is not set
# CONFIG_VIDEO_I2C is not set
# CONFIG_VIDEO_ST_MIPID02 is not set
# end of Miscellaneous helper chips

#
# Camera sensor devices
#
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_IMX214 is not set
# CONFIG_VIDEO_IMX219 is not set
# CONFIG_VIDEO_IMX258 is not set
# CONFIG_VIDEO_IMX274 is not set
# CONFIG_VIDEO_IMX290 is not set
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX355 is not set
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV2740 is not set
# CONFIG_VIDEO_OV5647 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV5670 is not set
# CONFIG_VIDEO_OV5675 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV7251 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_OV13858 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M001 is not set
# CONFIG_VIDEO_MT9M032 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_M5MOLS is not set
# CONFIG_VIDEO_RDACM20 is not set
# CONFIG_VIDEO_RJ54N1 is not set
# CONFIG_VIDEO_S5K6AA is not set
# CONFIG_VIDEO_S5K6A3 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_SMIAPP is not set
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_S5C73M3 is not set
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9768 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set
# end of Flash devices

#
# SPI helper chips
#
# CONFIG_VIDEO_GS1662 is not set
# end of SPI helper chips

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=m
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_MSI001=m
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_MXL301RF=m
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_M88DS3103=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_TDA18271C2DD=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TUA6100=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=m
CONFIG_DVB_SP887X=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
CONFIG_DVB_S5H1432=m
CONFIG_DVB_DRXD=m
CONFIG_DVB_L64781=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_MT352=m
CONFIG_DVB_ZL10353=m
CONFIG_DVB_DIB3000MB=m
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB9000=m
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_EC100=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_RTL2832_SDR=m
CONFIG_DVB_SI2168=m
CONFIG_DVB_ZD1301_DEMOD=m
CONFIG_DVB_CXD2880=m

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_STV0297=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51211=m
CONFIG_DVB_OR51132=m
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=m
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m
CONFIG_DVB_MN88443X=m

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=m
CONFIG_DVB_LNBH25=m
CONFIG_DVB_LNBH29=m
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
CONFIG_DVB_A8293=m
CONFIG_DVB_LGS8GL5=m
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ASCOT2E=m
CONFIG_DVB_HELENE=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
CONFIG_DVB_SP2=m
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
CONFIG_DRM_I915_GVT_KVMGT=m
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=m
CONFIG_DRM_VMWGFX_FBCON=y
CONFIG_DRM_GMA500=m
CONFIG_DRM_GMA600=y
CONFIG_DRM_GMA3600=y
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_XEN is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_XEN_FBDEV_FRONTEND is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=m
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID=m
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_XIRCOM is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_STUSB160X is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_EFA is not set
# CONFIG_INFINIBAND_I40IW is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_USNIC is not set
# CONFIG_INFINIBAND_BNXT_RE is not set
# CONFIG_INFINIBAND_RDMAVT is not set
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=m
CONFIG_INFINIBAND_SRPT=m
# CONFIG_INFINIBAND_ISER is not set
# CONFIG_INFINIBAND_ISERT is not set
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
# CONFIG_INFINIBAND_OPA_VNIC is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_DECODE_MCE=m
CONFIG_EDAC_GHES=y
CONFIG_EDAC_AMD64=m
# CONFIG_EDAC_AMD64_ERROR_INJECTION is not set
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RX6110 is not set
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_XILINX_ZYNQMP_DPDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_HV_GENERIC=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_VFIO_MDEV_DEVICE=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
CONFIG_VIRTIO_MEM=m
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
# CONFIG_XEN_BALLOON is not set
CONFIG_XEN_DEV_EVTCHN=m
# CONFIG_XEN_BACKEND is not set
CONFIG_XENFS=m
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
# CONFIG_XEN_GNTDEV is not set
# CONFIG_XEN_GRANT_DEV_ALLOC is not set
# CONFIG_XEN_GRANT_DMA_ALLOC is not set
CONFIG_SWIOTLB_XEN=y
# CONFIG_XEN_PVCALLS_FRONTEND is not set
CONFIG_XEN_PRIVCMD=m
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
# CONFIG_XEN_UNPOPULATED_ALLOC is not set
# end of Xen driver support

# CONFIG_GREYBUS is not set
# CONFIG_STAGING is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_ALIENWARE_WMI is not set
# CONFIG_HUAWEI_WMI is not set
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_XIAOMI_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
CONFIG_DCDBAS=m
CONFIG_DELL_SMBIOS=m
CONFIG_DELL_SMBIOS_WMI=y
# CONFIG_DELL_SMBIOS_SMM is not set
CONFIG_DELL_LAPTOP=m
CONFIG_DELL_RBTN=m
CONFIG_DELL_RBU=m
CONFIG_DELL_SMO8800=m
CONFIG_DELL_WMI=m
CONFIG_DELL_WMI_DESCRIPTOR=m
CONFIG_DELL_WMI_AIO=m
CONFIG_DELL_WMI_LED=m
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
CONFIG_HP_WIRELESS=m
CONFIG_HP_WMI=m
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_INTEL_ATOMISP2_PM is not set
CONFIG_INTEL_HID_EVENT=m
# CONFIG_INTEL_INT0002_VGPIO is not set
# CONFIG_INTEL_MENLOW is not set
CONFIG_INTEL_OAKTRAIL=m
CONFIG_INTEL_VBTN=m
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_I2C_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
CONFIG_INTEL_PMC_CORE=m
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
CONFIG_PMC_ATOM=y
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
CONFIG_HAVE_CLK=y
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_AMD_IOMMU=y
CONFIG_AMD_IOMMU_V2=m
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
# CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_BLK=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX_DRIVER=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_DEV_DAX_PMEM_COMPAT=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_EXT4_KUNIT_TESTS=m
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_IO_TRACE is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_WEAK_PW_HASH=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_APPARMOR_KUNIT_TEST is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_LSM_RULES=y
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_GLUE_HELPER_X86=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD128=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_RMD256=m
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_TGR192=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_DES3_EDE_X86_64=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CHACHA20_X86_64=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=m
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_DMA_VIRT_OPS=y
CONFIG_SWIOTLB=y
CONFIG_DMA_COHERENT_POOL=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=200
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_X86_DECODER_SELFTEST=y
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
# CONFIG_KUNIT_DEBUGFS is not set
CONFIG_KUNIT_TEST=m
CONFIG_KUNIT_EXAMPLE_TEST=m
# CONFIG_KUNIT_ALL_TESTS is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_SORT is not set
# CONFIG_KPROBES_SANITY_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
CONFIG_TEST_BPF=m
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_BITFIELD_KUNIT is not set
CONFIG_SYSCTL_KUNIT_TEST=m
CONFIG_LIST_KUNIT_TEST=m
# CONFIG_LINEAR_RANGES_TEST is not set
# CONFIG_BITS_TEST is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='perf-sanity-tests'
	export testcase='perf-sanity-tests'
	export category='functional'
	export need_memory='2G'
	export job_origin='/lkp-src/allot/cyclic:p1:linux-devel:devel-hourly/lkp-skl-d04/perf-sanity-tests.yaml'
	export queue_cmdline_keys='branch
commit
queue_at_least_once'
	export queue='validate'
	export testbox='lkp-skl-d04'
	export tbox_group='lkp-skl-d04'
	export kconfig='x86_64-rhel-8.3'
	export submit_id='5fe49e2bb99997296ce28ab9'
	export job_file='/lkp/jobs/scheduled/lkp-skl-d04/perf-sanity-tests-gcc-ucode=0xe2-debian-10.4-x86_64-20200603.cgz-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813-20201224-10604-1smgflm-2.yaml'
	export id='2328ebc5ab86b596d1cf265ac0241d3781f54e8f'
	export queuer_version='/lkp-src'
	export model='Skylake'
	export nr_cpu=4
	export memory='32G'
	export nr_ssd_partitions=1
	export nr_hdd_partitions=4
	export hdd_partitions='/dev/disk/by-id/ata-ST1000DM003-1ER162_Z4YB7AEL-part*'
	export ssd_partitions='/dev/disk/by-id/wwn-0x55cd2e404b64c499-part2'
	export rootfs_partition='/dev/disk/by-id/wwn-0x55cd2e404b64c499-part1'
	export brand='Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz'
	export need_linux_perf=true
	export commit='8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813'
	export need_kconfig_hw='CONFIG_E1000E=y
CONFIG_SATA_AHCI'
	export ucode='0xe2'
	export enqueue_time='2020-12-24 21:57:03 +0800'
	export _id='5fe49e2bb99997296ce28ab9'
	export _rt='/result/perf-sanity-tests/gcc-ucode=0xe2/lkp-skl-d04/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813'
	export user='lkp'
	export compiler='gcc-9'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='1b32c6cf0d6c9a541f095fe99e23c9ecd80eee26'
	export base_commit='2c85ebc57b3e1817b6ce1a6b703928e113a90442'
	export branch='drm-intel/drm-intel-gt-next'
	export rootfs='debian-10.4-x86_64-20200603.cgz'
	export result_root='/result/perf-sanity-tests/gcc-ucode=0xe2/lkp-skl-d04/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/3'
	export scheduler_version='/lkp/lkp/.src-20201224-092605'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-10.4-x86_64-20200603.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/lkp-skl-d04/perf-sanity-tests-gcc-ucode=0xe2-debian-10.4-x86_64-20200603.cgz-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813-20201224-10604-1smgflm-2.yaml
ARCH=x86_64
kconfig=x86_64-rhel-8.3
branch=drm-intel/drm-intel-gt-next
commit=8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/vmlinuz-5.10.0-rc3-01127-g8c3b1ba0e7ea
max_uptime=2100
RESULT_ROOT=/result/perf-sanity-tests/gcc-ucode=0xe2/lkp-skl-d04/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/3
LKP_SERVER=internal-lkp-server
nokaslr
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/modules.cgz'
	export linux_perf_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/linux-perf.cgz'
	export bm_initrd='/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201211.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/perf-sanity-tests_20201111.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/perf-x86_64-fa02fcd94b0c-1_20201126.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20201117.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='4.20.0'
	export repeat_to=4
	export queue_at_least_once=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/vmlinuz-5.10.0-rc3-01127-g8c3b1ba0e7ea'
	export dequeue_time='2020-12-24 22:00:59 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-skl-d04/perf-sanity-tests-gcc-ucode=0xe2-debian-10.4-x86_64-20200603.cgz-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813-20201224-10604-1smgflm-2.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test perf_compiler='gcc' $LKP_SRC/tests/wrapper perf-sanity-tests
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper perf-sanity-tests
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time perf-sanity-tests.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--EeQfGwPcQSOJBaQU
Content-Type: application/x-xz
Content-Disposition: attachment; filename="kmsg.xz"
Content-Transfer-Encoding: base64

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj4ybYfvRdADWZSqugAxvb4nJgTnLkWq7GiE5NSjeI
iOUi9aLumK5uQor8WvJOGrz5sBtYpRIEMtFOM8CwN/5vEbu3TAeXytawKpt3wYECbPvbAy+n
TsfXVA8Qldwr1AFMq4c/UUzp+yjznyLfUkf5BuJyHYVFOOCARODGFojXiBHHVRvZ5G4oxVe8
FTLSyYsXHkUEhcPZbCswvjyFfiv4QGBZV4KFzDd7CLDp4dpoKr1K/gRDvBBM3SFGIIkIpmr1
pkCVOWytG6LcOyF21QRhUMAtiwNpPD/UyiUqEQ3Hi+DJdleRkdW9NtwIJ7NRoCppGH126M8C
FYmRJZYeu8CcB2SVfmRbV5wS6ClOHS6pVtDQ62WRoTpmFQUQrLyeHiMGQnjlVf/ufobRvecV
PqtvzDaMT+x0ecgtzXdR8GfFxmsOuP6+PmSMyPaCKB8hjpaz0oYb6uxKlVB3YCgpOZsCblHn
r1XBjPJUfj1Q4OhUWC36aUAalYDawdkS97UPVincg+j4yBx3pBxWEKg5x7EAIte0tJq1B4U3
VbnyeNHQFuU9D/DpuQbAWKm9dYhOYtyJDocbDNcx6OBs/AygSa3ZTC6c/DT1uCzzoUiwkwoG
h+dvyV4r+53xrlpvjxkwM4fmtcZm+T07c2/mpQ9OZcewyE+gqFzDWcm1GVxwpoFYwAJQ9BiK
FG5+doKUdiBVjy6/oc6AEGLx1FLeQ/g0/UUfPouXwmWJSxs9llUvq2FCHz+S30ub0GJkQjAA
v4ZDNfq8QvlkT6PIWowHTl2XYKWvmGBwE+/ClpqTQc1nbn9ZcBTXJMNhZAbcAknyfTi3Opy3
exA53Xno9vhFj2ctF3oUeM8epyrWQVnRDpZ89u/uBgl8DkV5y+xgUOXOBrOMuVh/sKxRVMvt
MTQu+e/fonEYtGaQq/NoPFYbGmtskoYgmPvlnT6zXnvxiY4a43efCeNhu0z4arXAc3SjLPgN
kojPH8IfQ/zvWoDSWzz4SZDC3cHZXxRH5uCgu6CKORuUv4EnCHRBja2O8/4DGi7ZnxY5gbG/
mqvhoxNDancyR+EJTT2DNuFjbry+azWpS/33I1TmjqQXytfcG6sl7fPaOrSN7WhpihNStMFv
HqHjQnmO6xxzt1Nq2bYCAteQvmv7C92NGRiywxGnDt8gHTJlHDFpOrRyuhsKQRPTdeeQ/IVu
UCH8+zwcjeWkkTjjC+rqx5ZF9Woi8jAdcG9McdNcO56Z8eiIXlNZ8Sm+fz7ESGWwumGudBQV
dBnap00PqCKEJBv84z64DD8ZWJzcgfofGl32mo5SxKF71q3WonAPigh5jMfFDW/JiJn4bUHE
jH1BYJEXs6kZVEOCmD3yCMirSnbKZBvgBqASaMdUdRzIn7cLGTvHA7prf3yOxQSXKmtCVOsE
IZs0CdUxcpkqnBedzMPMdAnnXlY4VG/jFtuNbGCPY1k7Mbn7vtDwb8CXcKBltLO0SMJ6ALk2
TMTsW9TuYXD4GKISOIOEhdV+9NQLJC4V0vEuvXJzKKKfVeR+fddXMa8qH/ZviWiRqBY6gYFk
zmxOGHNOhbI0JSUkXrZkpdOk2wSbKu5H0pe9dSx+w4GtEoYb6hGqGkxr0EeKrYYnIUq18QeW
8j/bJL+gHKBIPJmR1QalqUpR0BFiHRyNxyhEmF0JrmWTcILiGTw5SdGy//oTue5mY94SGfg+
GXVJy06PIB6GUzG5e5icXf+OQHFG2zMoGeKDeOshuD59/HrnhaRgF6dzBaydYM8CJ40iFAXF
VKSp1jEGPetQLEb6meTURv/x+MTk/AgtRLIpWXlpx42+43k3dRhW1EbdMiZUNT58jAA772Fe
cesrLkiM3fHNDIbxciLTTHbdE5jqg+NxDqw2e0QWYI+YOmrYzz7R+fFcRMBtjaYm9Ny3G06r
v9qyYmAgZ++6cx3FkcuKaj/hW3toZrlijz5t/Nm//5d+PTELfJtC9FgJAUlLTfayzdjEKLCE
kEpKWhhq31IeXaiSrV+ildK6+Qh2JTV8QWIxW4jRn4s+FXegarTkdimHkrIqDLl3ixOvrHUw
OseGe0jGt8eDfEXGzbmxtTSJHi9QzMJ3wKwGzaLqKNvSV4KCTY+8ASc5PKk4Q2YbQ0MKRsLj
th2baJ/vQGtbuv54pizjL4MrfiNFCnWLeilw1DnLJcN70ARdme8ZsU69kcGP4YycsQWU8Ban
GH6ny2OUybkGVryk601Y+30TGuiEneZ+Oe34ELFfWpu3vw9RIn5srD1WDsDP2pzyh539ykYM
IeHfyVknaMrPpggkxOU3Zf4zRa5AeR3e57/GSg5w2K8bORaejbY2HCZYDNvq58+H6edyBPRh
7eV8PLhQLn+xuo/iQ/nzR5pDka2qCTSeRrTGbhI6uqKj+zkOeLk5u+xmVyytAf+zMrC5C2TG
x4sSI41/M5NbZu2vddXs+9NZwU+Wdvg6FxWH45SJOyaTiAvh5C2DqHkz60yw14/SoZY0MFoF
PlaOmJL3uYEaFZ72rSuOENnjojmuxa3cu2H1gThuiSeY3R+iT3EJbGnjinePGf2C2xp9AVgd
dLKeS+D788Mi9952LW0zrGYm+2R1nC37AXM9JyDMJaezKfUXPY3EYOIz+QdMoRNDsX9ht0La
5deD2HWItmZqjH12aAc5AsM1O2s198y5zVRJJBNTtXeFcmA7ge/s3laevA7B1EYSBQTOIifd
xWzYEdZN1hArP0ToayoCl0g96yiu4UawhwylhtllcxUQajgMD2JkIRP22mxbDYqy0XEXxGgi
tB4ixs8YzaPXJ59eVCFfg1bSsvnDNrmgDdNa4HiSuee1tUIhvKex2gtTcGiZRudR+lPm95YR
dhcQLqw1li2rkIuca3Rd+NQoDlOk23cJm2d2vp43RNf/gYRAxYg00r8s4EzAeDfX1tJyH1qm
kVU/uKYD3hfIrFNPVx/fZM6rXKVWJvzN8rvzf1/la930Ba4sXkKbt4nA96ELVQ/C9Pteazf4
6PIe6VGCESrnndVmHC5vy5NIMgjzwt4qzBdBqVtytb3sRaXNi9XGCMXqsWso1+0+2VlLuojs
cnrMO0loWFX6KIfwr6THW0s3oytInDH8rGFEFtrn1pddPZNxHAmezuRsD7/tKFMzpw1tNnCz
Hx/dHHIH+8PgfvsM7+6zIi3/O7VSQMTuLLQdAh11/8nGpCj61E6o5DD5fNUQ4QxhOD/7+S39
9fLrWKjMWq6nDAKEAPt+sMgZ828XPN9GrKsBTN7gODJQaLfI4JEBH6doHx8HOHLyCBHPeAiO
rXrmbA0kzWTjba1BSg3QqCdTkUbVcHVAIabAUsA2Ou5w6aMnsrbdGHfdzZmHsH2VqXcE5qHJ
lofhZuwyN5XRtQE/qOTE/AQKhjw+fqgm/653aLYfTsBNw0H9ZU2eqHD5OggN5DxO9+vOAaVc
QcnTcsP0oX4ewHfhevJiIYsUu9IlzMf/fOSuxeC1neLTVryXdsiCjadl92WTZ/Fxnm8NSMCD
mNiQWzFLTr2k5+dHXQtMr2ARcGWuNceP+vD5CyBoFYb+LS0xU1bTlDBKDUjlp/7fSXFWr5FB
kBeBN7Mf3aCL5Ew3XKufSQ/q8N7MhSBlK/Bft9ix835C93axHYshlUTpqKVnPJmLrohdDb2J
05HS2Fkv93rUmi2XundaSx1thddUQmwBT8wumapVbkHgFyArSsmbRWmzMGedVA7aQT1q20FG
9T+NhjDqVRRLwMaxsUdq26cwiuvAV4VdL4qydnEDODU9JOXkUI7l/CAXiCjAxue5qfE8S+lF
ofM3WZfA3iBPru+aanDcu1PiI2rKDUdfVl/5qbMr4PbmIFwAG53wWBJEKswf94Lyczffeh5U
WT7LMDHVG7/UeohWHoPpNCnjy0N8oIn+dVuuQGku4U0xlzmtKjQh5LHDgxLNeOpQkYX/vx7h
Aqbx8lITVuSaRDDVwO9kbc/w0WncxqPeBfgWLu2Xm004XCfmURE9ITxwyQMvmUwa0GGkEXMA
IuxTLSOP+fZ7812TWvJnNRvwXXqn2lSrRQmw0yuuNxG9IQSb6zub1hxk15PTPbNN9BUECUyS
cQsRGoqhWL+uNgt3W9iqjU650wuw37a8JcMlLFQKic9XHujf+3jcNQfZQdstJZHH2GoRGDW1
Kma1eX6Om9idf0BC4ccFPO4j7ILaJjdBnCFs5IwJKVW/get1vVMT0lyPYOS7T6W7PbB+50Wo
63F6PSeIrWp8LkincKQEpv5cgucD3YAmipD3Ba1Teoh8VEGFg9alBypjdVXuaqpewd7mXrwm
CHk3Xh69lZ8fLbs8h3eYEGLTgJQAaAgnrJR25ZhJ5cpBQxZWFpkkIrafpJwiLnHKR2kadDAC
f9JH5QPX0gaNMvz/rbNHudtJ8tnE84gtZNduYCXwLMUGDau6pg9JYs08VhsEGAvm2ADv8A8X
hSCyReooaD/gZHR561v35rkoPtKfQ9YFowemncmyA63sCqYQ29bGLIJlp4rnOE6j0/TyJW9q
VEAjrsqAWuNXLuWFw99l9TV80ExKJHal0y00MlTM7GtS3SHrf6vW3GklKHb83T+Ygyd8XkTB
sAd43bIXc4XL+fIZ1DYFNvc7CfodoVofhd2Iowek5vc2XqTR8AsClHnuCo8GLKZVfigbF0bo
kUkXMOjLTiQgNhuLY7ppGB+v1nQYNYK4V4jsIKU4wSEAVJN4UIwNbE2E7VwpEdICcZEWXvXJ
KahUCqoB4iY63lsHOA1ABTGdnrIVdlfXAU7tCQQSJj/MvhgaHh4pf2JrifAQy9aJjf/hPo0k
m6kZEi5fgMi1oUh+Gfi2G8NO7WjsQDU+MjgpSIT0Vba2/efwNjO0Fh1fFx7zrRrJQONM/m3T
78AZRSpK6twLEptU4IUYni72h3M9XdtkGEDFO4vQFbXKKsYhk8JuTEd+CJVJSRaglLrbxNBb
7cQs9AudyRHhDcxuK1PvzU1gzrvZfWwdr82b1AKBZKJhx1YbWMGSJeazpWH6uaqbY4/bVNv9
QzedWl/q3DlJO/r19PfXDyvZdfKgQ5gCL9YTjmJRf+pFTJuANlCo1zQ2toUdtZZIPXLtZauH
RRUWX+6xq+8DBIYKOT99585867G7EHsiHEhaNkNt6EK0I5zVwwsISB9qLubJJncTu/vm5/ae
HAEEg2tctyqOIPCUczeQtHaNNv8rQ4ieIBN0UeTsKwsNJ3bxruCWweSHyKNzc1zy9MxRtEb+
j9tXjKwp2wrv5hn7ACY9KrLvFj2QZh8laCECfmMFDhLNhhpOzgspTNVMN9k/X5BPMPbwlA63
fZP31M26gRY2yklJ+nmuH5RpA6un3IrIFGS2ioUQ8Eq2HAfHe1KQK+W4bSyV8ne0VNn2BWPp
mcehH2UBO2zoqFVPeOVkXOqul5OXFCB7vPErWYXk7r55hEFAtSPiqFjdqraoQt3xzRMToaqO
ufpi+R7EZrFvjH/rBFST735md+WreGTE/rvl5xGiL3hVw7wKmofemOGTdFQs59RGLjF/bsZV
pm+fJPT+wbsZ/+Jt6wlgYrjyaJWxarBVymxz+Mh3Zm2sKot4Scoc2xls4uEM3PU6bc3BBbmi
DyJfB7/5PJKBJOqgWQFsSHPGSjwMFStrS8KXJ7IrOUhVNwwIi/HusOBkrUridHdB1t5Xy1go
BllktG9t8VC3RHB+3e61EAf9Y+DsKJpsiajmmuw2Wsv/MZvQ0VVXojrDhJgASUqud3xZDjHM
sbKTevB7xNeeX2xf5qcu7hbo/ha2+Duej8XqU98O7kDuUFvAOTIcphyy5F2hldWjs3mBq7yv
9yv6PQexrIqSgK+LGKwNh67r3SCU+AEUU8khTLsUre/av5nWaUNclqq948Q2mdyB+QZjSF0F
jDpltZQo+rQLndqPl0YoeLBI4dU7XVTsMtnG2qD+r7PrIq48dku/sgarIz7BXvNrHyra/2qA
TfGoh/7F1x8pcOshyFga/3cIUoeXKQ3pFIxGHFvNvp0LmeGkGfDa0fbtsm7ysA+9sBPpZO+I
WpSOEnWCm0z04fAU9Nzb/m0BHobIcD9BTe2uIGQi/fjuB6XXUVhAUd3GH+vnZr56gGQjnxid
M7LANUX004pvgvCJ3nKckVbo2nDhbA3CddmM+vJCmG7TDbmIWKH76FdvtnOkYAKQZPoPiZ97
T+FDp6wHEm2LsmFsxkn0+h4vfqPTTVRVZlIjoe2qFvbFbJIxx2OTd1PrlL6bgdFQ7GNQAZ+g
+MZ7hgFGHCtYTr8A6QkyD1svCsFjp7ul17lsuSOGa/pmmguqVaYjGCjhm8oSWc0s5MuWF277
/gfoiFOASLdm0ypFt7AZbGQCwYyNDdyxED3osBjPcNR6KfvokGIthm68K5cZ6pJrenDORGDz
BB0y5OKB2cvhIloBENmdzaIlta25VrZutSLsMMzwUfy8piQsoUAN9RtD6cLcoqS0B71rTHho
DT7Z6mSPWsHdeFQcb/kSEbTbd48nirUQ10UDwGxgoD7+5ngO9LGH1rx77+BGZqx0o5VSV44a
DgeS03Ttb9aiMsiAOTUUw7FgwoXDi1zqAtTW39r/r17pwvrUFUDxjEQ+gz9v1c6IZKb7WoOl
h1cNJsNnRHNVV77PY91C12DUUrWzAiJejrx/SDnl1w0EIWjPqYfv/9JVL+FkvfhlOSoPzT+V
VShf+anxj3J87+onEbsKyt0Y9Qrbc8FbfrOPoVmKxG+GpvZPteg8wM19plzW1K5pYIn9z2A7
RHS04Cg291ppJU6EsEdLbtUcWaDUfldukVAm1Oy9vbCimIaVJ0YY1Irv6U/HfywmgiV/mHad
0KBlOk3KI/nfSkl0d1SEycXJW16Gx2UGyUDUTF+Em9BjM/xMxD8riyYGrLOrqxhyWFsz6TOM
MQMpm7mTqf0yGciUJyLfdS8QFpy9c+1fHokM04T5dIveM1EpVrNeRRLVMXV5o583LIqgvMUu
T5ekPB5r9/RIF1HH09tKzjtPqs4xJ2HSaq2bodB4sx0qD50GtA3CfzI+rt/5Du1UHO2xr0kX
GS3yrIa7B02KLQLuu5YANTThwcwF69O78T4sNeoGzHUZKfVjJ9HeqvcDHUTHh8X20M50w18m
ggR/CzzewPnWeXdSBKsAAPoib2xoum0PTq9chBkdr9jfASerV/jgUWe5SNy98gQDmPYIUqx6
LJKPiD5NY90Yzv3Ce/ykdC/Rl4q20sSsx1cquxgbU0GUb3JjOSWIzyUzJNwGiM9RORFicFOU
cbqNE3sfPGBrlozK3cYFmOv9DB2LbM06qSwFN0PCHZDacQeiBDUyhwrlPbvrUr0TSMZUjuxj
kyaD53yFUonegMvrcNwRlyOCNTVUnb/EOkohGgHYnn390tac7lpcmRfZd/mippXUF6EJ2zhH
lseW0WxFByvsqx3/kU0gPbj+0G1h5M9MCP38AYG0XD19PcgvDdJ3dHIoHj7Y1gFb772z/o6k
pZqlijhoTYP8WsgCoIC9c93asghxIbR/byGs01ciQjVG54GgQ6exWCqsy88ggWPUCPTCN9x8
kKATPPeL+8jMMLztEEMWvAR4mTGM0u7rB2Bbuo1obdRlwmnxY5DaIOR/m8RbBMf2cW/brYTB
pkKz+J8+dxcj+wqrVGbP/oBa/vW0gWX/wBm+22oG9x3Q50wwgNwLNecbeCYnXRpTqVO76LaH
XXwHxKdmV4EpwKT12s3A+c0fNhZFGaZyaUDGUpI/L/kDPyLScPErhd39ULKhCQx3Rib87cri
qiMyvC33/JxNwi3Xr8nn5+4EFMXUPVh30+beTChDnisRAVR6B19NsYx2ADezExcDCJ19hllu
b6qryxAlJUUrW0thUSPKH4Jo6/Yk478FiBsngopRv4ElWDIov2cProcKgpzLEQglRMU4Vd8G
fslEY/xbnu28JFZ0Af415kTgMRnU3nsDYRVXC86db/HqEc8iRD0PFVdxD27Zx+0PjtalVIk/
WlPOkZLG66LUQmVGNbHTb6ITNBxJdXaoMsnws0nt41OM14pekPvkzDXZLK9/GOZQuBvdksp1
gTLNKS6P+kgQzgMEpv0XxIa8+YDiKX23m2ugFqI1O2IqVWnyeNHwzCEZL13khWXI6PUdhc7k
9S3XMIEvUabxueihyQAQY7YugxsSaBPGNiO8zZj+3hanOsQcUwa/k2sG+NFONQKVeAthFPRb
ymeK2g3clBdgwHqJ7VN7PiQnRAfWVW5L3/uIY9Y7TxraET78y3ZN+ed1mymXEKBrZXDP79Pj
JTMKTIlVE5XURkTyjMjy/mpuAnh9RAysVcnkuOM2jXXIy+QdeFh8RzY1IdZ1c1vy9ftPqgk0
MVPNeJo/AFFgwe2nfclvjdE17u4mP84yz7tAdwS8T2aZJboOWE9g5R60I/NzrpsPBm1qNpC5
bq/YQsyRv8Mn8PhK0pPcnkujZcHpkqTflplZUWSv2cHL5c9axITYXVHjdNoZT+cyvDPYfCq4
lxQnawBfVSD2TK8JAUc+zhthL+FuhVzGZzaPFOwwhMT9lv92bAPArRibbAPcmlNw+kyKUnR9
xC19dmzbfEj7aMOQtClAj2T0Twk92OjcoEc17eh8ZM7OASSnfso31HluwwIexp1ta76fNMzS
PaSSKxkkwaBhB5BtsXNlLhSLNeIQUtXmjLR5z7bChn6EeErwGahqva784/b/bLQiTQOSMAtm
hLkraxw/yAyIRfzVrWlWnEEfeeTyoTvmOIouLNN/x89Op+Z5Xv4wLjzRYVtvmf06Y2ddiMU9
dcpni3BRxGboCvdr0WWWGzZe7OfE9Wxw8iqNyTnP87Ja6SFTIEynziKVXoFTVVAUbW3xE5JZ
JKHl2z6Ntrk6zhnALo7Tc8wEDWDAuSikKp07i0Xefne8aePn2Us6a1M3K3XDfMoI0IeVtUJe
atluwkXBzGTHt8UPXzLM0QS0uE4PdXyDg0hyX/+oJtPdoFGZ4aYK2Al/CPYLrAcOKwvA4Tp8
APEiCkxWhD1cnqwhj2aPeA4uTULG14fZrO3LvHeu/RbO8YBqXFwSmGiLQCV8kPEqum6gZ4Zg
lbJOXRbs07/95AVPiUrTlIYAZFBo3GmiaIHH874sGwX+6NUMJURNR3BLAMJR5trTyoLsmWWr
6Q29380iRUOK/AZflx6enjv2pp+jPyTr+vVFnEHlPh07E+8dw6rS2P3m8d/Z5LxXPkPIqiJk
yI1clviCe5Wi8Con9Lnd7wJ1oHn6dX3vySCrgVNJv5sRzWGau8H0+i2XyHh6VtkFNVBT0bXc
SNUu1lkXTzSMbvcSAVaQfoKSUwUuvKd5D2lr8U2/1+qfPAZmS2+TKsjR2mUAy0JysSt1MBDk
I+IIWob7zYqtCAAVzCAidx7P4MOX0zmHxIXwcyQ7UpbDBcSHc5MpQToaB3wlPlsv8tuVxpr3
aO8S79XrZ4TTSRmhS2ZvCMa51ZqsH8QTLPzQhlf4mdQZF7SQ7sb4G+DmoaJeT4aktyMB6OdU
8yDzgnHlNwEMqwxraFKFqf2HIURVXLbX235f7Lfhn+VNsV1F9Q5y+aVi+niJ067JPSF/1H/w
DuhUqdeWQgzE4Pre8TmIWuRkOSBw7ED0ndaPo5rdwQE4Jhx7t7favWrX7N6ayIlFNEFj+BEG
PS18spFW6Dzwvy7eGeZpJ+6eOz02Kax52siW6FjG0QCANeCrUK2kBbBdn8S5Fhik8+WpNcqd
iH1RInfixarfj+YU0e+EmYTwAxqn1QYUwrjNSidnXQRU7RywcqBQBMIA+29Acfnyn0zoRlNw
bJ/igpt1d+hoYhsLYsaO22h9BJYAGKXGVeQDyQt9fyhqF6RAPr96wQXe7m6GuG7uQ5QbSvzN
+KUKrT5eTHh4OypTO9FMGj0gvdTY78Ci/x3d9Eu0CYSKN0sbvwTvxBrB3ffSI3hq/bwRRdW7
mtWJ1WdAdvGe2OBNNnzSbpjq1z+YTQ1+e2Lr5FvAsUM4CwOiFAx8/KTXlTL8d21ttxJERYZB
C80KNqN+ala+eYqV68Rwe/9f+CfLCu0qSO2A5cctpbpkkdY/RP6p0uqrLlixl6XloFpV9HEV
33NVBcMmYw1/P78ouVHNcGUI8/7k1ksa55qcv/99p990Va62vnUvbLmB/5pKSCgkldRe2lms
pjproqohIt6u6MJgN+qQx9NaDIKwwFIMx1evMPiNx3JAkTcPkPH3tlG0mjpSSrx/rBBsON2m
ZOo2nQRwwSuBiVFew0y1J02aB/pHZhdaOmsgtbKKHx0CeQJvfOvUTcH27TrwtP7nwY1a1pHH
Myg1kGLvJ1UUY9lhPg3zolZJC8Ou7DKAFNvnI93TOfj3goswrDP38HULi0PT0gT2TGCIjSAa
lNY/HePQ18FTitz4dHsBa6gMP9p/0Yb8q1US4RpZB+SCf77jsoTjOHFnRHIpQFPKs/qkETEf
9EvQD52hunAANVys/f25wdQ01pCB9oWdKet0mT1r1VeWWbGZLcu4LW7bcH9i8kmYtwCrL6n+
Tj2uL6Eiw/wAj3Lfk9+K29koo9pD/1ukDIDCYpMgdKGz3HUrzNIGozddAl6gSzhj/xlXlDAS
TKRu3gu9vD43LaYGvo6jlw1y9rbmRNgrm1FPJdazOz9Zv0aF6aFwOu0ew0zmQAS/BAKAoS2H
6zy4N4lmGOYij1QhhN/I9THaslD3IAFkYFKewMaTZFIfR92RxlEkptEB42Y00GmVkU81zd3V
AGv1xL/HqvBW4xCrZzhmewi1Ka4xE3iBcqJQg2ZLdn6Gsa4+IUVxjaCZBCP1E9KThduISIQn
XZzippv75WM2zL0+ZryXFHfJA8OIblgm9NfYML4kkFS6zM6J2vvgJs2GAdAdH941uq1MEA2Q
AAz0nxcqHTsyUMScjlzZYQ2WKbnkmd49x839GLFoIDLpPVKyYcMVooRCxQuDRzjQxby7VFRq
pM9d+qnHVjtzCiLlyiEIupErj9hbg4rX2isW6Cfir823yPwFp1fh3CIJEbFYMrjUTo/dhA4u
+dttlNHRNmDVVe+/LjKABYnexoFDotUkEiX9y1qJGhLultmok/kpvdRuUmFrgh04PLa0mq7s
yqgnMYiVenEunxr8O6bQBZwQnY54nFQrP2OGDHiW8faWaBbXEc7366nDPBQdyi5+nAWywEsm
uJGvFWReCRBdQ9bM+/kSlatLtjIS3gjxbF7UddXjZY8dn5DljZ/jIcwxP7uwtbz7pju3Pg6x
9DEUy3Lq1T0ckrTSprSYJ6Z1/NPSM2rV1c17cjCF21UcfUagPJ0RWSDVWa807v15o9OkeJCE
wSRaYkjFMTaI3pAbUL41JWQLCUKezCjdPVvNZz2/SNqd2jivGEVrB83TSiCX3jkfko/Oe0zC
M/mBSDSjfIZzFePqTKZiMbZDpYPwYIZqmz5lqi5fqxp4UxDUgXqJBWI0puc8+kOVrUreiTGm
whv/TqaGLF5SvLe2CyQOk4gIkNlRs4PZEyhoO8erikMk4SfCWCtTlXenuiNV6yfJBk90BCi3
1mVufpVFRvGk6zyGEdS4ooKu1FfOcbcJoVWTuG60/OiQCnhTFTpNBStr0s0FBKYPDorMBbie
wKLcKbroTKkUmavX9e0RbJ8Nw/J3SfoTp3m0zWXslCa7asxP1AuLz6LDKRFM1GNseo/kZ6ZE
YGk/wiTu+A+bFI4h38w3T6u4ENIp6tDXN8cJE57T/1xPjpYxvsQY1Pcy7x1NHSUmZT1Pnaz6
coDqiMqvYLlGyI6BvBALau9FteL44EATcmzT6K0sFPt2Ev94Tn+koSGcNBgL8pho+/S+x2kh
mZISgb1ex4royjXlRjJi7u9i3h5jnJzf4igKET+IyVU8ZsKbtGXr/uO6+8/hbSjLg7v8WMoU
XebIo11CyPy+ZJz3I9cwgosqjlVZXjpurXWOeKQfvbfrFjzb8ax2IU8KBjeQ/LykHu/qwrKS
D/rJP79oN/rf3VFwOBNmTtQ1kj39Yhsd6hty5QEFMoA/piblrFzZK7+/sRh1iMokT3liamIq
/UN+7y95DggAJLMZZkzlNn/KHPzIh4qdWQBQNqxqCtM29OMuvQdIM8coLdSKP838xYMCYgGs
8ULv19wGJz+tNwV05VyZ139d9BxHybb2tAs00/1z3lCLVvYenn3NaHMY9jhocPsjkcfDsJou
q3ARWKGcWuIOeDAzK9ju36vmP6/wBPGNJKRflA/BAPe+hD1zBicSlC3tZbJnOGRfeCme6bCL
CGi7OSluknyWpbvoSTFU0M3r3ckWQYoCY7J/GcvzDH+H9qIGIw+LPL3J/F+FJPIpw6LHTcB3
90SvcL3ri5MbyV1Pu6iSxVo4j6666zcpIfGoJcTum8kVHbvo+fnUU/4HqHHlKK3R1dcLUsuU
KyLIo++L/EnFjAWCq92pVEjxFANMX/tfJnRpL/prIvjvfWHCvfFcNPXKvERz4JK0cvguCV4j
Ld0fuNjO+OAI09axeWni0HrUKWXBJKWxwdSfsBjBtFBSwmq67OoLI5PsHqOWRCIm+3zVyWbw
Qhw4vdkPG4Gw7+wHT9X1in0IwXheQ+gUr1QRhoyV4DOm9+PQFqAFQjOcx7zrvJ2g6i6e0p+v
wm199lAmV3Udv1w6TAwpm4eX2DYGKoN4TfPODGmVGNF8N6bkSYC3D/77ey5N4BtQxmdbPR65
9uCGsRiVbaT+S3uawAfGNdydasGXLqBI4r7s2VGa5HHZBbkHIGG5HUQ5/ilx8OkCgAs65qfd
ghFjjrMxkDwpPRLGmROyLL1aD94dQ+Z0Yvixc5VETZnbXwqXDkJfGCviLcJnUBZ1XLsPgm2f
tnVb6UG+U1Z3D1MgKvyXKCC39AW0QefkMTMyGaPpDM0H7m1i+aXBQXE1i+CCruAwqjEQW/Z6
KW7+HSqiC1QCbmTTS525sr4MPgMiWwqDQuxIH9X1edhy6kT5IfiKv/K3vZvGmgSQyi/E3N2I
TFSoBaZZqrBF/B4K/bxtM9BhP8LpaStNdLLIb4YKMCjOQcGXvVWjW8KqqYulwgGmHRqg1Olk
6nu9ic0mlxE5Gq8NTsfWjecp5rezr2H2aQ+JhrfujU0IPggxZziZywvBV35rvkjSGgtXHxMA
UVNZZaqw+Pk2r0I4S6Mh63IOWXF84UremJfwSUqcTZIseMuZfhuQMqMFnJlFLfziHQKmxM8S
p7u1DwTFu5ymN+hmrFjpsf4Jk6PEotSmLqLNTLd1MQGTHRoQsxDAvi4IQfiXFndV7Yw1nq/Z
nTzjvdZMbkY2vVB0UyzArEnxT6wFOD375kHH8Gzv63g+QhFXx3dKK7zbgkVNLWFYD22sYpY/
c+INl4+lOpqINdn4l6oma7mefjA1gF2lIa1/x5JS+iyXzERvpEILOLCQ31hK9pBTLbuBx8ZO
J/rPWiMzTXHn37QcWxZtWQG/wmRd14y8QOhRUPFKG2HkEAjx2qjs0GP/X/anO/j6JntXvmIJ
RJ1dOlyoUHb6tEdIyKhwJCA8fbhIb0jt04B48bF+H+iLwKPuqh4yoVs9Jhabu1IVnmEszNyq
AVZU0747wx4G6/679fpzCNxmi3WjxO1D7OErnvFaIvqO+LIyY694iy4NwFYx/6baw7zdXeiY
kWIQjuPfj6GcmHrk8mnt9in855jhAqG2pFPKHM4JZuUrikT5N+kn05pE/tCcmL7QwF5JvKPK
MWD+WZ/2siuRmnbvHWaGgi5YEtAzyr715+AvGXfja+aDh+LptQfmaqMEtEYqo7st5oVfqhfz
4LbywcH8KmoqXG0ODCHmnjKFsS2Q050ae8CFwKaWsNGckk9JRkxZvgI2XVGB+2ZrAY5LI8YU
0T4ym3B91kuMCvFoPGNmRrXqvePMyzDUsmDu/Bq9hQT9sn1UpXbrOq33B5EfZQH9Xf5yVvUy
MO2rDxRKKgzrpkz9O/MxJCySLeK8X4kcEqpU5FDDtTMh1Rcr9pzm49OskajkCtO8eb/nCYsu
DO0h5cPgpXMBab/1izO+bylTVa1JC//kuCz/nbhlHmj3K+18Z7iJYPU/u1ZGBFzKKuWqfoHP
s6fTwfJXNyGNxHiVwok0udtUDgulxPhn/cJQACUAq1OgVwGInmMC75SDtERt13jb3ln1Skvo
zVgBGSiqhOwbyxfNfztb1aDbOe3JeMB5EoJ8h1OAmVimoTTjIwha+pxKz8AkUCdJEBprmTiE
NuGlDGuKuPyNff+1EBN4Ek9E9gwfZo7+r0Y+r6xR/G0n4JLfPiWr0kDCA98/NR5Cb3Ipw1Ba
E4DK6qoqTZA8el0GDYInzQcReYJPqeiriG/6AAyjodbZenCr2A672VsTrL/bK135uj8noj9V
iAoSBc8dmJJ6s2dlRKnvznuvGcxwLQZTr+CTmhJ2OdpAflImRgMTFbEBoITDCCJ0S150gMvi
Hp4G5rxP6SKHkpNAxD0DBYFs4vyJgX4QQt8cyeng3QVynu013zKXHtxyJB4sNqQvJG0dm9N+
bAaMBudJwmGw8pUIhuYWP09i5X49Ox5+Hn0iG7GVpHqhQ5tAzVOZkMwDpjJzrvulKjKNuytK
DQQv+OiplyLO8xg0oMUxoAUCFfiF1KR+l3EmvLc0qFbOjf7XKi/Yu8NIBUdkmWx36G/Ab/iq
tz2eh7aKgqWqqkwSVOeuJrRelabyq/HVpvnyddL/rPARS1f48Febm/1bekRgYhOGTD+Bol0X
X5zWVwE7IrRQ3k0LS+I4L+KGyi3e+h15e6cNSireFEUue0VbOiXg3MxEwHX59yYS95Nzbm6M
+dqQFJsk7tPNK+3Ig9wOlHPm+//2FEkTBrXnUCqTx4ink//XUF25XAIx9VHdr/nKLO7et6tQ
Ckd4b7QgW6rooQirGpy9zMh+XEJGfEkL3CuynNPJ25MvjVNuR5H21ob5m3GhA0SZylDi3JnV
tjR9wfSKN+rYxtTQPrTaN2qcLYLqW+hVMbtFbTjDCSXiYYngrhBi1+wk8j0IanEZ8NGMzXVp
OTzFRlpl25McY+qci0kJn6Jp2UpcZC+v4FqGE7Ph4uwYAlpYu1wYrYjjDP/ts2xcxnZODP5V
dTuOkPENmGj4ci45H+eKs/1cQpLSipvjFqaMnlbEvbC8ZRmbh5cUVxfsfLCBPnseFjLP3dWn
Hv+5ZAVtN2hNTaacjckxbFNblqbtL39U7q0nl9sl/IhW+iJbzWRwLCm8LxRLpC8AGL7ChogW
WCuop7pSOq3QykAX6B7QZRt+64izrUxapQui/WJ3WNLSyBTmDy+MDuxPKdVMQ5pKhZrhS8b7
MM5lBRqHlvR5oRHO+rGRlCMD/cHxnRfKMRWTlgKozTD2CgylakrjATn2FeBNjVWQGoxixB6s
6+7FExFfqSt6hzJl9THhxTiD1pA9ut3V6HrmhOCcighXCzaLwfRdJCOmmFjY9kEeBcXF1fYH
Eqp5r44rPgPvZXRyo5XRbIwUxbUwHwybOP4TFa7LMY2OuAl7stbSUdfOnEKRds0hPisaJzqO
hVxpbZUNhFU0MVy0jICUzIF/RJ/mHer/4bjTWpTBQiwtoDf3HNpUTsY1NjRyZmrCqkFcjZEE
t9lkZulx19nRWrUb0mE3ucZh827jHVrAAFEKaclmkQoK4kY3UF4GRlDOliazOZYeIQO8rol8
K+GjdIg4TQ+JJxI8QmshNt1L1P1LJhH/glufnWFckcoAWb39NWEuS6I3uQxr3ZbELegrnk3m
x46NJ6HAG5WedUNwwePIdVf5Wkoc52s1pfXgnP+yZ0MEB7c4/1AkMnm7NNSC835i4KxjMGr8
8OO/ZiUr2CccFw2hYB2Tn99Rgfch2VlKnXLZ/fWDqA8GsaYZbu2BB4EWFsYVZKTQASeaykEe
bb+RIp4rwnHku97gO4jaHuF6vRVvnWr6z0/L8WsgrPd557z5S+xi0/ShjBPPX7JiIopG2r04
ZEHzpvijeVS/JSDgup9tVnoBg34N0wPYDqLLCfhrcsvVPXUZEM/lVbSI8FCGc8BR6ly4RuNu
NQzgmHN6yXBEzKt1bYmpgHV/RJIlP11/yQRsATcJU7Gkaj3LUmSrY7opBwI5I1apTXllZNrY
GV3Xx52vEnU2MMNFX3waXkEVZX40xRuLYKtdUz6PWN0AO8RPWOb/UsnIU54GcSkSfP1iMCn/
C+Nz+AIdDr4ZnlfnpxWGccmzmnv2ppvts1Vruuv5UNSUco1Nh7nAQ+qGfXUFQ3ubbTVuQMqo
zmOTiILjCIguUXThf+HxYMEIl4Ls6k6jaU245LD9WES0WjdP6mCH6tOOfUKdnNy9cz+YzFVV
sOnz+SBlPbVmxD8ZiO73V5Bg30cUN9cl4bsebpkHodItVu5uPemZMN/JAUQcC+tn6fx/DNie
Dlu3ccZazC0T5mYHHyJWmVrzWVDmoPB158x5UmFEDCEeCiHKhBA5iVUuRJlsJMM5w+tVy/4/
vwMocjSa+NiCbxgBrBZwVixV6TNoD4fSwYi0tZUm1Tj2c15n+4ZdiXdXnzzuSAFuJzBYd1+f
V2DpqOxLXNHWnae83YQ3CULHdJOrib6KgCh3aWgjCSheiZKM3QkaYW0WSIbjhQv3hRN944Eb
GS5QLyIQ6ygTcUyCntJHwzKBltGQliNPpLQbl8AHTdh3hmZVfotICYXOZGLku4nOZLiKM7nx
JOkn5Mpn8tieQvia9AhXXtY0o3kHf95rA/rm7KuelelSN1MvBEcKx2DXnUqsEorjHmzTjApC
D/Gx2RFOsq4lPyjEu8OnWRUN3Qghnnq0YmjV5PaLewG88J3lEK99eOqCzwSnH3y3kb+b8o4J
KkAqiNFMsonx1bHq/cxqiWnqXkErzQSZRUbdVl2f5PKnphDfpHlwiZ2ynJml3qwzvfpEpFJo
IZBzXMw10ABQodX6nQ1yHsqEg4aRR2/zBKTlmNkHt6PqhSMPKg31GP/Dj6sRHQ9jHShS6736
wQZu767gl0terl5vRod+Fqp0+/S3hGlYuJy4ChVnu84EbwvvH8budgHagMrc7UI16eTnA9kL
qAh8+FtOYDdgatzIjA679nvLu6UcGzskf9CQr5GBsy9WfsLmKrj564PdMxEcKw2bgfhBymTd
ARhdopbVDC8QOENehl1unH5LBhYilCjwCCViaZXErpesLL0iFwwAwo0wwMBetMqtpNLkp6Xe
h828//nvA+GKITGhlNXGWN51QWg73X4Y3FlHLEjhSI10LRi/+7JJ23Z2vV9xACe+aiPYzTYk
ugp/cCBtWqlJ8pI8LKHZ3D/hm/e1/CGS2nABNMG7oZsM1N8R/6odfe+tmR2ESKbyjwTTrcbO
k1t0AWrOiL2vWPpDzpazDC/t9KnuYCVguH/iHIaxaksrGd1m/kPsZFhWztuUGGFt/RzGiWag
gUPTEzJ80hY2XeuljeBw7F+QqP2znzkCELSXuEw9MBfR4V2+mzo4OgF1ziHKt4tWyYLI3g7q
K4RpXtb8bDYNRlLrlzsqReRsxQi+7E4XEqIbKecS/GqCsrHbhaYed3qtSVxu5il+vS3BS7/t
rEOueckr9D1Tic5SbQ2AcKXYIJYylFoEmj4EaiIAEp+k4ewY5275KatJfwvoiBoC40tzYmJ/
Y2YF8ynHmGgdmIyU534Mu2sy98j8+qadFWwbMifAHSjOoPZ9aZxLiDaLu9I8bj9Nic6qkTVV
YXDJVPC8UojAVjwjJ5qugb3cqzMhsy5c/IMRjdnjYd3tT9wQvL0EOUk0MTaJiFJJrtK3kcZp
s1nARRMhcB0g4lVpiVfXUD4cNuq/Ea/5GVc8CfWrjlrpMf0LJKPMUq7rJF84R9xbsN+1A0w6
Jpa0kxBVBk0I9hSHqyHEoPwFIFd6mQoqdMb3qCYH/WcU88ujkUPi9tq2TIUbNLQbBdyJ3tFv
f9or/C6mAeR7by57p5hrB5BLIsnqYMfnHeEEPgqAJ4vZbS9LXWj3CQAcE4y8zjxGNSExDBIK
YLuWVgQn6HkW4GgSHqWqsFBW/y0eMIhyF10fN6CTyfoFGDg3JVfSXHHdPBsZSXAqA/yQVULx
vxKBDAgSagpVzxJXnx4/3WG8eLoTZITVhZI3KCrMAvniK88+pJBRwhRZ/B/LMqsc4PEIW1ss
PozVVGYO2zEItxC7mXf9Wq8MI8cEBoNwhBr7utzKr8QOb5itJlLozHTDBibXvRD8L9fxNdaQ
H8lTcCyaAegLcsBzxm9yk0gbCw7kSEGxLyyhzDwBncPfKAkiED/kB0yHIPcYP+KUNEhTuU2r
5UTywVH8LTqReFH3W/wJ/9igMHp7uYaM9lPnM0w9L1zVCu5xPFvudnG/VgKIMRA+HnZpzDPH
tTR2/Hr/KFcACe1vZ6sRV4FrrN/8DBr0Je/3KukRhaqdStbiP0R1N6xrg94e2qzRZLWIaz7P
WCxfBzi3evtj99wEMh5KT0C1nqrzDr5g/aZ16QGvH18mbzXNbwV4BHgEYRT2nrBIs8hGklDy
xdqFwJkp+zO21sRumsqs7noGDpsWFU9XYZ9OOcKwlyr33JX36RQ4TkQkXc/IvvhAzuAL8J8+
qNV19yLSTw0aDPOuKqB8yXo0Qqv6bU/29I7hn1FOFD8PuL7w0esbH2qEc3x+eJpsq6tc6bKS
O5YwSlVeSRJLK/JO8EfVhu/EaLPxH+wEpo5/PKE65fhG3daIUyYT8GmbFSNj2GCr8qGf8gxj
PP9Pd3ujkUr166n1wxafqSLKBqV7mQfL5aGIDc6ICztr2K0BClA6i6yRF8L45FSA1b+rcyEq
HnIDTfWFlaaoop/4JxNXrSupuHv0f6Wy9gTVYo3TcED2dnKb50UD6omrQiVhd4TwKgjmgqTl
r8rme65OkIaR9ZtE4xlitx10TS8jjY6Shx8DsKTbK6faHeWxoyO5DuatPQms6IjjvUpNcDxq
X+ddbbS7shUYavhbLoWCcv3BR8JN+Q5OVvm6rFUoUGjCg8cxGTNxgu43kG1nZ+JcqwTuPqJ7
nu2YvIOgZ9gCOlSl2HgzBjwkL7dfZL5omt1qRkP36X9hMpJTQZMkibtK3x1Oh7Iu4wxpcAOO
fRGZ2NF8x+VZgJk+ARhBTqVyZKeeWAanQHMp3QAfBQZtNyAchTfTZ/WiyHc6e2/PwJIaYuOF
XGJR5lkEZtyObv7DwdfbayqgkDgLeQ8+wWHoZ5QrqT2AUugECLcpvHg8rIy3H5UlSjmeoo48
LDxkmD9CWVxfShiAVj4jLiJOAI0rcqAlvIPRD9rpILDw8U6qBURkYyEuDz1bgP/i2rKjwJ4R
7iLhGe8sTvF2zZsiTbvJaYLi/XFGhufHnM4nOOeHZ+dRlENzfEMzVi8wi7wOL6ZOx94COZxv
6F99UqGJjo3dXlovDNnhKy1zKsKz7/473tlI1GayjKAJtQCxzt9YeH317nJ4ojYYyDToV87h
t4xUCC4sPbj31MhOehMp6Jo40P3ye7XRLqjkSESvlik07YZ6emfoXkdlftUeFyHRpCv1Z37C
o7nIZTp8h4G0V0ttcyOt3DOpsNKza1bdk/ouz74Yj76JljRNDT/iHBmetbkjqxP9GkQNktOL
KCtzYTDglcFEZ3N2nwW73vgXTHGEFCkzb3qysMyThUZhO/6FWhqEzTXuUoCdWolj+z2UZki4
oT8r3mfKGbulrapMNbH5e+VhX0Mcj5Sd2AfRGyBmFNj9+Aw3ZqjZmE4/VR5FPGrIw4bQqMJo
Ngcjt6l392FMJuNfhGyUrLugVjUdz1MhWAshjhEqJFMxcej1ottw1829CP1XwucE1YC/dzVs
vJuEX+nAV6uWhhrsB4eUG2SHaKliMqJJXdRhDVUFrpKO2oZ69paZng43mOujsyBFxt1K6uZf
kSunze8t25jL78Akpwqn5++KQr1RIIgw6n5bQuyLubOZE/xOQTcVk8gRvoJTpIBNp/X9hxU/
eaWnyQcLwZ1qQm5XEn1d4WUYAEDOy3uTfZjo+lfxQr7Fn/VYyKRHK1VxkptCJW6rhsxNf3pa
ve9kbG0ZLE3RYqL/DPC1oltiHUbHMEeruPIptnD+EFGiV1RGjLLcQIvIacalGkwB7DWpMHDU
/zDeysWDqId39M4C1ZXRy7mwfucnjQCXGWr9R/r5DT59Y2zQ7RZUgmWcIWM7hXi6Wl3Xv8nf
rP/rTISuFTq1oIKb23SUEAvm2cr+Rcvl5iO3ZDvimCUndgpp13h4Hm4huU/+ifCBl/vb6Q6S
jM5/reT4YanBDM6RV8+0obkrGAsNHgVZGpmc+nTnuJp8+cePCZB8ewS6n0ZtODm/6+G9eLfU
hJ87CArjjW76UOTH0v4clmrbVmTZm0WJFUntcCE5h7Zb+DCMsvrjTMmgW9CvTxMwuGHq2EM0
unDY4vGl112au3EMQz8X1BktWvHq1u/77wgInE17drkSb8No1oaztnw2FgFxVuue3ojpm/lY
2vM4wuuiBG2TCKmI+WJdzxiw3xZxZDyLOHiwrcU6Qbm/s56ci5jyvNKzj2DTG38AsfKupoUf
fr7N8VswBnYLXK2LA006mbtMxgtPGaRZbjdxus7jJwUcwp92nFqXeGnd1KPfEW3g0Vj2/FiF
6oKfM98pRsx6PNmq9n/qBhV6ZLrekdSWPruW5UUsn1AUNnNeI8redZLzziOEe4U8yEmz6QrD
uvBqlLdmCTVKfwFj/7jlom2fhENRpO/3EfiwJAbC4W6zUEjHnUm8CM4Ce27bUVQm5TJlRFXj
vikSRYQdpzOeh87eTbtnKWMYtDRrAzSESnFkT5xP3Y1ziGIZ4Yfm6QrfUFNJrwgzO9AR+1rj
hs3imqmzicCWqHHEW3gJlW11e2j6u65I+UEwzqQ+ckcNBpXbwuLZ5nRXXAz0YRKZYw0QBvXr
QlLWE1yJU/JiXMB9UXjcHfYkt8fX/GQO2bfQ8qPuiRwBhWK00AYDLjfdj+tKP8zFEYfkEqE2
+2+5Bv53eDU15exm7vZYudLo4iY3Bc/iLN5ZmNofBO+ganQnukOfHru2g8zYeBYxU+px8jZE
rIZbPwpf5Ny18qyup4P6RzBxtomExM7mPeihcyjZqh93V18zbPgJIueJKBrkzKPRnUba+jBl
ltC3gzeIdZ404O7f9CMgrBPbsTcQh/AkCyoayygfNpRJaLB+FGAbskFh8eMMTaq6yQwQ+PgQ
4U7HPcq17chCAdYNF5BhP6RXiuMxr8LAX5tG4lVZKBq+pu+1+CDJM3F6ecJ+wPR4fy7vD8uU
0t8hZvR0Ao8usk2ofiKlQXMqfoDq3rFBzMxAQQJPfAzFElBl+pEf6+Yzp6M35IBDAKs1Oml5
5trR8QkMZ+oy0qVTVM8ELfOAfWv55RwSfyPs/ecTyHLwipq9osLfZLcLBNAYvcSVzV6FRqsZ
pxjxEYCfO+7NMq/B6FJa5NNVaq/m9+6ijZWkYt0MW4pp6BR20mE15ENQmOsubQtFNFI8aXeH
wTIBuVB1DKQQB+9P/KFSACzuJ5slkpYBMyv7/+IN1DPI6U1BeJOHluWx07iEq/lwoh6Tcufc
pUjd17e6J3OxainkLAqoHqJehgq5H24hkRwWAC1xIkZDAlMn7dcVBfy77hGLGHdOIvcn2U1S
ozOvj29lsgG2Hr1P11eV5kaxU45WQz6sfrFpXuB10XeYnwKLp6fcGEXJjQwbb+E2mGV1IbHs
qCGlM7BlqeefkO5uifd3UCawl8rS6Y4PcjsNaMZABNq/kgXzH0HsqSfsFKYs0s4mBef+MQ/o
7DvRw8LWG1TS+rFY7MM6nT9F65/OHnrgHX5GL9i05KcOmu3hZYRk6O0itK3TnPG1YrgfxP9F
HhPx/HpWlzyzxKrwVT4DWRkC6hzC2VAsYJlVPbSElYlVNuwrGWxmXyMDCAD0kIIiv0skcikx
9ylMUs1XxHS6PLxg/bhBvCVgyVdiR3WXAHbWRBxqxP2A+D7cLmOemseP6Z7VyQnb8vEJZvLS
Jlod5bQhz8Mx2m34uM5JQzu6fE0NI305SWCaKRgrh1aQcuT1JVvrrNR0I0u2qugktabDMpJe
sT2lVbYYx5C8uQIr8B/JoAdlYHKi6VZKwJyDQU1D1GdkLX7EVwJbJhrySBJR+6S/iCeWJQmv
aFXMX/Cl5ZbgEe23t1hXIInBAAMHQ0CWv6v0jyvj/XShrdltTxY2NNGTHCiPu5Jfyb+UVdYA
qg6LKCVt199fFg5meplBjTx6unRYbvq8D6KXJGkeWRdKF4TbjhQVlhK9G8jeP/8LFCrUR2zg
cJbyGRxSvUQ8TsPieYqZSpMJ5AmHCItqFWifSWZ5g8X3OYDge13U/5pIxejw/zvQ8400ESqL
Yj1i7M7DiyRFQgPg/qN3kihSfciA35yZu3lx4C/74T3gzuNYS3V+deBtelxLIRM2SlDyl3aa
rpIcUmvZY3HAlkiDPcetCO9mSNsEHtemiAxlQTl0zQ/RuTyQycRREhln1E13MvKRs6Dsn4jN
0PCihJet4pF5Re662/pfl5dZ2FXaNhb+Ybct9RE7eA+3yplSnwdwu4w9t9K9H6arB6WJO2zp
yOT3gxQNC5svGL29FD3MkX+48t+BZd2FWf0LyfncREec3QO0ygm0jk6mKiHtuMgezmIu8VDC
bFIhfhrKklLg3PqnDFyWid4vTp++xlJzq1C/1pyivlvqhVuG+Q92Q8jlUZVp6ZzH31PuTuqW
zbmO6i5YT36ht0MOHDwF12O/8be3uANoiV2KjczO+Ob1osGLMMs4B8Lw/ijKx15c4HzK9H48
83vEtVlZpJg7FVqTo5+EkuC73PHXFfgERueisu6F/HI3ecb575oBYbkHGqNUMC5VJrhgM8Sq
cV3dSN5+Co6/Y3ctsuyxp8RLI1Q5sceeSGx/czvMv296wF7jTtWsUAa9Nvu5b8lrFyFkB3hY
BOkQrvMFLRhuuFD0IgTtRQicHaa6GhK9A0QxeoTdLEPxb8nuXu4F50TJyhnz1AHxc7Kp228U
Wg0aKC10yRM7OQiXu2wayAbAuB7W8FaHixBwzda1WyPQCBXHabmpOyhZVY3ct6dFJZcGXTFR
klew3ZybXfiaHaoiTLAt44yjl8w96OCngag9lzbBmhLo55YHis2XZx38ZZ3wLhjjJO5bMlY7
vLDTlH3jBODkcSOYprXQjNsMbhOJeag7YIzOFiTBpPC7nExC6jKSdZQj2DiTUq2BqwfPt7Pr
vL8MKl3WNms6aF5QYfTDzNJUngVgz+j7UIMx6/LwGcln/RfWcKv8htHEww1gQF8uTYfWFX9X
kUIleF3WoqsLdDqY/IH5WNPneKojF6dprERuoDNo327WVfDhFxIeqGkgnmSmh3F+PTiSzufR
wCbyKkKbXvRkY3FwD6/5iwCd86raJMeE2feolDtc+MmCX92Qb0t8/twYAL6xRud4fRJBE/qk
IJJhx1Tlxm4Twaum7l4lgfy8ejIwfSpgUTwOVAceuhFTBScpWAJJMGSFgDgY5VV2VC/XVhIo
lMp38WNeTmtockW07zBaIZJ67Dp1bfYWGxblgGmK9+Yfty+VeiALU+p3uSwgqHBgb34b6LX3
5ZwYEMue4s6XmGuOH01xmaMVdCHvST57NdBqy86So71Wz23Aqapl0A5RjhfUDVA6jpoQGLPk
rHu+YpgksjlfUuTT+r6GUE22Pv1o03LlVS7xw2sEO7nIIvWBP84QbvBA3idplghbeg7/5hRq
iNF77H4SaT4OPSaRPnw3p2Urcyo2Ts3gjABl8VM7ca9wcNxij7Ae60up0RfPhllHPXUrSBb5
qIXoFx9bB/ivO6em5YbYoHFE7eqdgEYjMmq3uHjdbGr0OspT8ST+uAkMxb2TnOd0rsKNxC4n
TkpmFZ+5jEyH60jzEx7guYCqur41wAVNOqiRI7qRQ5vp3JpaWr6gEJeRwmN1HuotdjTUbs3G
ztVQrnj5gcbWnH6wz2g5/4WtyZ08pMQcd8Ia3rBIakA7TvkMzApJGEz1z13xRW3Fwkqn2V/q
K4s72J7w6tHKZvivOBXHqhpKLeLPCuEPbDD9eVDK7Wmz9//XEzAFRkpXjJAK3PlVIDJdb5QT
QAk6s2mv7X+NXGmUscOEz7Cu3BH9knKqPIfiunObBabK9am3sj84HTAv5Q9xwzSNWuCtOWh4
JDaX3UpZO1ow1/4MyrhpUMLMKZiku2nCWce01/akbxuLpe7RJ7ismULicxosWJv04ww1IIxD
MILLOgksqv7hRIufSxNtbL2tqI3vrLDPPSouUWO2LX0djliVwE5F/UJ0QgyDnLNbcGz9yJ1z
mjpa5yi610N/YlO4R4WWlRgCpgx42kJVxEnvjUcBC3oh0p4Q5Kss0XezJvG3QPVMD4blXmKx
8fMM5KAC3q0CwW2+gfj0/z22MNgjVn6W3/GgdDpFitjMZ9iRXZNA3Eudge9f9bWOIyE3sHPu
mZTNQ4M2+iI7TXcNoDJuMCJtRTeYpSwo4AOScAN8a+8GEvWt2LATkExaKGLT/aVpxB/GFVS9
gvVCCrd2zCZ/pXsmRpx6rPHoUkY3K36ebxX3YqPQ6DzDmydVuRMi+/7rbRqziKlqHKkQZYXc
7HEPWdcnESqB6KPyw3mEVMSXCfEPxvVMqZ3Vl8/cR+EJioh17P9F7H/lL7BXc+UBHNkyrBTC
/6FTipdVYaokWj5xiONMweae1vWddFCQC0B/I/iZrbwwtXzVIKJKxcHA5QwBySg8D+jAqQac
/Eo18javjbfNx0IQjQs6YF0bv0dVnyPw5NjUw9d80TO/gTHWZcE8OlyUTXRB4S3DVPX2N+Fv
sAgL3omaQvn97ZAR87HdL8Yk1tm78neJoB1PvaMlqNrmVVAH5wHXQ/3HOD79dZzgc5f+IV+w
y2pQqIpPenWJXtxZrJ9C0AIIqfNdIouXu6GDIgyPHPWXBVPloZyEQztrys1ChpHcb+O/fpFW
8Z0XlIaWqLbHnuYGXpAZFefFZ90w6DhdlNjaGZrLHvdqWTl7KVKjTpcOTlOCD7CqG/29fWQy
ZZI/rsR/2oWfIdGibKYBwCstwvFjXhFyc0RF1byezQVM69AavrSG++prkvGyPZMy9kPO0Wpy
1txinn/2h+3V2ml1Tft36i3dVSLDxH/oRIFqd90F/XYVNxxSZaAVtKBYYfZYwZ0l6Y7UFr/E
BNDsE11Xni5nR2HE7fcmFwuJFNL0S/kYxr9QfaJGHB0q3uEfyBGizUmxsczklm5JnjWCOeMI
5+hDviY7jV00JS8oIP5opVWEnzulPLiYhOf3k47A0iKW6je5r9W9WznSEFlN/LjloNhNNeCY
AmMQNfqpWPoXJ+UbqDSf+cHlenqwdgw4tcNmG6Txyr7jr13lHdHrY2Y2UwCSywkqPbOKbjL9
cL76XJVrLKIPdzSIYORCr27W/AwcfbK3hzIsNN4bfWEbcrkX3gUVl6Sve+cfoIwbOS2MBz7N
iDDRj2SlT+9QFjJMgnQpldHnkDy78COSFhTELskEbR40uQ8RffQsa8RrvcP5QmqCPKe9qbN1
cEaB4hETp6YV30nbT9ALhYW9Rg26j6hBep/tRqrfxqmbCjNWz1DSgzXjYWle5orfi9nFXylw
1fGFzAt8vcHeCHPfmb1Stwi/Ma9Bz4ryOvBIfs8N1GyKSspWKu8ay70GLvrhyl4XGIqRwbXt
VJvHnQ/rF0VUEBuDwEi7iC/bm8EuFmNSPJMAIlDc+lmsaxXjjfQr/5FG6ScuxfmxYnVHasj1
N2kiw4WY1YkB2HgOSk8nnaByfK7Xb3f7LyG+cqNQlrbcv9RTd7F+SO4fyK54Jh2sA0qOCya/
r2DfLchfCHnAP/r6R8SFBybVvyypsGR23yiCjegpbOtBpiP6YYFfQI6SiED55GPt5BBcwxFi
grIbpDixAeeq/QVya1iON/uHyCxDGjLEo0lvaXwP8zW+DcKpMlCvi4QcTZAAsw9x9XHgqjso
zdMV/fiBH8H9rcnnnwyOZ2dbeM8R82/WdaXelPGUY0ODd6xOrBebXs0HglxTsznflNyDZOvg
wZdI4sRbnDh+MJBmYtnpYYwj3BRVn/GD/4bcnnT2OWSU9Ekzq/0+ImZmdftblqwuMIuinHnJ
qxGavXlmW4ksJ4Qot/57VCWLAlqmqkE4ebJFzhR3TeBjAA67FuSSsOd3mywplrzYijuOfby7
yiP1YR4bZi2Okiu7gaD1pl0kZ2RvjZAyfR2c5QnOPqEZsYYxxuUwb8yjqxu4XDXi7YvKakQR
xYjJuYgFdVcRnVVzUhlGheKEKDBnFSTf5Nzt2rg8zSamSSqVOtKFsXCFIMAFOuwrXN+Lr/Y7
EEii4DQ84lcQ1ZET5YrlNdV/qCvydQ3ay60/2ft5SvUzTxumdYMTNGa26ETowwW4ZJcrEHRY
qfLfh/nL39TKW7wQV3gD9avuyymBQfDOZdurbwoR+yhXgfyKa+64rB91K/DjdCw1My0HwBpU
ayz2k7SDXzhjvqKEpHTbr7PnpkpJMaZ08DknKe+Yfk/E8qoPAU1bdSDrV9k5hTa0tFwqOwO1
W9cTPd7RHBj8CRd+4mYshhbD4JDkZeYNNzS4LXonjuxLghdgEjAJ/ZRn9HMdy5GmBnAKYWJA
k2LdBWhixeH0JOp4vVX7b5V8ZDAOsLm0Y385xsDZHTl2MPeAQz6NUd988FQ5yPbDMWcyApNP
XbVgOaMHEEdvhSvLlPT219oqEua/+qxzYbS5fhgg3LwIfXGQHq2oV70GcSqmBRovCzZzskyW
dnjfT2yPRauhYPBxXuOwDSuuoRTv/aMYSPpGAoALRaxZ3kdhBM/uecj62hOt4Z+cyzNAiOQ9
YlKDIx3oHaJz6TqZmnsth8eHiIyME37YeK3bY/hJO1KnFs/xUNd4lxpJnfBkr12BpwqpKUIk
NamyvJOaTsj1KDw4dd4TS45r2Y6luLOLG1yYbslpzK/XtuELXWVv99Px23vBfnaf93P2YmxU
cxej/J/YK6GbEDYXARUxiRnqBV59J+ttMEVSIoGwDQR+dVaK9j3Z5xVNaA6e6q6z/5KGU7Wi
5IDQQch5Y8mCqSMtRFjaALGiO7R1jwRiKJbLhUDGI7cCHNEUp/UeidY4pDCM5uuhM54o/4qC
LHoNmZ9sQ5nEacWQs2ry+gGgj0ARkzMaKGGKXJM/LjfyFpxz2Q961x8ER1iulKjeZGcZlOkd
DZDgpVxKiKYNLaQIiylrnZaSxUtTIESLOd2dFxeZI61lr+GTJKeP7nE8DbugAxjhpTE22HWo
X2Wj3Jd2HqkeIEeT3AVTounW0wnGWx/ziovw44DpsvfQBwpYeJ55oesD9EQPAfqJtoI0UjjI
rz5b0EvfDH0yTaYHJxfsuqNQLdQpClWc3N+cvMsnz7xHxSycrTRbmkoKZpsea+FuzSxgVIGF
M3LcfQa/DV5M4pM+FGtNqxCfmOEnoTZzjQYcuqomILwmyFFsZ/tEX5kOwkr+VmobPrTLQ/lo
Dd52H8jtaCiKEjH8N5++TC6A51tEpEXD09phO2h0SJdgz8zRozRPaJjn38D6hpIPeA7HTATw
5wV5zmWpxdGG/+SwIHPE3mH4AlANgH2EABNKUIKpfKwN+jzL9youERI/XNIC/oi8PjoxdFRo
H6ZdTbgnRu8Q/T7TY6Mm2WYYe722DUqRKf29NaoXN4wqmg2p96taZ5jT0DeRUVRRFase1iuN
6Ivwlb3cepX9NbEGrs1DqhaGKJnCXX6PMT8nUgXEb+yt4XaYVUrnXxUmujpDIAYR4617rFBc
8ul2YtremjlXUpQYL+Gjc6hWMPdRSALS5j7EAQ+HJncZWFxFI+WmuG4WN9FcTG4tyw0pGvSY
+40MFKww3pskcd7+zRFQyVEGiWV3MtxB4yKDJ9QdcaqNSxC7S8UZcpuJl1GQ0nWH12M5W1dj
Ed4NI6nEeYnl4aKEQamYXa4QqkuYQV4EK6GXji8eOAnqe/SKqJPr6NfcBWEh13ylKUQFRYjN
33MmgXY8kxs92YnnBB9dqWiT9NCX4KfRAHdcE4KOFE8iZHVUPf3fEYP6XPwBSOfHxJDuEWQ2
M45tmfLN1JX+beH54J1+K0L8WP9Fzqi1MQ0Hqfv0I8c49qYvMvR8vOnkL1sE6Es4nYQ/zYZT
PS1gy0nTvafb4xY7/tByYPjoZHzq9KPvRIyNm3CMWXRSZa2ztpR2Jkn4RPUwmHWUy+FoeeM4
PmkqC6fWP6rUDt+NCYpGVK4slbFwv6f1IrJno6k2fKU2doh2PyHfM87j+682jKUQ2JXHGH56
Syr5tniEmCg5Z9avByUc3Dj6TrKisMuoNOvUnq8kx2ZqqhUaG4RKOJznbdb0SHmFXtCa3OEP
dgwtLOH/Q0ejN+MJAhVNoCNAENp6rz0a39WqLpiiQCdUZpDexPZ6eWCcqTN9qCQA7ctKaHdP
ZmsjG8OsvcgI93aYa9avOGGc42lyO9+KDhTFVOUHlCvuCiduaOvEEiC4jyxNEUVdeCQJMuwU
GkzErMWTbzCp6/WUYRg8hlaOPLu3EMsgvcqbLUzlWqBP7hHgKe9j//EMT6g5GrPnI1QGM2HV
Nbqs2ZG/Ojye4buNvWtDcw7YNZuTu6AgluSQkzDsKidTvLLQTy+GgaKVcjD6SIFQsn569YIk
5Ughbzpb1A44mEAzNPWzQPNYqc2VaiTynij6/EV3PFjb5Jw1Ysx9J3f0T9XmmBo6ljDipoK/
/LkMTvj7lYsoZEE44d/MDGngZ9MNL3pfVboVG9yGIXIJqcVvLNnSJ7I4SzTKDifiqJzLtJ/i
+J5nJ22DrKFwaAB+LDIfF0N1KQju42XM+HWGLYVIIe2tDOQ/9FGliLkcl5GyzfyOSj/Y+vv3
Z6yesy8Mr439W2zGE/TeqJiEOiqT+tZlwkUIeLOrG/OwpPnzNSqJlhixLDSEeZgHzw1xLzRH
FJtXMyPGHMkMv87hnnGVb4VM3QpWIiTUcST90MOcIShcXOaJvq2oDGRXFoZrWCwocIahZWTF
h7GdyiMPGC3DwywoRxk0vAB8o8+clg7jt5jmcDsngCQbm+LQJdpxVi4CMlgS98U25jcTLIjb
udQEzKyRQ1twIfDrYZz3amlgMwqxfMse4JtDC1iBv7ieCJpdsl+t/GzHVOWYnmZI0vYLUyjS
CYhUiZA/RkbfO7DS5mBdEO4GXJRMRsLotO3e/UHAVPM9WBHeC9iOisZDv+jE/ahFmi4wIc5q
hPXnilBKcw33ozqf6G3fMy1xAOGV6VGTsXndzxe30Wb6yoykgyZNRcxKkYsv7nCRa2cxbDFn
fSAdS7QBibXuu5oRmajWd9ldl3fUMmI08OTPZNvuaT6PfOep1e9pAiDLcqf621BU690P5MTV
B/Sh2YjSpIiZb3vR4GvAcmFXwEMUs2iLcL2+gJGx7UjwQj/aDycMgDhK+aiQP9BX29oJMiCN
ca5q1/aZubkFPxtV2JzlkmSA2znshd2/aWkEVUNd2RC4cfXktP7l8dtPJYqL4Oug7nJ4mM8q
NWgDAKafaedQSei+Lxwh9AgpO8nobGgSklO4xTgq3nAampDZ/EX1PnhcguACjc64GQMy+nfl
dGKKOzjFVW0yrdTTS2VRR9fOjhAVoj4ePUJMvwCXH036gNNbcBh48Hy+a2CHYGN/HPW4z+si
dItddOBJ5pImAeV7SUChBdsILHW5D9qCeD4jbwdKaOzEiLEv+BgE6TkzRv4Yq/e/iwIyWjPq
nIuv7qQYwOf14tsinDJyGPDBidb6GoD+pmKxzXWY0+fYw4Gd08mi8rY38epCFL/65KT0Ytr0
H78U2Be4vBSRZenPafZL62F7eLHhEp4gxAdwyyIhoo8+nz43bb34/29AsKHfgf3EyGLcSthi
LYr1+bO6PLm6k367LNw7AJ7RngR86//JBp5eNk4VyMF3YIOgxBcsYAg8zScWD+rDMCF7g7Fx
CNSpMxNxR6ub28XGWwkp78LB/4nD8yGqN37sNVJigMQjQhWTjwsCr6BGlwR+NhaSvbu63ZLj
UG0pGBRGotaIDflNugNjRMIYpbZ/RmKM2EbwmakWfUGyWA0mMnBjssymsxpalG9UjUH8g4Tu
08pfNe58hinJJDsn+6BH9iMSypJbepPgmiJfx0iVnou39jFWCoSBTuATnUVQeujGGrQcaqML
rbBZ9QGQnGMtRJigm0x1F51y4VNc8M8vWdLIsLddvd6hoOFmMbOJdn8nBEJ9kbDvYBfF42eU
untGK0ZscaiqTJ+RiX8fF5mkWff/ZZ66e35DvIwp6glumoQnLx8GRSnjRzG45JhrDXJenwlc
vhZyzFmQtyW7R7StTHG2/3ZR8sYCCgPQlC93/3eNahykt5/PYmKjlvPwSfMRLS8nZqF9I0rd
2MpnbiBT1yXKPy6R3bzubceKHG8qXCjtuYFo8PSbTS7djaqWMFaQ34cqFvulepIzy3RMNtI8
QeafP+i7/DZWbDdI+3Et3uD4DNDejW6WEeix2EIj22MvXs5VXnOLNlkLWnXhHDmz1iQDY8dw
ll4bdP2dr6DFAW1kcn4tz4H8ffhySnKwy+PuOuf/W499jafYxcw+5xyx9/5vd3V2LwSUqpvq
Ryze+YPmeqHN2gP2cUWcSQ+eMjqBoKmVeSybSCIp2GMBn8vcqchLyxbzEsL6pxzGzXORj194
6gvP/5dZ15j0lAe7NcgEWWMP4we3yOI4fPMmNhggPqhNwUjvOUfM8PBTYTN8JKDSZ/RtGrZA
+xEczXVLV9bu+LGRWVky/pxDqwsJ1mOqnxAsA7duJ+n+qkobeNw9Hx51hdl/2Anutqls1l0n
0YVNpr8szS2CNqdY2FWUqqiZEvYzsW7F274c82QSUL1wp5n/lYYi/3zH175b7GWJdoTmjhpH
Ln1oovz8PKogTX7nBtvynDr764Oky0AUkDd7vsJFtWpgT7PrNLM94/K9YkwxoqvQQuquQV2t
lfluil54x4NpisW+xGVchY2q1RGBTUqpL3nqrFFCTxS+87M8konrpYvSjGJzmJ7ZARTrVX/O
ASntXH9tRCzk7yL2m3YY/57v2Tfq7gZ6z+9X1PhXDt5qCc0/ZuKj7/U4wQwwLBHd+G/xY15L
pEaziPXFBYgfUPgjvPIWaFB8SVKGeWN3jwZ1Q1yDVaS7m/Ai5noceNAVJkV0hzbmEG5gouDx
2F0/Z+RtFri4f6zScXCMOw2kF/wlMc153IjIN6X/kcwp7xohNZ1jcVKvauKSJWBhQ+hGbEOU
lTHK70YygJ9weIvPmUGnxKBv0Mc54ilSoDbNr72HFeIzGmWwX9rJq8CdWWVUBbbu8dQn7sj2
83PpyqkAY6009jkiog6864xovOPOaOPlDEsOogw+YX3Ndpo2FyOJJkmUYwMxiNoMKX6HfvVB
PUWBKWgqaKJduSZUTaCuhUZHgkIKfICGTg7r8QOzdBQD9f7kfmhFKmFkskcIS8C1XWA/hl2e
6jl4P9Z4BSwYG875KLavUkd4w00pv7ipmYRzydmkhx/WL60vPWLFzCmmjoBtGxctJ1Oed+rX
2Ylmg8kijEDRBTfx0hwWS7f/jGZtJhwp47Ub1c9c5tYfU0WPfcJKlP5oVYWHqd/ccZP6A65n
xGufzi0+ZTOhlFMsaBETyjrbTj8EAUuQzIjRWJaoqjcOEznnl26kv5eSiyKyiqt0OpMNgTRn
kb5hdbARurWizYm4gPTQP7BEffmB4UJl8amr8lmEWADajgebocHFT9GdAPLg29Yz1RgCQ9nf
3vJnPEcHNEke+jBiCAHOV0m6fMTW6fiuoRFSzj2qLTr1AgIeIbeegIiYWicvZz9049Gw2AHy
yz//DN5xddMhv1azVahNQ09LFp2VHqHFDQeLfmTX/wtlYbYuU5gVrUeDwKAC7uUYJq+Futj9
SQnd6ZkS59aL/R50ctCmXq+dG3uvvX5jcMMV4pK66Gji/52ZPB3PL0FZPGGLII06owl7lkZt
mbKAq4Ev2Ejv/q8T9lHRcoaRzWEOofKWeWxHyg8upM7izZXwBZoKnhXGe2dIaTEFRGhHYF4t
2i+2z0o08rQlKJyN+kxFiUFoQTrp05tQ86uYg2vYWGURhqM0V1Sj0fN4H1gz34EncJ2EOBZH
DW0CeYO+n1L3qlfQRRXaLrGy+UXmjsAnIEBPbxkX8rLaXBcBsBnFTp+nl08NzyOLgtbm+V8o
nbrIdAcyRwi5j+ODFKrq0jYfDRSssC7geYWt4wFC6eNuwmL3cUWN6a579bfSLik7ot2dJjuS
FYP/3Vm+Gw5JzLJ9vwWAvPXtWCIHhUKVmZyxL2E0YQ4ShPVqEH37yfpKH4r6rb3NwJDIzymq
oPE/SJAwTdfp0R0M2hLmWT/bcrI8kkymEtG8nU2LdGaZ0QBwLbVyuUQ+ca7laGgh4uvbDj8r
13nj5aV5mxdQdyApDcHFqMB+PeTifrZa3mTxkehHfNmsVw/HqUt3f20vVOBQjgMbcUEa5QaR
TZzb1ek6JeJXHYtdHqTKY9ITVyQ8fbeJP/znxhX9uyWQlknsvV4GaUis0yQHzsX1iiq3R/5X
fHdIT+w3Gmsac+INlV9CBvehuNwTjogQ2EGzz2w4g7si9rGBMkALPhFSUymWkZZVGpI1Pnbp
0Lce60dHebOjaVCFGMG7arOD5Rioa+siDqYOWyTlxwzzt67fQ9pV2RCv8a9cX1X9avPEOuv3
Bzkaw7xnUOcDA4lSK3OhbqkxyLmNZVSWnjr5c1H6CNS5Y0LiEYQQlXT6D/tNPYNEnJ/31Xh6
/rkG5NU7nQWDxRsWj7Cv4obulcuL+KLf0p93Ztx5AQlTGG8AoSNVENme0RrKEDWIlZnTExFl
MDEWl2mVLoyUMtMTF7Gt32976yObrIhLTw5p1Z4A1QdAP5XW3bJVkJcIK/9hbWeeWsQw3Pcf
hCBx6+KWKaGLhL1TC+ud1W9vwNufq0zCMu0Eh8SVfgASf1v0K6hGTBe+vUDz9ZiNDTGwyoYB
0kn6Pcl5TuVY9knyn7/lu12ImTecTuT2/DqsFheqtY+Lj9V2QT2ASLQ9LxqKX+dKR7zks9J0
xpH+lm03zf+3ZwDcYR2Gbq9PG3OgWIroHb2PXkeJR0h5CVsSDeW5Zj12CAQghQYtgf2g/BBy
NquILPQ9fQbIe42P4lj7twbXFkAyCam9Gym5dQlOlhk4uEjEE3sJ7XueZly4PvffPUWwdROZ
/Sgvt4h7D9a9oiSz7nTBbjKIzdH9biQh0qurJmhTAmaKdsFiPNx2SCS/hVnuVvGoYabMsd6I
kZIrPNenKT4sw4c6eIdJO8F//TUQlhG1QrCO7hiB8quriKKOPJF8HxeFxCObRk2pfcVR+lxO
ErtpOSZiQlLX3snQ4Qwv0kX90sQxk0lUjgCP9epdkozZ9GzQRU259k7hyVrn48fPfpmM5AbM
8iqCiItzAAcuopnGfuC2smEA4cd8VNMT3InLIfz0PrPMVtXtulLG6LOYwhb+ZFDKliI+OAfG
Z/BFM1VX3LralrDooIuVrK/bXQBCVPs+Ma1DCq9VsWjUI7ngwYSi3gIIl8u9UWuSrU3BgBDX
8MHgsa0IJ59yfnzQD5d3gcxwxPbllsdaN5SHWJiR67/MBGVZEJCZiaKvfcFXsIuYGqtVTqE2
6Lp8R2G9IFfZqsrUU5JL+e6tEqtl5RU4UoDcrRJfQ0SVTc3Gt2kxii2m+ucNd4Mfcx6wovfT
BtPGWvTxr/vWPdVPb38FjaOvrHLxnyEI/e+0J6JjNOFRkTSL4quw/j2CR22jFZQ77RSHpJur
ztz203HgCUz+xYITDRaoXLHqKHPgHqTtrjhl1Rl1pm1WEZFy35OclJjXyGspG7lgRzfdUxQj
thqVbwYJWRLaLTx/M6uWm4iimuhd0WLCDOM8YKPFxb2fW0uMLek89P8m8po3LImhWpzxdOEo
FqU39sTzTpvZl8VdfpV6rXS1/QodE4sYHZNvWFE4RkukMK9iiBypOf9XvO1r972umnEQUb8W
bRcw6skuLUfL9zW0FuzyFJzkcC9S0wl7/DN8wH+kAAmq+IQNJFtMGUeUdWUDRdCOvJJdOu5h
wGbYlvFc1ogH1Eq2Xy6LkHYCARg6NBAtEnS8y9hWd9/7hSKzz9y106CFkgxOh+Tyg0OsR8oJ
3b1zZ3k1WBMsugH2uUMSG/ffZEYqHyr/C5gLuwmdz06aHCmPa5a1hfaN7n5SBBlhwC5FXc/N
Vsea71l3vIdfq0PCe9B09J+9uBkKk0j3AczbUud9GVQRHRbYntJHBWy68Kjac89WxiTRvhMM
YDpwKYrRv6b7ub/SnEtKGF4Z3hsl9wMvNzO4cCAfSMnPwRNx8dMFnFVAEC05MqXgV6t9yc6I
m/ZValiCWA6zNHNTr9RG9Jm7+MCq91G8Ge1jIATS0gm5FrQ7tJlNMPO0MFaPzWtBgnxHD1aW
MnTw4pd0pl+6Ma6fTsTiGwMXWkDq24JxjxTnfXt8CEgQgwPtXGekF9uP138Ul0TrwN6H3QV8
G3bIPQaW3H7MY29v4HdDy7ksn5UD+StI0fxp2lLh0uywul3/XPDGZ5nn4t4FTrFuRKDWClNp
ICDAxvtQD65qT/QbGITO3JSlRrBycOH9hA1ZmV14zBdS/7MKS95VrTqtlO182KI1mf1BiCoC
Y4eay8Wu9YxJz1V6gYpMfFdubTC5oX72loHRh40XXVKzQYTLLdOhBbViZoIw97KLhoRnkHmO
HSpyafFezCTz1UWFCZ/cyQnkP5U6v+eRn5W+NNVqBFq7TqzmNJob6U2Ia+cjNzoPRBwiT8OV
5q4Y+bgPC4sW9tkGwqoBUrs1p5UjhnxNmWoS7BVuhZiTbIsU4pSyBcvFIlnQI1TAns7N+Kq3
m7Z9SEOcSJSeMb0dqQuJHM7tUlnA4BU68YE+1fUtJU0ODD/uVh3kzMTRqM1l3q4HXIYvCDMF
xImuRnKyya2luFkybMlIRCT+iQAWyVe99bo9aw8OG6sxVbMf8LGCoTPBHCVmecukJ/uSAsKZ
73m10XTxhn6AZEUWkySHJXd23hIAkosUFL5M+Z2KXPD9kk1koJnji6cj+itOpOAIKFsM0m1q
lpAlzwzdy9/gvJ34QfFfxs6cYQoFADzRZY0H6q4G1INnbM4UMJnBczFNMRXfeJwTWNRFoh21
u1MvMIvdYkb5ZK1Cqc38ONUK4U2Mz/uVihBeCV9015ADLMqxHpgfElqaPutjipDWlkBtK8hT
9WCwzwIAF3LKGdlNRMQ6UAgnMTbh+pdhmL6z1fWlYiGa2T4DUswtYpa2QYGVsmzLbg3WvaKq
sKOg5SYirwyvLcYn0GrStlHHKkLrLbSlRlBfkqLGGY+NzVszsQpgvyWgUc+axW0FdxVIICuz
0liwQQq6Ckv2YI1WQQWZwowfCoOXEJT24pCTmlDhmpfupV+nqfxMlH/qHMsmo9z5/N7NvdZp
rnLERhLKH4+xUq9TKWowJSjeucXAPpvdvo0KKzBHSpxyZtpYWW6anoZyDlq/PgAYoO9aUet+
3iYxOXK+hC1oUKs68G4tbdctvIl/5K3+9Qa08Qf1WJN89hZJT74jQqQ8oUDE81WmfhfkajFC
XEPR+FOhEgXp4qqEGwB6qY73j485/FsxjFlbphh/XygrL3qk3OLtxSRsIgiKB/dIOUPFJK08
4EqaP7+YDeaCTMd3Xlbc5PI37oNDlFINeiNQT2VN1OxQufWpGasLItRnfNhBppGreVjeRZ5V
uYDd6/0elty7ox037+sNdJIe+Lku0LNMEmCwCtM+YR3SKBmFw5N7MTXUy7ZjfGQHX37LezCq
H0dpyEXr2/54cBqrdIFfbFw79DlR/eGCqllZeZTF2zIMrIVjFEWmT/wDzGV/t041utxu8dXv
8gSjGXDL82ly9LgqlsMFdR25l0ry+NGreUQ0S8a6q10Pp6iDQeLGk7IaE+opEgS6Ih7PWWqL
WEVu3IxV+d8nzcyPSjaxu8hH+BEx2NfXBGS6vdLZLmUgljj1Mz2PCvtvfrud3Acc8IQGqnXU
77uigzOuTJXyO4Dm55gn7Rhk4RSVJZkN7QOxzWDlWKJE349iPqfR8Vj1ITmU3b7jCww/Tzig
IQyP25Ivg9JwcwgUT0Y/zI+dLK3yynLPMEA2+CY775rgOc5VQYn8SKsE77Rbl2XQI2le6K2K
Wwdxjku/iSnDr3yAKT0FOIcBVYmN8wtisdEuwBFbqrPs9iQm9QtiW4GFruuvcvo2KvBY4z3R
WXWV25GTfap2Pxv6A5TjTsNNvy64ikPxo001paHEVdi/Okt9doNMyloPoehEg/VFH7C2X5Mg
80S2jt0SV23cpe7gSyYZW4ISNC38NPTKBG0VSsnqbstCSi6Z6PMCdpz/XQqfPzIsJseV7HEV
Nblm1cD8xuO6EIo2FI30/qKdZLSABtO1na1BW291yyCA7ytmb6F5GwPxsXgiJlqYLQ2V/UTp
RPHTdYNaUrvAa2mTg7kEVWtJYlzWXrvwsHustMhpDiwXHDetZT2Ey8D0Ft6oDlOOncm84zk/
ccPBKGtQC+ybUEYgE27KLwYY7uCkQoAMIAhx1Q6KPBpWiRR4iVbklWcSq9PvXuaIeyNqVj0e
9gP/cF0l2XvBr6yjz125jY/t1DpKiWEZUiXrv0v/sEjIIMohSZ0kGlB8cdhmallVLyXxQSOO
+cxBIVrJJK4e5kNxMFlfr6bAm9KpeWIT1oIdzLY7OCxNJmUtmAlXRnigYwSSSzqMTuVGe1ym
ihGlRx3ngX4K2EaN+MN1juXUIJf/isOSOzyo2ebG9kOu7V6/KxGfdAaIk8SvD9TjFmeLP8c2
50Lg4aORWybJMCBAZF80A4TDs1pICwUYb6LMkk1gTTt8tubbeMPYd2e3bev09JZnHiP492hd
hEzEIVQ6pBW7hZ8ouLWYbmRzZSrRnVem+rq7H2uZBtJTvW6970fxqtplzeecmG7Oxv7spUVG
4prH2eMxJpciDkL+cUtha2xdG2/ynqLKi7GKOhx/tNKEm53/6ogxFoUn0Wi9Tt9hin2RnP5r
USsQnm0gMpEemwtIMeiJmXar8FVICN30mrw/M37FxSyLy7Y++rovDOE159Vl+h0Ay9GRXgtz
y7HW37zPP+rwqbZX5NrvrKzDPS83CBHic0z44OVZcCeunGibYMvrFu3BNPdvold9JQzToOqt
JtrNWA0A+uDu/Gv9VjTENEmxNeGesBjIxv6oUEEE4W6if3KE/JMX3iXrlBQ9Zb6zJnA8dsnM
memn4Cme6eQQkRG1r4UFLr8FkvijES47hp6jPluXcd/azoCUKdBNoVcdM+kLT0CMI2tQWO3h
4hLmoeJECvXT2Nc/r7qYdYm66PIRxSAQjdFMd3zsIMyHPYjdW69BVk3VGtsPMkUiP6dt7nM0
Rrt5u5rUZNAkJgTlHfHHXZUaS9eIwzlwWWEErcxmvpcOQof8OeBVqNK9fu57vSwGaVVVyaMJ
lhjU5GX/JGSV9SI77Cfir5Fq610831i5MHZFISppK+sge6SOZX6iqx+f0RSPi0Z82jaaY/Om
peElIt+stUD4wqVAZ0SmesiXuJlHiARsCBy81aOVQI1Dv72IrbpvC8Y7+axI37+8S2lNW1gb
s/Zoo+UavWZgPnR9L0rTdIv4MD2GLhDVH+BFKBG193cVu59YLnEdHoAJSZ9+mSDmR+aS0MXe
AuAQg0WBIyj7NZrIRTcDOMgJCp+bYeyt3Zqkjne6Lr9U/8sdKLYfCfQc/hHAEGrZRJFIxfsh
7q6G8zOhioUFGEnFSy0DRc95APWRE2utosd1EfAEoGLUunuN6zpLqa1VqIJm40CVvglNWpSV
acfX8k4Mmu/y++O9UwnWM/xUjYPinLIvIbhqI6aL9ykBcBx9qQITD+geWYgVTIxxBo7y14L5
aMbCaL2ZMAGkKpi7dn4dcxbt+JiIjiUDmLsFkLmyhAYH+cDAD6myohVOt9JQVG/mhi57HeY/
JHxLpXrYXdHJXhRkx0oDwydO7STNcSM714S5PfD7l9fkBQR1r+RG6tF11SdtXbwOmuWjcu6s
dxat8THgJvGjIw0z+nPvggEXpCvOdlyWY+MRcNmlomshl2gkZKeLnEjzxcVcVo5FnlNBb2YM
iOddmWDUyqebRKPYIEi0ysweTNhKo5iikaB8c8QuoLRyM9cgN4XSkbYwoZSpkq6cPzd1NeS/
Gp1739X++a2wCtgJEmtVGIdswnPcPzG2QN04PBwsU+sjieRUud97iwIQ6IDUliXzvid/QALx
Q/kNAi2hjce7AGwv57zRnwAXNQthiyqb1QUL3JbD3dQznB7xno8uFFy4ZMr4Ot12L50kwirJ
TGfKb7ir4Xi7RrrvGEg1r91F/M7kqc5IUp2a2asbimmQWM8Kad8HPxXk1SJ+R6EEIRT4LB4g
DhnhIFGm1ubOOmpXEU6Q305JYkHOKNj/+moNUObKwgS+sT3Orc+xHogfOTrTXv2IcDqYr+xF
rc/tVHA3hmIDZwdl5W6eg2Xfwk5mrMMlp3PWrveVODByWjFDqcCXEya30iubssIb30wlkZUe
jo4JOVp3PwY2ZuK24EYp2aK8ccgNy3ZrHfKN8qiHnuq/qxdW3wXGwVkC6z7zK3upxHRoD+ba
Y9O7vSSHj3ev1zNmY7O/l5WWH3xKtep1Ek8s4ILk+Yuo5cOGAl/v4/l65SeFeDJclC0SeiKC
+mWCxkDNuh9CIKupNIKoNa8zAcR87rsCKBT+E2G4kdwn7SqtQ/BPV7f7TG3V1551aQNiB6Nw
jkTIXZIG+WL953ka4AAarDO4fXmjlKqPGqWRAVB+hSu8L94J5mMjp9YLumYAVFoRjLWaZV7l
n2Bui6ATufAkxA3gg5JH9dkNNVsBqcYfs9lMLypaWHFdfQdK7+PN9ksTNeKv1MsSRF3nk0s5
2CAdy62Se4teDt2nrxM7GgJLh+GsFuo2cQsafbNDn2FTdh+jSelQ0Y514+rDUDhD1+imOzwB
KCOGJoHaCarFyhzKkgfgP65JSzrs5LbFx6d3Nxy8YYwq7quXTQ+GwQV1/xLT4TQf386tzh5P
fVEoWiKWGLGaI3GwbdndZwXw4Tg3UK0wiET+dp3KOiHSqsUDhHIWFZjFe84vGedIjE6SURJR
hhXjFbIbrQ8cJZuv6E8YaV6kmQDoSR53JrSY1cgiQ72wx7nfVPa91ImWP69ihqHeA0E7P5xf
srR6dFTIDt2y9QzJtS4gUEFWCSAfjPXcITcuWstvtNd/3WM3JDNF1GWmpJI+SvACH4UqVSnk
fAVx8zOppS2z6Z/VOfWAxNPnPH9/PnbslxLAaNC4X2QbmgXqSm2dM1y9cyzeqh7U1NqDpdql
WAS9lnsOVYMnQVNb+uXEfi7WJ9SKPosBB307gPRw4ujFVFxp4WJ2xqWQCzax12X9mKB/qAxA
ifFlYGjMrXtL3nYkX8b7mQrC2scbWqFmM9/Ii/BtsEkcC8XxrqBP0BgkOenw0H4I06hlkAfm
iVqX5VEBk+9O7yXd5+nyVF1OfOA4HtCCV9wO4jH2lKhUNtPrs67FPGd5A6jSg36N+dwDRYbF
F0NMGM3xKEixfm2UvT2RWharPfTlrBv1pKc+MAsLFqBI9SFcuENTTmLG7Dtih4e/tJsm6Ouc
OPutg4JcHZYtg3F9oK8mToOPBwGKeUmc0PeStPL3OGJD5pnJY6rT7NOHRQJNy4KASiOF/WpF
iGz4q1e8LLBfW1AaIuw6o3ZUp04AqOGSA+CdkM04mWqBVoTWx2Cr9wb/KB6Q1vsk5GE2g1Sv
iPcSbVTsB69VBjZXIGmOKVHcusdACB+SkIn89HV35rkg0JUYr+s1Nh4MFMce1U+3rl1kEL+W
qHdhZM62IxzuizftvWn9dvk6EaY/xjBwzHZVKhtPP6OX5S0OGSoDaaYz+KKdFTIe3YLUa0wV
r2oEMDJDo51HPxKnaC6fQYiww1k+q/2aJHrT9bEYEpBn/2OTunN5Cx+SR28KIPZXY6Ud1xCj
QyC5eb3am1l2ibRUIq702BepENfaO1Sy1osH4w62BwiatJ8hLDBkNU+tLyaTcHHdITxNqpop
4rqJuFQ9MN3ah0sS2pG4TljcjI6TH8OA8z/RXsYI0jfOiBL8hqVLhC/BP6NklRi/lPtKGPSN
EQk4aN0UssYedWhuNtvuujSBvgRjdX7/NX7pKMpmk7XJr3yYyx9MhMlPFsAQFy4odjHFhL/e
RRuR2Cxh/pmbdxLTCA4VerxLmOEvvIDzmZ0VOHDJUi9SuLqSX31P7/aSXzSS0U0ctEOjxWMl
o3IYKTSsPOl7m1jn6XTA9HCuvz9TAl6MbahXVdI24GBQsJyC46FrmGuslCliZXhWzy+hgHMh
G+xzkZpombE5b/kKoSJODT5jWdSwBQU75d9QQRsdNhJRQdqmc5oyKKMD434IX0cNXwSlagoy
dvUnSXhUi2ki6xOxHhQ25SwlYpwRuJrbIAoZ9GVa1N7USZhUuw9FNVXtY/ytlCbai26ejUh9
5sttZL6RCiVBxFgMwkOs8zNDCOsZ0BFMQmTy9O8vkRO/QD8amP1v2Vr8AKayVBNTmrs914i8
1vmhjVc0W0yLM6Ae3gIBVyxY9bHCD3v8fCnwL75sMzcwuY6V1T4NzjXKLXoMA/GqETeoQORD
PrCgu87q8Wa7+FSAKeF+5s7dAU7wwnuh7zrYJHgZE0r6+Q9RHsm+vlMDkzPs/JyAD86ZP0hs
HZW2t7Q33xVGxrh/uMK+uRFoC5/Pl8ayczvGJkLm5iL4GDaPsKgmF6Noc3OOwXb2e5EzQabM
V1cBlcJvrt/tUvebKWF+SFzsvUxfDMLcWzh5yulv6jCFcIdIaoEiHvl643028eK9pMDj6TYl
q5hbiq8e2j+lN+s6Fqa6uheGbpfUx7t/CKxWjPUm7BuS3EZWpAz6F7MII4aGR8qb4eHKs0bR
VMOptwVGMzFlHy5L4wXNkMoStnQmwf0lln9fopF62QcHnIOOpvD4p/Vwp2jdSOkDD34H317w
F/SahKI3Q0mYbjUC8N7cXD2PbUNZkVPNl8nK7KSY+Cjq1/rKKFyucdRzbBulxnXwzkjv0IT5
JvPoW0W1qWcaFqWHL7kFHZRvRd1NtxNs+kXbmFSJZRuE2SUh0AyvJDkZMPV6ygXFGwlWzj8j
7MCqiyVrUzzjb0CpqfmQX+YcSN3v2vzJoH5wmQ0GSeajvVQ7pwmsXRCs989bBb542SZwEDyc
F4y/foHju6jGejMy8cFvQzgQZ+enN0iU9wgY3AdwQ8oDFgcSO5L4y4M/+r2KUO5Df116Xk7w
KrUEoThdQs4ncTElhalbNoPiENXODss6Axdwu81AQVmuDM3w96dTUYBXA0P+pz7t68okygZn
HFPgBKf76Yf92eE4EGi/mo9xX0Uxa3XOdkrpHO9ZEORkKeJhzYLL6svSsNFnSkk0W3FzjJ7y
14M9TJQob7npUQ2E4xOGQ/PxJjCb9Hy4rYQXd+ChToYEMMaROUlYq7c22LfJZDEr0Ae83rZw
xPDENhEVyy+SbPt/t9e8n7B0+UP+8zo+ZN8HyDcyPmGQc01FhWXtY4zo9TMF2LsGRqPtTvEE
Ku5KwB6CFjtt6nTa5tASv99Mus+sFzJryEPgvL9ljpc19IaCWd0OSiQv0r6QWCcHATnQEBDZ
GqgwHi8bcCMU5tAIvsNxrXA6awoJMPPDklYLjWL0ddWHaKz88DYB1OZ78JuyHL5CQqEH7wY0
M2Gb5L+vMXQtYqwk6DnZyzKBxBNl6BcFlePbXQ+uGzGgbPq0JON5GuaWdHv/jreb4tKZzsbS
h1qNNBXzYcRl6+CDbQt28o1LCPDdOHff7jTH/BftUBZVxv0BEgM+j0G2ZqiccSK03wfq18B6
Vy2m5DIZzVW6PtK09zznPCwHwF+LrduafPf3lS4CnU3PFy+KiaG10Uu+Q5gs2I9Za2k/VVkk
8mOk/VFQF3DDTGI4wKgPU6pZwkrqQ8CAYii4PhWBYnqr537f/aXGkIuGumRB+CzTvEry+8kA
xqV32510NLeHHgywWim7fG25scwYzIkaRwduREOM9cr4Qb2DBZZmQW9POaG41b5mtZuwpGQL
ihuwy0B40tWVNTnr1vwpvu2JzDrcPFUvuqX1p4WYK1eynrA1y1JomMJER/AQexR5l4ZeniWX
mj2XvWQQPEWXCD9jy2C0PSz9YzxyMCxLvCGHfqbTLRtSrglSI08pj9Vh3Rm0F28+fjJ6LOBl
i2MBabXHQlpwpDT9s2vi4NwgBYITPxNdbHg9mIP9foQI5udehK9Zj8cptMDt6s5glNM7/Bso
rcvfiVvtPyjP8JS4pC4z6uufImsPZhtE0oQZLHC4s/hfrLCxgs5SNSb9Ao5o6Y3v4+hrquWI
76EeA7VSHr2arN9c67QA6E1wpjzN8SEOiLb6q6giWvYtIeRYCDCjfVO529gH6JdBcTx4xc22
7318eE95Zz46vTLsZQl9T9FZfyarXLkof7AQ5PNa611auyUhRUdmyWYt0i6QFAeGVdGrpL5z
MX1x/b3hCCXeD7CPOlh/a59KnFxibe4TxzOWxAlkNkjpAdA86Yk4SyRAwD3xKiSrpWO8a17F
MLfoqiw8myjQ+Ya1U5bs5UjPppZxRsEqMtN0kpD+1KlZ4Wh+QHqQkCsfALmy/3UpZSogJ6ku
FtS3apk65YUiTotS+fwYxLFCnYvemNr5TccbRIZmSYH1lbtBEyeL9dRQR64SQ2SLW/63FbK5
Rp+fSglvizG5iL8cwYHkkd9pRu6Cn6I8K8G7hwtFnpX2wXuOvI0SeZN3hpq52HzJtwdXAnGP
al6xTXWMtY2MXQBWbg1T+WVuzIAxHeo0Rz+3CRSHZIJL1BhzwIsjWBJaB5eqzDwtif2iHdG5
onkApBY9K/mIDv1Dr/RzEbQucqy4i0+HvgSzMRdSVmfmBJ/P4aQ+VD/v0a3sGHBbTjJIWC8s
1gKMPeRQ1xPc3gCATY2x9qVwFNi4z7CL3EgXPvt4+wnR4Y97hOhc8whVPpRYMNCVLJqpZymj
x6tC/quH0ebetLPrYr0d1M8wfiNc8erqUYnqgtbrv/HSOgLYM02u5CMQK5IbFl7vaEiwVx6p
kLovtwXbC+DCFw36ccD2OWwCWV/pBOUrEjcJ9NZLYAUGoeIxzbKF4uLdMj55ajDDhbiB1ia/
/gsElzqKecTZJfPSJtiC310c53izWi53EceCm/W4yMQHXrvxkSt6oOJegIjgE/nqeqlrz1xl
cMZlNhcGhNhFm/j8r+t6z8BC+QqjnfpRWYZW9me8El/mAcdq6osD8NEfKHWBYXZNw3q+x2tu
9hQGI61zEjpsKmcG0rMnrfXJKcHsqGV8SXM/FRXj0DC/Xh/ObD+9oYaFzOzzUvXwzW6mKUK7
Qm9vMIYBICNtF5NLmqvb2SSvhuoLQX1LHp+xp89smKfUZ3wlcxqFDjlSbNLsbXnUeuskZFs9
NsQ4lUn9cUf9ibDbQp7DLkGMuhWuctDSKqGP+BVw0Z2mGA5oPJVjVHZp8VqrYpykoHS2/6NA
aU+lEFlpWLc+a49nwu2QCgsTGjOr7OUAygbViYQraNcAAZD+AdnNDFCgMWSxxGf7AgAAAAAE
WVo=

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=perf-sanity-tests
Content-Transfer-Encoding: quoted-printable

2020-12-24 12:50:16 make ARCH=3D EXTRA_CFLAGS=3D-fno-omit-frame-pointer -fs=
anitize=3Dundefined -fsanitize=3Daddress -C /usr/src/perf_selftests-x86_64-=
rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf
make: Entering directory '/usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e=
7ea9a80b0ee4b4445ea59c806787813/tools/perf'
  BUILD:   Doing 'make =1B[33m-j4=1B[m' parallel build
  HOSTCC   fixdep.o
  HOSTLD   fixdep-in.o
  LINK     fixdep
diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
diff -u tools/arch/x86/lib/memcpy_64.S arch/x86/lib/memcpy_64.S
diff -u tools/arch/x86/lib/memset_64.S arch/x86/lib/memset_64.S

Auto-detecting system features:
=2E..                         dwarf: [ =1B[32mon=1B[m  ]
=2E..            dwarf_getlocations: [ =1B[32mon=1B[m  ]
=2E..                         glibc: [ =1B[32mon=1B[m  ]
=2E..                        libbfd: [ =1B[32mon=1B[m  ]
=2E..                libbfd-buildid: [ =1B[32mon=1B[m  ]
=2E..                        libcap: [ =1B[32mon=1B[m  ]
=2E..                        libelf: [ =1B[32mon=1B[m  ]
=2E..                       libnuma: [ =1B[32mon=1B[m  ]
=2E..        numa_num_possible_cpus: [ =1B[32mon=1B[m  ]
=2E..                       libperl: [ =1B[32mon=1B[m  ]
=2E..                     libpython: [ =1B[32mon=1B[m  ]
=2E..                     libcrypto: [ =1B[32mon=1B[m  ]
=2E..                     libunwind: [ =1B[32mon=1B[m  ]
=2E..            libdw-dwarf-unwind: [ =1B[32mon=1B[m  ]
=2E..                          zlib: [ =1B[32mon=1B[m  ]
=2E..                          lzma: [ =1B[32mon=1B[m  ]
=2E..                     get_cpuid: [ =1B[32mon=1B[m  ]
=2E..                           bpf: [ =1B[32mon=1B[m  ]
=2E..                        libaio: [ =1B[32mon=1B[m  ]
=2E..                       libzstd: [ =1B[32mon=1B[m  ]
=2E..        disassembler-four-args: [ =1B[32mon=1B[m  ]

  CC       fd/array.o
  CC       exec-cmd.o
  CC       event-parse.o
  CC       core.o
  LD       fd/libapi-in.o
  CC       fs/fs.o
  CC       cpumap.o
  CC       help.o
  CC       fs/tracing_path.o
  CC       fs/cgroup.o
  LD       fs/libapi-in.o
  CC       cpu.o
  CC       threadmap.o
  CC       debug.o
  CC       pager.o
  CC       str_error_r.o
  LD       libapi-in.o
  AR       libapi.a
  CC       parse-options.o
  CC       event-plugin.o
  CC       evsel.o
  CC       trace-seq.o
  CC       parse-filter.o
  CC       evlist.o
  CC       mmap.o
  CC       parse-utils.o
  CC       kbuffer-parse.o
  CC       zalloc.o
  CC       tep_strerror.o
  CC       event-parse-api.o
  CC       xyarray.o
  LD       libtraceevent-in.o
  LINK     libtraceevent.a
  CC       lib.o
  GEN      bpf_helper_defs.h
  MKDIR    staticobjs/
  CC       staticobjs/libbpf.o
  LD       libperf-in.o
  AR       libperf.a
  GEN      common-cmds.h
  CC       run-command.o
  CC       sigchain.o
  CC       subcmd-config.o
  LD       libsubcmd-in.o
  MKDIR    staticobjs/
  AR       libsubcmd.a
  CC       staticobjs/bpf.o
  CC       staticobjs/nlattr.o
  CC       staticobjs/btf.o
  HOSTCC   pmu-events/json.o
  HOSTCC   pmu-events/jsmn.o
  HOSTCC   pmu-events/jevents.o
  HOSTLD   pmu-events/jevents-in.o
  CC       plugin_jbd2.o
  LD       plugin_jbd2-in.o
  CC       plugin_hrtimer.o
  LD       plugin_hrtimer-in.o
  CC       plugin_kmem.o
  LD       plugin_kmem-in.o
  CC       plugin_kvm.o
  LD       plugin_kvm-in.o
  CC       staticobjs/libbpf_errno.o
  CC       plugin_mac80211.o
  CC       staticobjs/str_error.o
  CC       staticobjs/netlink.o
  LD       plugin_mac80211-in.o
  CC       plugin_sched_switch.o
  LD       plugin_sched_switch-in.o
  CC       plugin_function.o
  CC       staticobjs/bpf_prog_linfo.o
  LD       plugin_function-in.o
  CC       plugin_futex.o
  CC       staticobjs/libbpf_probes.o
  LD       plugin_futex-in.o
  CC       plugin_xen.o
  CC       staticobjs/xsk.o
  LD       plugin_xen-in.o
  CC       plugin_scsi.o
  CC       staticobjs/hashmap.o
  LD       plugin_scsi-in.o
  CC       plugin_tlb.o
  CC       plugin_cfg80211.o
  CC       jvmti/libjvmti.o
  LD       plugin_cfg80211-in.o
  GEN      perf-archive
  LD       plugin_tlb-in.o
  LINK     plugin_jbd2.so
  GEN      perf-with-kcore
  CC       jvmti/jvmti_agent.o
  CC       staticobjs/btf_dump.o
  LINK     plugin_hrtimer.so
  LINK     plugin_kmem.so
  LINK     plugin_kvm.so
  LINK     plugin_mac80211.so
  CC       staticobjs/ringbuf.o
  LINK     plugin_sched_switch.so
  LINK     plugin_function.so
  LINK     plugin_futex.so
  LINK     plugin_xen.so
  LD       staticobjs/libbpf-in.o
  LINK     libbpf.a
  LINK     plugin_scsi.so
  CC       jvmti/libstring.o
  LINK     plugin_cfg80211.so
  CC       builtin-bench.o
  LINK     plugin_tlb.so
  GEN      libtraceevent-dynamic-list
  CC       jvmti/libctype.o
  CC       builtin-annotate.o
  CC       builtin-config.o
  LD       jvmti/jvmti-in.o
  CC       builtin-diff.o
  LINK     pmu-events/jevents
  CC       builtin-evlist.o
  CC       builtin-ftrace.o
  LINK     libperf-jvmti.so
  CC       builtin-help.o
  CC       builtin-sched.o
  CC       builtin-buildid-list.o
  CC       builtin-buildid-cache.o
  CC       builtin-kallsyms.o
  CC       builtin-list.o
  CC       builtin-record.o
  CC       builtin-report.o
  CC       builtin-stat.o
  CC       builtin-timechart.o
  CC       builtin-top.o
  CC       builtin-script.o
  CC       builtin-kmem.o
  CC       builtin-lock.o
  CC       builtin-kvm.o
  CC       builtin-inject.o
  CC       builtin-mem.o
  CC       builtin-data.o
  CC       builtin-version.o
  CC       builtin-c2c.o
  CC       builtin-trace.o
  CC       builtin-probe.o
  CC       bench/sched-messaging.o
  CC       bench/sched-pipe.o
  CC       bench/syscall.o
  CC       bench/mem-functions.o
  CC       bench/futex-hash.o
  CC       bench/futex-wake.o
  CC       bench/futex-wake-parallel.o
  CC       bench/futex-requeue.o
  CC       bench/futex-lock-pi.o
  CC       tests/builtin-test.o
  CC       bench/epoll-wait.o
  CC       bench/epoll-ctl.o
  CC       tests/parse-events.o
  CC       util/annotate.o
  CC       bench/synthesize.o
  CC       bench/kallsyms-parse.o
  CC       bench/find-bit-bench.o
  CC       bench/inject-buildid.o
  CC       bench/mem-memcpy-x86-64-asm.o
  CC       bench/mem-memset-x86-64-asm.o
  CC       bench/numa.o
  CC       tests/dso-data.o
  CC       tests/attr.o
  CC       tests/vmlinux-kallsyms.o
  LD       bench/perf-in.o
  CC       arch/common.o
  CC       tests/openat-syscall.o
  CC       arch/x86/util/header.o
  CC       tests/openat-syscall-all-cpus.o
  CC       arch/x86/util/tsc.o
  CC       arch/x86/util/pmu.o
  CC       tests/openat-syscall-tp-fields.o
  CC       arch/x86/util/kvm-stat.o
  CC       tests/mmap-basic.o
  CC       arch/x86/util/perf_regs.o
  CC       arch/x86/util/topdown.o
  CC       tests/perf-record.o
  CC       arch/x86/util/machine.o
  CC       arch/x86/tests/regs_load.o
  CC       arch/x86/tests/dwarf-unwind.o
  CC       util/block-info.o
  CC       arch/x86/tests/arch-tests.o
  CC       arch/x86/util/event.o
  CC       arch/x86/tests/rdpmc.o
  CC       tests/evsel-roundtrip-name.o
  CC       arch/x86/util/dwarf-regs.o
  CC       arch/x86/util/unwind-libunwind.o
  CC       arch/x86/tests/perf-time-to-tsc.o
  CC       arch/x86/util/auxtrace.o
  CC       tests/evsel-tp-sched.o
  CC       arch/x86/util/archinsn.o
  CC       tests/fdarray.o
  CC       arch/x86/tests/insn-x86.o
  CC       arch/x86/util/intel-pt.o
  CC       arch/x86/tests/intel-pt-pkt-decoder-test.o
  CC       tests/pmu.o
  CC       arch/x86/tests/bp-modify.o
  CC       util/block-range.o
  CC       tests/pmu-events.o
  LD       arch/x86/tests/perf-in.o
  CC       tests/hists_common.o
  CC       tests/hists_link.o
  CC       util/build-id.o
  CC       ui/setup.o
  CC       tests/hists_filter.o
  CC       arch/x86/util/intel-bts.o
  CC       ui/helpline.o
  CC       ui/progress.o
  CC       ui/util.o
  CC       ui/hist.o
  CC       tests/hists_output.o
  CC       util/cacheline.o
  CC       util/config.o
  LD       arch/x86/util/perf-in.o
  LD       arch/x86/perf-in.o
  LD       arch/perf-in.o
  CC       tests/hists_cumulate.o
  CC       util/copyfile.o
  CC       util/ctype.o
  CC       util/db-export.o
  CC       tests/python-use.o
  CC       tests/bp_signal.o
  CC       tests/bp_signal_overflow.o
  CC       tests/bp_account.o
  CC       tests/wp.o
  CC       tests/task-exit.o
  CC       tests/sw-clock.o
  CC       tests/mmap-thread-lookup.o
  CC       util/env.o
  CC       scripts/perl/Perf-Trace-Util/Context.o
  CC       tests/thread-maps-share.o
  CC       util/event.o
  CC       tests/switch-tracking.o
  LD       scripts/perl/Perf-Trace-Util/perf-in.o
  CC       scripts/python/Perf-Trace-Util/Context.o
  LD       scripts/python/Perf-Trace-Util/perf-in.o
  LD       scripts/perf-in.o
  CC       trace/beauty/clone.o
  CC       tests/keep-tracking.o
  CC       trace/beauty/fcntl.o
  CC       tests/code-reading.o
  CC       trace/beauty/flock.o
  CC       util/evlist.o
  CC       trace/beauty/fsmount.o
  CC       trace/beauty/fspick.o
  CC       trace/beauty/ioctl.o
  CC       trace/beauty/kcmp.o
  CC       trace/beauty/mount_flags.o
  CC       trace/beauty/move_mount.o
  CC       trace/beauty/pkey_alloc.o
  CC       tests/sample-parsing.o
  CC       trace/beauty/arch_prctl.o
  CC       trace/beauty/prctl.o
  CC       trace/beauty/renameat.o
  CC       trace/beauty/sockaddr.o
  CC       trace/beauty/socket.o
  CC       trace/beauty/statx.o
  CC       tests/parse-no-sample-id-all.o
  CC       trace/beauty/sync_file_range.o
  CC       tests/kmod-path.o
  CC       trace/beauty/tracepoints/x86_irq_vectors.o
  CC       trace/beauty/tracepoints/x86_msr.o
  LD       trace/beauty/tracepoints/perf-in.o
  LD       trace/beauty/perf-in.o
  CC       perf.o
  CC       tests/thread-map.o
  CC       tests/llvm.o
  CC       tests/bpf.o
  CC       util/sideband_evlist.o
  CC       util/evsel.o
  CC       util/evsel_fprintf.o
  CC       tests/topology.o
  CC       tests/mem.o
  CC       tests/cpumap.o
  CC       tests/stat.o
  CC       tests/event_update.o
  CC       ui/stdio/hist.o
  CC       util/perf_event_attr_fprintf.o
  CC       tests/event-times.o
  CC       tests/expr.o
  CC       util/evswitch.o
  CC       tests/backward-ring-buffer.o
  CC       util/find_bit.o
  CC       tests/sdt.o
  CC       util/get_current_dir_name.o
  CC       util/kallsyms.o
  CC       tests/is_printable_array.o
  CC       tests/bitmap.o
  CC       util/levenshtein.o
  CC       ui/browser.o
  CC       tests/perf-hooks.o
  CC       tests/clang.o
  CC       util/llvm-utils.o
  CC       tests/unit_number__scnprintf.o
  CC       tests/mem2node.o
  CC       tests/maps.o
  CC       util/mmap.o
  CC       tests/time-utils-test.o
  CC       util/memswap.o
  CC       ui/browsers/annotate.o
  BISON    util/parse-events-bison.c
  CC       util/perf_regs.o
  CC       util/path.o
  CC       tests/genelf.o
  CC       ui/browsers/hists.o
  CC       tests/api-io.o
  CC       tests/demangle-java-test.o
  CC       tests/pfm.o
  CC       tests/parse-metric.o
  CC       util/print_binary.o
  CC       util/rlimit.o
  CC       tests/pe-file-parsing.o
  CC       util/argv_split.o
  CC       tests/expand-cgroup.o
  CC       ui/browsers/map.o
  CC       util/rbtree.o
  CC       ui/browsers/scripts.o
  CC       tests/dwarf-unwind.o
  CC       ui/browsers/header.o
  CC       tests/llvm-src-base.o
  CC       tests/llvm-src-kbuild.o
  CC       tests/llvm-src-prologue.o
  CC       tests/llvm-src-relocation.o
  CC       ui/browsers/res_sample.o
  LD       tests/perf-in.o
  CC       util/libstring.o
  CC       util/bitmap.o
  CC       util/hweight.o
  CC       util/smt.o
  CC       ui/tui/setup.o
  CC       util/strbuf.o
  CC       util/string.o
  CC       ui/tui/util.o
  CC       util/strlist.o
  CC       util/strfilter.o
  CC       ui/tui/helpline.o
  CC       util/top.o
  CC       ui/tui/progress.o
  LD       ui/tui/perf-in.o
  CC       util/usage.o
  CC       util/dso.o
  CC       util/dsos.o
  CC       util/symbol.o
  CC       util/symbol_fprintf.o
  CC       util/color.o
  CC       util/color_config.o
  CC       util/metricgroup.o
  CC       util/header.o
  CC       util/callchain.o
  CC       util/values.o
  CC       util/debug.o
  CC       util/fncache.o
  CC       util/machine.o
  CC       util/map.o
  CC       util/pstack.o
  CC       util/session.o
  CC       util/sample-raw.o
  CC       util/s390-sample-raw.o
  CC       util/syscalltbl.o
  CC       util/ordered-events.o
  CC       util/namespaces.o
  LD       ui/browsers/perf-in.o
  LD       ui/perf-in.o
  CC       util/comm.o
  CC       util/thread.o
  CC       util/thread_map.o
  CC       util/trace-event-parse.o
  CC       util/parse-events-bison.o
  BISON    util/pmu-bison.c
  CC       util/trace-event-read.o
  CC       util/trace-event-info.o
  GEN      python/perf.so
  CC       util/trace-event-scripting.o
  CC       util/trace-event.o
  CC       util/svghelper.o
  CC       util/sort.o
  CC       util/hist.o
  CC       util/util.o
  CC       util/cpumap.o
  CC       util/affinity.o
  CC       util/cputopo.o
  CC       util/cgroup.o
  CC       util/target.o
  CC       util/rblist.o
  CC       util/intlist.o
  CC       util/vdso.o
  CC       util/counts.o
  CC       util/stat.o
  CC       util/stat-shadow.o
  CC       util/stat-display.o
  CC       util/perf_api_probe.o
  CC       util/record.o
  CC       util/srcline.o
  CC       util/srccode.o
  CC       util/synthetic-events.o
  CC       util/data.o
  CC       util/tsc.o
  CC       util/cloexec.o
  CC       util/call-path.o
  CC       util/rwsem.o
  CC       util/thread-stack.o
  CC       util/spark.o
  CC       util/topdown.o
  CC       util/stream.o
  CC       util/auxtrace.o
  CC       util/intel-pt-decoder/intel-pt-pkt-decoder.o
  GEN      util/intel-pt-decoder/inat-tables.c
  CC       util/intel-pt-decoder/intel-pt-log.o
  CC       util/intel-pt-decoder/intel-pt-decoder.o
  CC       util/arm-spe-decoder/arm-spe-pkt-decoder.o
  CC       util/arm-spe-decoder/arm-spe-decoder.o
  LD       util/arm-spe-decoder/perf-in.o
  CC       util/scripting-engines/trace-event-perl.o
  GEN      pmu-events/pmu-events.c
  CC       pmu-events/pmu-events.o
  CC       util/scripting-engines/trace-event-python.o
  CC       util/intel-pt.o
  LD       pmu-events/pmu-events-in.o
  CC       util/intel-bts.o
  CC       util/arm-spe.o
  CC       util/intel-pt-decoder/intel-pt-insn-decoder.o
  LD       util/scripting-engines/perf-in.o
  CC       util/s390-cpumsf.o
  CC       util/parse-branch-options.o
  CC       util/dump-insn.o
  CC       util/parse-regs-options.o
  CC       util/parse-sublevel-options.o
  CC       util/term.o
  CC       util/help-unknown-cmd.o
  CC       util/mem-events.o
  CC       util/vsprintf.o
  LD       util/intel-pt-decoder/perf-in.o
  CC       util/units.o
  CC       util/time-utils.o
  BISON    util/expr-bison.c
  CC       util/branch.o
  CC       util/mem2node.o
  CC       util/clockid.o
  CC       util/bpf-loader.o
  CC       util/bpf_map.o
  CC       util/bpf-prologue.o
  CC       util/symbol-elf.o
  CC       util/probe-file.o
  CC       util/probe-event.o
  CC       util/probe-finder.o
  CC       util/dwarf-aux.o
  CC       util/dwarf-regs.o
  CC       util/unwind-libunwind-local.o
  CC       util/unwind-libunwind.o
  CC       util/data-convert-bt.o
  CC       util/zlib.o
  CC       util/lzma.o
  CC       util/zstd.o
  CC       util/cap.o
  CC       util/demangle-java.o
  CC       util/demangle-rust.o
  CC       util/jitdump.o
  CC       util/genelf.o
  CC       util/genelf_debug.o
  CC       util/perf-hooks.o
  CC       util/bpf-event.o
  FLEX     util/parse-events-flex.c
  FLEX     util/pmu-flex.c
  CC       util/pmu-bison.o
  FLEX     util/expr-flex.c
  CC       util/expr-bison.o
  CC       util/expr.o
  CC       util/parse-events.o
  CC       util/parse-events-flex.o
  CC       util/pmu.o
  CC       util/pmu-flex.o
  CC       util/expr-flex.o
  LD       util/perf-in.o
  LD       perf-in.o
  LINK     perf
make: Leaving directory '/usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf'
2020-12-24 12:51:30 cd /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea=
9a80b0ee4b4445ea59c806787813/tools/perf
2020-12-24 12:51:30 mkdir -p /pkg
2020-12-24 12:51:30 mkdir -p /kbuild/obj/consumer/x86_64-rhel-8.3
2020-12-24 12:51:30 cp /pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0e=
e4b4445ea59c806787813/vmlinux.xz /tmp
2020-12-24 12:51:31 unxz -k /tmp/vmlinux.xz
2020-12-24 12:51:35 cp /tmp/vmlinux /kbuild/obj/consumer/x86_64-rhel-8.3
ignored_by_lkp: BPF filter
ignored_by_lkp: LLVM search and compile
ignored_by_lkp: Add vfs_getname probe to get syscall args filenames
ignored_by_lkp: Use vfs_getname probe to get syscall args filenames
ignored_by_lkp: Check open filename arg using perf trace + vfs_getname
ignored_by_lkp: builtin clang support
2020-12-24 12:51:35 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 1
 1: vmlinux symtab matches kallsyms                                 : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 2
 2: Detect openat syscall event                                     : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 3
 3: Detect openat syscall event on all cpus                         : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 4
 4: Read samples using the mmap interface                           : FAILE=
D!
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 5
 5: Test data source output                                         : Ok
2020-12-24 12:51:36 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 6
 6: Parse event definition strings                                  : FAILE=
D!
2020-12-24 12:51:37 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 7
 7: Simple expression parser                                        : Ok
2020-12-24 12:51:38 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 8
 8: PERF_RECORD_* events & perf_sample fields                       : Ok
2020-12-24 12:51:40 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 9
 9: Parse perf pmu format                                           : Ok
2020-12-24 12:51:40 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 10
10: PMU events                                                      :
10.1: PMU event table sanity                                        : Ok
10.2: PMU event map aliases                                         : Ok
10.3: Parsing of PMU event table metrics                            : Skip =
(some metrics failed)
10.4: Parsing of PMU event table metrics with fake PMUs             : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 11
11: DSO data read                                                   : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 12
12: DSO data cache                                                  : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 13
13: DSO data reopen                                                 : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 14
14: Roundtrip evsel->name                                           : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 15
15: Parse sched tracepoints fields                                  : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 16
16: syscalls:sys_enter_openat event fields                          : Ok
2020-12-24 12:51:42 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 17
17: Setup struct perf_event_attr                                    : Ok
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 18
18: Match and link multiple hists                                   : Ok
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 19
19: 'import perf' in python                                         : FAILE=
D!
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 20
20: Breakpoint overflow signal handler                              : Ok
2020-12-24 12:51:56 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 21
21: Breakpoint overflow sampling                                    : Ok
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 22
22: Breakpoint accounting                                           : Ok
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 23
23: Watchpoint                                                      :
23.1: Read Only Watchpoint                                          : Skip
23.2: Write Only Watchpoint                                         : Ok
23.3: Read / Write Watchpoint                                       : Ok
23.4: Modify Watchpoint                                             : Ok
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 24
24: Number of exit events of a simple workload                      : FAILE=
D!
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 25
25: Software clock events period values                             : FAILE=
D!
2020-12-24 12:51:57 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 26
26: Object code reading                                             : FAILE=
D!
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 27
27: Sample parsing                                                  : Ok
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 28
28: Use a dummy software event to keep tracking                     : FAILE=
D!
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 29
29: Parse with no sample_id_all bit set                             : Ok
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 30
30: Filter hist entries                                             : Ok
2020-12-24 12:52:00 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 31
31: Lookup mmap thread                                              : FAILE=
D!
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 32
32: Share thread maps                                               : Ok
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 33
33: Sort output of hist entries                                     : Ok
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 34
34: Cumulate child hist entries                                     : Ok
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 35
35: Track with sched_switch                                         : FAILE=
D!
2020-12-24 12:52:01 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 36
36: Filter fds with revents mask in a fdarray                       : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 37
37: Add fd to a fdarray, making it autogrow                         : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 38
38: kmod_path__parse                                                : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 39
39: Thread map                                                      : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 41
41: Session topology                                                : FAILE=
D!
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 43
43: Synthesize thread map                                           : FAILE=
D!
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 44
44: Remove thread map                                               : FAILE=
D!
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 45
45: Synthesize cpu map                                              : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 46
46: Synthesize stat config                                          : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 47
47: Synthesize stat                                                 : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 48
48: Synthesize stat round                                           : Ok
2020-12-24 12:52:02 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 49
49: Synthesize attr update                                          : FAILE=
D!
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 50
50: Event times                                                     : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 51
51: Read backward ring buffer                                       : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 52
52: Print cpu map                                                   : FAILE=
D!
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 53
53: Merge cpu map                                                   : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 54
54: Probe SDT events                                                : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 55
55: is_printable_array                                              : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 56
56: Print bitmap                                                    : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 57
57: perf hooks                                                      : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 59
59: unit_number__scnprintf                                          : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 60
60: mem2node                                                        : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 61
61: time utils                                                      : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 62
62: Test jit_write_elf                                              : Ok
2020-12-24 12:52:03 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 63
63: Test libpfm4 support                                            : Skip =
(not compiled in)
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 64
64: Test api io                                                     : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 65
65: maps__merge_in                                                  : FAILE=
D!
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 66
66: Demangle Java                                                   : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 67
67: Parse and process metrics                                       : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 68
68: PE file support                                                 : FAILE=
D!
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 69
69: Event expansion for cgroups                                     : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 70
70: x86 rdpmc                                                       : Ok
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 71
71: Convert perf time to TSC                                        : FAILE=
D!
2020-12-24 12:52:04 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 72
72: DWARF unwind                                                    : FAILE=
D!
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 73
73: x86 instruction decoder - new instructions                      : Ok
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 74
74: Intel PT packet decoder                                         : Ok
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 75
75: x86 bp modify                                                   : Ok
2020-12-24 12:52:05 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 76
76: probe libc's inet_pton & backtrace it with ping                 : Ok
2020-12-24 12:52:07 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 77
77: Check Arm CoreSight trace data recording and synthesized samples: Skip
2020-12-24 12:52:07 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 78
78: build id cache operations                                       : FAILE=
D!
2020-12-24 12:52:08 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7=
ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 81
81: Zstd perf.data compression/decompression                        : FAILE=
D!

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/perf-sanity-tests.yaml
suite: perf-sanity-tests
testcase: perf-sanity-tests
category: functional
need_memory: 2G
perf-sanity-tests:
  perf_compiler: gcc
job_origin: "/lkp-src/allot/cyclic:p1:linux-devel:devel-hourly/lkp-skl-d04/perf-sanity-tests.yaml"

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-skl-d04
tbox_group: lkp-skl-d04
kconfig: x86_64-rhel-8.3
submit_id: 5fe3ff3470445544196c20e0
job_file: "/lkp/jobs/scheduled/lkp-skl-d04/perf-sanity-tests-gcc-ucode=0xe2-debian-10.4-x86_64-20200603.cgz-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813-20201224-17433-ad87v-0.yaml"
id: a36e0dfa5afd04a7db3aaf1a8c7028b3ae79bbe8
queuer_version: "/lkp-src"

#! hosts/lkp-skl-d04
model: Skylake
nr_cpu: 4
memory: 32G
nr_ssd_partitions: 1
nr_hdd_partitions: 4
hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1ER162_Z4YB7AEL-part*"
ssd_partitions: "/dev/disk/by-id/wwn-0x55cd2e404b64c499-part2"
rootfs_partition: "/dev/disk/by-id/wwn-0x55cd2e404b64c499-part1"
brand: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz

#! include/category/functional
kmsg: 
heartbeat: 
meminfo: 

#! include/perf-sanity-tests
need_linux_perf: true

#! include/queue/cyclic
commit: 8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813

#! include/testbox/lkp-skl-d04
need_kconfig_hw:
- CONFIG_E1000E=y
- CONFIG_SATA_AHCI
ucode: '0xe2'
enqueue_time: 2020-12-24 10:38:44.982170496 +08:00
_id: 5fe3ff3470445544196c20e0
_rt: "/result/perf-sanity-tests/gcc-ucode=0xe2/lkp-skl-d04/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813"

#! schedule options
user: lkp
compiler: gcc-9
LKP_SERVER: internal-lkp-server
head_commit: 1b32c6cf0d6c9a541f095fe99e23c9ecd80eee26
base_commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
branch: linux-devel/devel-hourly-2020122300
rootfs: debian-10.4-x86_64-20200603.cgz
result_root: "/result/perf-sanity-tests/gcc-ucode=0xe2/lkp-skl-d04/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/0"
scheduler_version: "/lkp/lkp/.src-20201224-092605"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
bootloader_append:
- root=/dev/ram0
- user=lkp
- job=/lkp/jobs/scheduled/lkp-skl-d04/perf-sanity-tests-gcc-ucode=0xe2-debian-10.4-x86_64-20200603.cgz-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813-20201224-17433-ad87v-0.yaml
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- branch=linux-devel/devel-hourly-2020122300
- commit=8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/vmlinuz-5.10.0-rc3-01127-g8c3b1ba0e7ea
- max_uptime=2100
- RESULT_ROOT=/result/perf-sanity-tests/gcc-ucode=0xe2/lkp-skl-d04/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/0
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/modules.cgz"
linux_perf_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/linux-perf.cgz"
bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201211.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/perf-sanity-tests_20201111.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/perf-x86_64-fa02fcd94b0c-1_20201126.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20201117.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /lkp/lkp/.src-20201222-091527/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer: 
watchdog: 

#! runtime status
last_kernel: 5.10.0-wt-g9d789f5d070b

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/vmlinuz-5.10.0-rc3-01127-g8c3b1ba0e7ea"
dequeue_time: 2020-12-24 12:52:40.297634523 +08:00

#! /lkp/lkp/.src-20201224-092605/include/site/inn
job_state: finished
loadavg: 1.82 1.10 0.44 1/136 9143
start_time: '1608781335'
end_time: '1608781450'
version: "/lkp/lkp/.src-20201224-092638:04492474:85b1a3dae"

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

make ARCH= EXTRA_CFLAGS=-fno-omit-frame-pointer -fsanitize=undefined -fsanitize=address -C /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf
cd /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf
mkdir -p /pkg
mkdir -p /kbuild/obj/consumer/x86_64-rhel-8.3
cp /pkg/linux/x86_64-rhel-8.3/gcc-9/8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/vmlinux.xz /tmp
unxz -k /tmp/vmlinux.xz
cp /tmp/vmlinux /kbuild/obj/consumer/x86_64-rhel-8.3
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 1
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 2
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 3
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 4
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 5
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 6
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 7
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 8
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 9
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 10
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 11
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 12
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 13
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 14
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 15
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 16
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 17
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 18
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 19
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 20
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 21
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 22
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 23
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 24
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 25
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 26
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 27
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 28
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 29
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 30
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 31
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 32
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 33
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 34
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 35
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 36
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 37
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 38
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 39
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 41
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 43
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 44
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 45
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 46
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 47
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 48
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 49
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 50
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 51
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 52
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 53
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 54
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 55
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 56
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 57
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 59
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 60
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 61
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 62
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 63
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 64
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 65
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 66
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 67
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 68
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 69
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 70
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 71
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 72
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 73
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 74
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 75
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 76
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 77
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 78
sudo /usr/src/perf_selftests-x86_64-rhel-8.3-8c3b1ba0e7ea9a80b0ee4b4445ea59c806787813/tools/perf/perf test 81

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--EeQfGwPcQSOJBaQU--
