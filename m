Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A9F694CA7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8C110E61A;
	Mon, 13 Feb 2023 16:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3161A10E079;
 Mon, 13 Feb 2023 16:27:04 +0000 (UTC)
Date: Mon, 13 Feb 2023 16:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676305621; x=1676564821;
 bh=J1ll3xJ/vi0RaRQGrGqNYUDITd9pMkpC6HdMPOMMWw0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=AOBXVba0cAzlZjslOALKDPv3oLSbAgY6bk+X0cQWZsLgiZqKodIbJvm4jFbaNa+Bb
 gc1+HCNLwctdk2qMmR3UicQOWASJGx5paiXOEXOs2aqVwhFEkebYCQjCLnBA7zm47N
 SjrHKbFakfUBp2nNll8CeNT7MBLBYZZ2z5FSSfypEprUAqfqncgAFcL8k+RoLDqFnk
 D3J7RPLka9rkZ0HAhft4CyFNxYSHjGKms3Ay/3oSZpP9E/uDXdegOCnAAo6dW/HW9P
 HCuf4b67DeojZDo4sM6HUzzkvDtnj+7Tzxc67YJ1GvQWW164HBfg6RfextvYtHlprJ
 RImoJUMf2Jovg==
To: wayland-devel <wayland-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdisplay-info 0.1.0
Message-ID: <eUGSsAPs9QWiofs9rUjNcIffY-PZRaZwsmwUA2NYKBijdqT7cW-4Mv0Lq9k_A6ptlYC8kXnSUV257b-T8AzsfYVJK_MO9shEOyIit_HoU-g=@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the first release of libdisplay-info [1].

libdisplay-info is an EDID and DisplayID library. It provides a
low-level API exposing all of the details of these formats, plus a
high-level API which abstracts these details for common operations.

The API isn't yet stable. For this release, the library includes full
support for EDID, partial support for CTA-861-H, and very basic support
for DisplayID 1.3.

Thanks a lot to all contributors!

[1]: https://gitlab.freedesktop.org/emersion/libdisplay-info

Adarsh G M (1):
      di-edid-decode: help message for the executable

Andrea Pappacoda (1):
      build: stop using meson's implicit setup command

Joshua Ashton (4):
      memory-stream: Factor out memory-stream related code to a new file
      memory-stream: Add memory_stream_cleanup helper
      info: Use memory-stream API for di_info_parse_edid
      info: Use memory_stream_cleanup in di_info_get_serial

Pekka Paalanen (11):
      tests/data: add HP Pavilion 27 Quantum Dot
      edid: fix uint16_t conversion warning
      Get size_t definition for info.h
      readme: mention edid-decode version
      readme: add Using section
      info: add getters for make, model and serial
      test: add high-level API test
      test: make edid-decode-diff.sh easier to run
      editorconfig: add python rules
      ci: install hwdata
      info: use PNP ID database for manufacturer names

Sebastian Wick (22):
      edid: split the detailed timing signal union into separate structs
      cta: make HDR eotfs and descriptors directly accessible from the bloc=
k
      edid: add support for color point descriptors
      edid: add support for Color Management Data descriptors
      edid: use the correct definition for maximum standard timings
      cta: add support for VESA Display Transfer Characteristic data block
      cta: parse short audio descriptors
      edid: add support for CVT timing code descriptors
      cta: include stddef.h for size_t
      ci: always build documentation
      cta: parse HDR Dynamic Metadata Data Block
      cta: add support for YCbCr 4:2:0 Video
      cta: add support for YCbCr 4:2:0 Capability Map
      di-edid-decode/cta: align VIC aspect ratio names
      test: Document where each EDID blob is from
      cdi-edid-decode/cta: Take interlacing into account when printing VICs
      cta: Add new data blocks from CTA-861.6
      edid: Sync On Green Signal only is set if the bit is 0 and not 1
      test: Bump edid-decode to newer version
      cta: add support for InfoFrame Data Block
      build: Set the library version and SOVERSION
      release: Add release instructions and script

Simon Ser (165):
      Add .editorconfig
      ci: add .gitlab-ci.yml
      build: add Meson boilerplate
      build: tweak C warning options
      readme: add goals
      build: turn on -Wconversion
      ci: fix build stage not run in MRs
      Add very basic EDID functions
      Add skeleton for high-level API
      Add di_info_get_edid
      Add di-edid-decode utility
      edid: add vendor and product identification data
      build: enable POSIX.1-2008
      Add di_info_get_product_name
      edid: add low-level API to enumerate extension blocks
      Add edid-decode testing infrastructure
      edid: use hex offsets
      edid: check that the blob size is divisible by the block size
      ci: fix tests with outdated edid-decode
      ci: always upload Meson logs as artifacts
      edid: validate extension block tag
      edid: document where extension block tags are defined
      edid: check extension block count field
      di-edid-decode: print extension block count
      edid: switch to a statically allocated extension array
      di-edid-decode: print block checksum
      ci: add junit report for tests
      ci: enable meson --fatal-meson-warnings
      ci: generate coverage information
      edid: add basic support for display descriptors
      edid: add support for product serial, name and data strings
      build: error out on -Wimplicit
      edid: introduce has_bit
      edid: introduce get_bit_range
      edid: parse digital video input definition
      edid: parse screen size
      edid: parse basic gamma
      edid: parse supported DPMS states
      edid: parse supported color encoding formats
      edid: parse other feature support flags
      di-edid-decode: only print serial number if non-zero
      test: add panasonic-mei96a2-dp EDID
      di-edid-decode: fix hang with a 32 KiB file
      readme: add building section
      readme: document fuzzing setup
      di-edid-decode: add optional arg to specify input filename
      edid: re-order display descriptor declarations in public header
      edid: prefix private functions with "_di_"
      build: set symbol visibility
      ci: mention how to force a container rebuild when pushing
      edid: add support for detailed timing definitions
      di-edid-decode: compute DTD aspect ratio
      edid: parse display range limits descriptor
      di-edid-decode: add missing DI_EDID_EXT_DPVL name
      di-edid-decode: remove default cases for enum switches
      ci: build with both GCC and Clang
      ci: disable parallel jobs for coverage reports
      edid: document that DTD size in mm can be unset
      edid: ignore aspect ratio stored in DTD mm size
      edid: switch to sized integers for DTD
      test/data: add samsung-s27a950d-dp
      edid: parse interlaced/stereo flags from DTDs
      edid: parse display color type
      edid: parse standard timings
      edid: add support for chromaticity coordinates
      Add failure message reporting functions
      edid: report parsing errors with new helpers
      dmt: introduce generated table for DMT data
      edid: add di_edid_standard_timing_get_dmt_id
      cta: introduce new API for CTA-861
      Extract bit helpers into shared header
      cta: add support for misc flags
      cta: add support for enumerating data blocks
      edid: stop setting errno in parse_display_range_limits
      edid: add display range limits type
      test: include edid-decode failure messages in diffs
      di-edid-decode: print failure message
      di-edid-decode: exit with non-zero code on conformance failure
      edid: fix negative errno
      cta: parse colorimetry data blocks
      edid: drop return value for parse_basic_params_features()
      edid: drop return value for parse_chromaticity_coords()
      edid: drop unnecessary ENOTSUP checks
      test/data: add sun-gh19ps-dvi
      edid: fix product year < 2006 in EDID 1.3
      edid: parse DTD signal type
      edid: parse analog and digital flags in DTDs
      info: introduce di_logger
      cta: log failures
      edid: fix typo in di_edid_get_standard_timings() doc comment
      edid: check first byte descriptor is a DTD
      edid: parse established timings I and II
      edid: expose _di_edid_parse_detailed_timing_def
      cta: parse detailed timing definitions
      edid: parse digital video input flags for EDID 1.3-
      edid: parse analog video input params
      ci: update edid-decode
      edid: add prefix to range limits failure messages
      cta: parse HDR static metadata blocks
      edid: refactor parse_standard_timing() with an output param
      edid: add support for standard timings descriptor
      test/edid-decode-diff: do not fail if .diff doesn't exist
      test: rename EDID files with .edid filename extension
      cta: add support for video data blocks
      test/data: add apple-xdr-dp
      Add basic support for DisplayID in EDID extension blocks
      cta: rename di_edid_cta_flags.underscan to it_underscan
      cta: add support for video capability data block
      test/data: add msi-mag321curv-dp
      test/data: add viewsonic-vp2768-dp
      edid: check padding in range limits descriptor
      edid: parse timing data from secondary GTF range limit descriptor
      edid: parse timing data from CVT range limit descriptor
      ci: simplify ci-templates include
      cta: add EDID_CTA_MAX_DATA_BLOCKS
      Add safety assertions when inserting into array
      cta: add missing <stdint.h> include in public header
      dmt: add more timing info
      dmt: add public header
      edid: expose struct di_dmt_timing
      test/data: add acer-p1276
      di-edid-decode: fix inverted text for analog video setup
      test/data: add goldstar-ite6604-hdmi
      edid: parse established timings III
      displayid: parse section size
      displayid: parse product type
      displayid: validate checksum
      displayid: add logging helpers
      displayid: parse data blocks
      Introduce di_gtf_compute()
      displayid: parse type I timings
      displayid: add support for display parameters data block
      di-edid-decode: print preferred flag for type I timing
      Generate HTML documentation
      readme: add link to website
      displayid: add missing includes in public header
      di-edid-decode: split into multiple files
      readme: link to latest code coverage report
      ci: update edid-decode
      info: drop di_info_get_product_name()
      test: add custom-uncommon-cta-vesa
      edid-decode/cta: align data block names with edid-decode
      di-edid-decode/cta: round VESA transfer characteristics
      build: add gen-test-data run target
      build: override dependency for subproject usage
      build: split off di-edid-decode into separate file
      test: fix default path for di-edid-decode
      ci: upgrade to Alpine 3.17
      ci: upgrade edid-decode
      di-edid-decode: add special case for 16:10 aspect ratio
      di-edid-decode: print full established timings III
      dmt: add reduced_blanking field
      di-edid-decode: print DMT reduced blanking flag
      ci: pin Alpine version
      Introduce di_cvt_compute()
      Add code coverage configuration file
      displayid: add support for tiled display topology data block
      cta: add support for VESA DDDB
      cta: add support for speaker allocation data block
      cta: add VIC table
      di-edid-decode/cta: print detailed info for VICs
      readme: fix executable path in fuzzing instructions
      readme: move URL to references list
      readme: document versioning and stability expectations
      build: bump version to 0.1.0

git tag: 0.1.0

https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.1.0/do=
wnloads/libdisplay-info-0.1.0.tar.xz
SHA256: c974a5d345e28a480684d07e01bc20a362f071ae126f110c307b5527ed21c0c0  l=
ibdisplay-info-0.1.0.tar.xz
SHA512: f4d2d8ab2683db2c5ab04a11483dadf575608e0293a79ca2856a83d900bfa21d8ab=
cbac7a8691ac5814b86962721a696f99a6e07d99efbaaa5f38b956e62a145  libdisplay-i=
nfo-0.1.0.tar.xz
PGP:    https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/=
0.1.0/downloads/libdisplay-info-0.1.0.tar.xz.sig
